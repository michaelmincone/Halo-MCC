#!/usr/bin/env python3
"""Read stock Forge object/physics metadata without starting or changing MCC.

Uses the existing bounded Forge palette parser, then follows object -> model ->
physics-model references. Default output is JSON on stdout. --output refuses to
overwrite an existing research result. Schema field names are analysis aids;
fixed physics metadata does not prove every runtime physics override is absent.
"""
import argparse
from collections import Counter
import json
import mmap
from pathlib import Path
import struct
import sys

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / "forge/maps/wrong-way/research"))
from extract_palette_costs import extract

DEFAULT_CACHE = Path("/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection/haloreach/maps/forge_halo.map")
SCHEMAS = {
    "object": {
        "url": "https://raw.githubusercontent.com/XboxChaos/Assembly/dev/src/Assembly/Plugins/ReachMCC/bloc.xml",
        "object_type": "0x0:i16", "model_reference": "0x64:tagRef (datum +0xC)",
        "attachments": "0x104:tagblock, stride 0x20",
        "multiplayer_object": "0x140:tagblock, stride 0xBC",
        "mp_type": "0x1:u8", "mp_spawn_timer_type": "0x15:u8",
        "mp_default_spawn_time": "0x16:i16", "mp_default_abandonment_time": "0x18:i16",
        "mp_flags": "0x1A:u16", "mp_spawned_object": "0x28:tagRef (datum +0xC)",
    },
    "model": {
        "url": "https://raw.githubusercontent.com/XboxChaos/Assembly/dev/src/Assembly/Plugins/ReachMCC/hlmt.xml",
        "physics_model_reference": "0x30:tagRef (datum +0xC)",
    },
    "physics_model": {
        "url": "https://raw.githubusercontent.com/XboxChaos/Assembly/dev/src/Assembly/Plugins/ReachMCC/phmo.xml",
        "rigid_bodies": "0x5C:tagblock, stride 0xD0",
        "body_motion_type": "0x1C:u8", "body_mass": "0xB0:f32",
    },
}
MOTION = {0: "Sphere", 1: "Stabilized Sphere", 2: "Box", 3: "Stabilized Box", 4: "Keyframed", 5: "Fixed"}
OBJECT_TYPES = {0: "Biped", 1: "Vehicle", 2: "Weapon", 3: "Equipment", 4: "Terminal", 5: "Projectile", 6: "Scenery", 7: "Machine", 8: "Control", 9: "Sound Scenery", 10: "Crate", 11: "Creature", 12: "Giant", 13: "Effect Scenery"}


