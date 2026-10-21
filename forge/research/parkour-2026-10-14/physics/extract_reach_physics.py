#!/usr/bin/env python3
"""Read installed stock Reach MCC U13 player/character physics without changing it.

Uses pinned Assembly ReachMCC XML schemas and bounded cache reads. Outputs only
JSON; runtime gravity and playable jump distances are intentionally not invented.
"""
import argparse
import hashlib
import json
import math
import mmap
from pathlib import Path
import struct
import xml.etree.ElementTree as ET

SUPPORTED_BUILD = "Jun 21 2023 15:35:31"
SOURCES = Path(__file__).resolve().parent / "sources"
DEFAULT_CACHE = Path("/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection/haloreach/maps/forge_halo.map")


def element(parent, name, kind=None):
    hits = [e for e in parent if e.get("name") == name and (kind is None or e.tag == kind)]
    if len(hits) != 1:
        raise ValueError(f"Expected unique schema element {name!r}; found {len(hits)}")
    return hits[0]


def extract(path):
    source_manifest = json.loads((SOURCES / "manifest.json").read_text())
    for source in source_manifest["files"]:
        actual = hashlib.sha256((SOURCES / source["file"]).read_bytes()).hexdigest()
        if actual != source["sha256"]:
            raise ValueError(f"Pinned schema changed: {source['file']}")
    schemas = {k: ET.parse(SOURCES / f"{k}.xml").getroot() for k in ("matg", "bipd", "scnr")}

    with path.open("rb") as stream, mmap.mmap(stream.fileno(), 0, access=mmap.ACCESS_READ) as data:
        size = len(data)

        def bounded(offset, length):
            if offset < 0 or length < 0 or offset + length > size:
                raise ValueError(f"Out-of-range read {offset:#x}+{length:#x}")
            return offset

        def read(fmt, offset):
            return struct.unpack_from(fmt, data, bounded(offset, struct.calcsize(fmt)))

        u32 = lambda o: read("<I", o)[0]
        i32 = lambda o: read("<i", o)[0]
        i64 = lambda o: read("<q", o)[0]
        i16 = lambda o: read("<h", o)[0]

        def string_at(offset, limit):
            bounded(offset, limit)
            end = data.find(b"\0", offset, offset + limit)
            if end < 0:
                raise ValueError("Unterminated cache string")
            return data[offset:end].decode("utf-8")

        if data[:4] != b"daeh":
            raise ValueError("Expected little-endian MCC cache")
        build = string_at(160, 32)
        if build != SUPPORTED_BUILD:
            raise ValueError(f"Unsupported cache build {build!r}")
        header_magic = (-u32(1228)) & 0xFFFFFFFF
        tag_magic = i64(736) - ((u32(1260) + u32(1236)) & 0xFFFFFFFF)

        def meta(raw):
            signed = raw if raw < 0x80000000 else raw - 0x100000000
            return bounded((signed << 2) + 0x50000000 - tag_magic, 1)

        def block(base, e, cap=4096):
            off = int(e.get("offset"), 0)
            count = i32(base + off)
            stride = int(e.get("elementSize"), 0)
            if not 0 <= count <= cap:
                raise ValueError(f"Implausible block count {count}")
            arr = meta(u32(base + off + 4)) if count else 0
            bounded(arr, count * stride)
            return count, arr, stride

        ti = bounded(i64(744) - tag_magic, 32)
        nclass, ntag = i32(ti), i32(ti + 16)
        if not 0 < nclass < 1024 or not 0 < ntag < 0x80000:
            raise ValueError("Implausible tag counts")
        ca = bounded(i64(ti + 8) - tag_magic, nclass * 16)
        ta = bounded(i64(ti + 24) - tag_magic, ntag * 8)
        classes = [data[ca+i*16:ca+i*16+4][::-1].decode("ascii") for i in range(nclass)]
        if i32(32) != ntag:
            raise ValueError("File-name count differs from tag count")
        names_size = i32(40)
        names = bounded(u32(36) - header_magic, names_size)
        indices = bounded(u32(44) - header_magic, ntag * 4)

        def tag(index):
            if not 0 <= index < ntag:
                raise ValueError("Invalid tag index")
            at = ta + index * 8
            c = i16(at)
            if c < 0:
                return None
            if c >= nclass:
                raise ValueError("Invalid tag group")
            no = i32(indices + index * 4)
            if not 0 <= no < names_size:
                raise ValueError("Invalid tag-name offset")
            return dict(index=index, group=classes[c], name=string_at(names + no, names_size - no),
                        file_offset=meta(u32(at + 4)), file_offset_hex=hex(meta(u32(at + 4))))

        tags = [t for i in range(ntag) if (t := tag(i)) is not None]

        def reference(base, e):
            off = int(e.get("offset"), 0)
            datum = u32(base + off + 12)
            return None if datum == 0xFFFFFFFF else tag(datum & 0xFFFF)

        def fields(base, elements):
            out = {}
            for e in elements:
                off = int(e.get("offset"), 0)
                if e.tag in ("float32", "degree"):
                    value = read("<f", base + off)[0]
                    if not math.isfinite(value):
                        raise ValueError(f"Non-finite physics value {e.get('name')}")
                elif e.tag == "flags16":
                    value = read("<H", base + off)[0]
                elif e.tag in ("flags32", "uint32"):
                    value = u32(base + off)
                else:
                    raise ValueError(f"Unsupported field type {e.tag}")
                row = dict(value=value, relative_offset=hex(off), file_offset=base + off,
                           file_offset_hex=hex(base + off), bytes_le=data[base+off:base+off+(2 if e.tag == "flags16" else 4)].hex())
                if e.tag in ("flags16", "flags32"):
                    row["set_bits"] = [b.get("name") for b in e if value & (1 << int(b.get("index"), 0))]
                if e.tag == "degree":
                    row["raw_unit"] = "radians"
                    row["degrees"] = math.degrees(value)
                if e.get("tooltip"):
                    row["schema_tooltip"] = e.get("tooltip")
                out[e.get("name")] = row
            return out

        globals_tags = [t for t in tags if t["group"] == "matg"]
        scenario_tags = [t for t in tags if t["group"] == "scnr"]
        if len(globals_tags) != 1 or len(scenario_tags) != 1:
            raise ValueError("Expected one matg and one scnr")
        glob = globals_tags[0]
        scenario = scenario_tags[0]
        bsp_schema = element(schemas["scnr"], "Structure BSPs", "tagblock")
        count, arr, stride = block(scenario["file_offset"], bsp_schema, 64)
        bsps = []
        for k in range(count):
            base = arr + k*stride
            bsp_fields = fields(base, [element(bsp_schema, "Flags", "flags16"),
                                      element(bsp_schema, "Custom Gravity Scale", "float32")])
            bsps.append(dict(index=k, file_offset=base, fields=bsp_fields,
                             custom_gravity_enabled=bool(bsp_fields["Flags"]["value"] & (1 << 13)),
                             structure_bsp=reference(base, element(bsp_schema, "Structure BSP"))))
        player_schema = element(schemas["matg"], "Player Information", "tagblock")
        count, arr, stride = block(glob["file_offset"], player_schema, 16)
        players = []
        selected_player = [e for e in player_schema if e.tag == "float32" and
                           (int(e.get("offset"), 0) <= 0x24 or 0xCC <= int(e.get("offset"), 0) <= 0xD8)]
        for k in range(count):
            players.append(dict(index=k, file_offset=arr + k*stride,
                                fields=fields(arr + k*stride, selected_player)))
        representation_schema = element(schemas["matg"], "Player Representation", "tagblock")
        count, arr, stride = block(glob["file_offset"], representation_schema, 16)
        representations = []
        for k in range(count):
            base = arr + k*stride
            pi = i32(base + int(element(representation_schema, "Player Information Index").get("offset"), 0))
            if not 0 <= pi < len(players):
                raise ValueError("Invalid representation player-information index")
            representations.append(dict(index=k, file_offset=base, player_information_index=pi,
                                        third_person_unit=reference(base, element(representation_schema, "Third Person Unit")),
                                        first_person_body_model=reference(base, element(representation_schema, "First Person Body Model"))))

        wanted_names = ["Jump Velocity", "Stun Jumping Penalty", "Maximum Soft Landing Time", "Maximum Hard Landing Time",
                        "Minimum Soft Landing Velocity", "Minimum Hard Landing Velocity", "Maximum Hard Landing Velocity",
                        "Standing Camera Height", "Running Camera Height", "Crouching Camera Height", "Crouch Walking Camera Height",
                        "Crouch Transition Time", "Height Standing", "Height Crouching", "Radius", "Mass",
                        "Maximum Slope Angle", "Downhill Falloff Angle", "Downhill Cutoff Angle", "Uphill Falloff Angle",
                        "Uphill Cutoff Angle", "Downhill Velocity Scale", "Uphill Velocity Scale", "Airborne Reaction Time Scale",
                        "Ground Adhesion Velocity Scale", "Gravity Scale", "Airborne Acceleration Scale"]
        wanted = [element(schemas["bipd"], name, "float32" if "Angle" not in name else "degree") for name in wanted_names]
        physics_flags = [e for e in schemas["bipd"] if e.tag == "flags32" and e.get("offset") == "0x5E8"]
        if len(physics_flags) != 1:
            raise ValueError("Expected physics flags at bipd+0x5E8")
        wanted += physics_flags
        bipeds = []
        for t in [t for t in tags if t["group"] == "bipd"]:
            row = dict(tag=t, fields=fields(t["file_offset"], wanted))
            e = element(schemas["bipd"], "Pill Shapes", "tagblock")
            n, pa, ps = block(t["file_offset"], e, 32)
            row["pill_shapes"] = [dict(index=i, file_offset=pa+i*ps,
                                       radius=read("<f", pa+i*ps+0x40)[0],
                                       bottom=read("<3f", pa+i*ps+0x50), top=read("<3f", pa+i*ps+0x60)) for i in range(n)]
            for pill in row["pill_shapes"]:
                # XML's endpoint labels are preserved, but cached first endpoint
                # may be higher than its second; derive extents without reordering.
                pill["geometric_z_extent"] = [min(pill["bottom"][2], pill["top"][2]) - pill["radius"],
                                                max(pill["bottom"][2], pill["top"][2]) + pill["radius"]]
            row["bound_representations"] = [r["index"] for r in representations
                                             if r["third_person_unit"] and r["third_person_unit"]["index"] == t["index"]]
            bipeds.append(row)
        return dict(schema="reach-parkour.stock-cache-physics/1", cache_path=str(path.resolve()),
                    cache_size_bytes=size, cache_sha256=hashlib.sha256(data).hexdigest(), build=build,
                    cache_internal_name=string_at(192, 32), tag_count=ntag,
                    scenario_tag=scenario, scenario_map_type=read("<B", scenario["file_offset"])[0],
                    scenario_sandbox_origin=read("<3f", scenario["file_offset"]+0x2C),
                    scenario_structure_bsps=bsps,
                    globals_tag=glob, player_information=players, player_representations=representations,
                    bipeds=bipeds, sources=source_manifest,
                    units=dict(speed="world units/second", acceleration="world units/second squared", jump_velocity="world units/second",
                               lengths="cache world units; do not assume Blender unit equality without exporter check", angles="raw radians; degrees also provided"),
                    limitations=["Cache values are not a playable jump-range measurement.",
                                 "Absolute world gravity is not represented by these extracted matg/bipd fields.",
                                 "Biped Gravity Scale and Airborne Acceleration Scale may be zero/default sentinels; runtime semantics require separate evidence.",
                                 "Game variant, player traits, weapons, armor abilities, momentum, collision and runtime integration can alter results.",
                                 "The globals representation linkage does not alone establish campaign/multiplayer trait overrides."])


if __name__ == "__main__":
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--cache", type=Path, default=DEFAULT_CACHE)
    p.add_argument("--output", type=Path)
    args = p.parse_args()
    result = extract(args.cache)
    text = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text)
    else:
        print(text, end="")