def probe(cache):
    palette = extract(cache)
    rows = []
    with cache.open("rb") as fh, mmap.mmap(fh.fileno(), 0, access=mmap.ACCESS_READ) as data:
        size = len(data)

        def read(fmt, at):
            length = struct.calcsize(fmt)
            if not 0 <= at <= size - length:
                raise ValueError(f"Cache read outside input: {at}+{length}")
            return struct.unpack_from(fmt, data, at)[0]

        u = lambda at: read("<I", at)
        i = lambda at: read("<i", at)
        h = lambda at: read("<h", at)
        q = lambda at: read("<q", at)
        magic = q(736) - ((u(1260) + u(1236)) & 0xFFFFFFFF)
        index = q(744) - magic
        class_count, tag_count = i(index), i(index + 16)
        classes, tags = q(index + 8) - magic, q(index + 24) - magic

        def offset(raw):
            value = raw if raw < 0x80000000 else raw - 0x100000000
            at = (value << 2) + 0x50000000 - magic
            if not 0 <= at < size:
                raise ValueError("Tag metadata pointer outside input")
            return at

        def meta(tag):
            if not 0 <= tag < tag_count:
                raise ValueError(f"Tag outside cache: {tag}")
            return offset(u(tags + tag * 8 + 4))

        def tag_class(tag):
            class_index = h(tags + tag * 8)
            if not 0 <= class_index < class_count:
                raise ValueError(f"Invalid class index for tag {tag}")
            return data[classes + class_index * 16:classes + class_index * 16 + 4][::-1].decode("ascii")

        def reference(at, expected=None):
            raw = u(at + 12)
            if raw in (0, 0xFFFFFFFF):
                return None
            tag = raw & 0xFFFF
            if not 0 <= tag < tag_count or (expected and tag_class(tag) != expected):
                raise ValueError(f"Invalid {expected or 'object'} reference: {raw:#x}")
            return tag

        def block(at, stride, maximum):
            count = i(at)
            if not 0 <= count <= maximum:
                raise ValueError(f"Implausible block count {count} at {at}")
            start = offset(u(at + 4)) if count else None
            if count and start + count * stride > size:
                raise ValueError("Tagblock outside input")
            return count, start

        for entry in palette["rows"]:
            for variant in entry["variants"]:
                tag = variant["tag_short_id"]
                cls = tag_class(tag)
                if cls != "bloc":
                    continue
                obj = meta(tag)
                typ = h(obj)
                model = reference(obj + 0x64, "hlmt")
                physics = reference(meta(model) + 0x30, "phmo") if model is not None else None
                multiplayer_count, multiplayer = block(obj + 0x140, 0xBC, 16)
                attachment_count, _ = block(obj + 0x104, 0x20, 1024)
                mp_rows = []
                for n in range(multiplayer_count):
                    at = multiplayer + n * 0xBC
                    flags = read("<H", at + 0x1A)
                    mp_rows.append({
                        "type": data[at + 1],
                        "spawn_timer_type": data[at + 0x15],
                        "spawn_timer_name": {0: "Starts On Death", 1: "Starts On Disturbance"}.get(data[at + 0x15], "unknown"),
                        "default_spawn_time": h(at + 0x16),
                        "default_abandonment_time": h(at + 0x18),
                        "flags": flags,
                        "phased_physics_in_forge": bool(flags & 2),
                        "spawned_object_tag": reference(at + 0x28),
                    })
                bodies = []
                if physics is not None:
                    count, start = block(meta(physics) + 0x5C, 0xD0, 1024)
                    for n in range(count):
                        at = start + n * 0xD0
                        motion = data[at + 0x1C]
                        bodies.append({"index": n, "motion_type": motion, "motion_name": MOTION.get(motion, "unknown"), "mass": read("<f", at + 0xB0)})
                rows.append({
                    "quota_index": entry["quota_index"],
                    "palette_index": entry["palette_index"],
                    "category": entry["category"],
                    "entry_name": entry["entry_name"],
                    "maximum_allowed": entry["maximum_allowed"],
                    "variant_index": variant["variant_index"],
                    "variant_name": variant["name"],
                    "object_tag": tag, "tag_class": cls,
                    "object_type": typ, "object_type_name": OBJECT_TYPES.get(typ, "unknown"),
                    "respawn_registration_type_mask_allows": bool((1 << typ) & 0x50E),
                    "object_metadata_offset": obj,
                    "model_tag": model, "physics_model_tag": physics,
                    "attachments_count": attachment_count,
                    "multiplayer": mp_rows, "rigid_bodies": bodies,
                })
    return {
        "schema": "reach.stock-tag-respawn-physics-probe/1",
        "source_path": palette["source_path"], "source_sha256": palette["source_sha256"],
        "cache_build": palette["build"], "scenario_tag": palette["scenario_tag"],
        "schema_sources_and_offsets": SCHEMAS,
        "native_respawn_registration": {"function": "0x18017b8d0", "allowed_object_type_mask": "0x50E", "allowed_type_ids": [1, 2, 3, 8, 10]},
        "method": "Offline bounded cache reads. Palette parser reused; only bloc tags reported. No target code executed or game files changed.",
        "limitations": ["Tag motion types establish default physics metadata, not all possible runtime overrides.", "A respawn registration type match does not establish that the active engine permits respawn or that all other eligibility flags pass.", "No Xbox load, duplication, falling, abandonment or retention behavior was tested."],
        "object_type_counts": dict(Counter(str(row["object_type"]) for row in rows)),
        "row_count": len(rows), "rows": rows,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cache", type=Path, default=DEFAULT_CACHE)
    parser.add_argument("--output", type=Path, help="Optional new JSON file; existing paths are refused")
    args = parser.parse_args()
    result = json.dumps(probe(args.cache), indent=2, allow_nan=False) + "\n"
    if args.output:
        with args.output.open("x", encoding="utf-8") as output:
            output.write(result)
    else:
        sys.stdout.write(result)


if __name__ == "__main__":
    main()
