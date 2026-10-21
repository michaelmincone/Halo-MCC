#!/usr/bin/env python3
"""Read simple stock-block collision dimensions; save scalar evidence, never meshes.

Pinned ReachMCC Assembly schemas describe offsets. Bounded ACCESS_READ cache
reads only. No game launch/edit. --output refuses to overwrite an existing file.
"""
import argparse
import hashlib
import json
import math
import mmap
from pathlib import Path
import struct
import sys

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / 'forge/maps/wrong-way/research'))
from extract_palette_costs import extract

COMMIT = 'fd14ef3c46135e9422966c6a64cd926fb0bd23fb'
HERE = Path(__file__).resolve().parent
PHMO = HERE.parent / 'physics/sources/phmo.xml'
SCHEMAS = [HERE / 'sources/hlmt.xml', HERE / 'sources/coll.xml', PHMO]
SELECTED = {'block_1x1', 'block_1x1_flat', 'block_2x2_flat',
            'block_3x3_flat', 'block_4x4_flat', 'block_5x5_flat'}
DEFAULT_CACHE = Path('/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection/haloreach/maps/forge_halo.map')


def probe(cache):
    palette = extract(cache)
    with cache.open('rb') as stream, mmap.mmap(stream.fileno(), 0, access=mmap.ACCESS_READ) as data:
        size = len(data)

        def bounded(at, length):
            if at < 0 or length < 0 or at + length > size:
                raise ValueError('Read outside cache')
            return at

        def read(fmt, at):
            return struct.unpack_from(fmt, data, bounded(at, struct.calcsize(fmt)))

        u = lambda at: read('<I', at)[0]
        i = lambda at: read('<i', at)[0]
        h = lambda at: read('<h', at)[0]
        q = lambda at: read('<q', at)[0]
        f = lambda at: read('<f', at)[0]
        v3 = lambda at: list(read('<3f', at))
        magic = q(736) - ((u(1260) + u(1236)) & 0xFFFFFFFF)
        index = bounded(q(744) - magic, 32)
        nc, nt = i(index), i(index + 16)
        if not 0 < nc <= 1024 or not 0 < nt <= 0x80000:
            raise ValueError('Implausible tag table')
        ca, ta = bounded(q(index + 8) - magic, nc * 16), bounded(q(index + 24) - magic, nt * 8)
        classes = [data[ca+j*16:ca+j*16+4][::-1].decode('ascii') for j in range(nc)]

        def meta(raw):
            signed = raw if raw < 0x80000000 else raw - 0x100000000
            return bounded((signed << 2) + 0x50000000 - magic, 1)

        def tag(n, expected):
            if not 0 <= n < nt:
                raise ValueError('Tag index outside table')
            at = ta + n * 8
            cls = h(at)
            if not 0 <= cls < nc or classes[cls] != expected:
                raise ValueError('Unexpected tag class')
            return meta(u(at + 4))

        def ref(at, expected):
            raw = u(at + 12)
            if raw in (0, 0xFFFFFFFF):
                raise ValueError('Missing model reference')
            n = raw & 0xFFFF
            return n, tag(n, expected)

        def block(at, stride, cap=4096):
            n = i(at)
            if not 0 <= n <= cap:
                raise ValueError('Implausible tagblock count')
            start = meta(u(at + 4)) if n else 0
            bounded(start, n * stride)
            return n, start

        rows = []
        for entry in palette['rows']:
            for variant in entry['variants']:
                name = variant['name']
                if name not in SELECTED:
                    continue
                object_tag = variant['tag_short_id']
                obj = tag(object_tag, 'bloc')
                model_tag, model = ref(obj + 0x64, 'hlmt')
                physics_tag, physics = ref(model + 0x30, 'phmo')
                collision_tag, collision = ref(model + 0x10, 'coll')
                nn, ns = block(model + 0x12C, 0x5C, 256)
                if nn != 1:
                    raise ValueError('Only one-node models supported by this probe')
                translation, rotation = v3(ns + 0xC), list(read('<4f', ns + 0x18))
                node_identity = (h(ns + 4) == -1 and all(abs(c) < 1e-6 for c in translation)
                                 and all(abs(c-e) < 1e-6 for c,e in zip(rotation, [0,0,0,1]))
                                 and abs(f(ns + 0x28)-1) < 1e-6)
                if not node_identity:
                    raise ValueError('Nonidentity model node unsupported')
                rn, rs = block(physics + 0x5C, 0xD0, 256)
                if rn != 1 or h(rs) != 0 or h(rs+0xA8) != 4 or h(rs+0xAA) != 0:
                    raise ValueError('Probe requires one root polyhedron rigid body')
                pn, ps = block(physics + 0xB0, 0xB0, 256)
                vn, vs = block(physics + 0xBC, 0x30, 4096)
                en, es = block(physics + 0xC8, 0x10, 4096)
                if pn != 1 or i(ps+0x80) != 8 or i(ps+0x98) != 6 or vn != 2 or en != 6:
                    raise ValueError('Probe requires eight-corner, six-plane convex shape')
                core = []
                for k in range(vn):
                    xyz = read('<12f', vs + k * 0x30)
                    core.extend([[xyz[j], xyz[4+j], xyz[8+j]] for j in range(4)])
                lo = [min(v[k] for v in core) for k in range(3)]
                hi = [max(v[k] for v in core) for k in range(3)]
                if not all(math.isfinite(c) for v in core for c in v):
                    raise ValueError('Nonfinite convex shape')
                corner_keys = {tuple(0 if abs(v[k]-lo[k]) < 1e-5 else 1 if abs(v[k]-hi[k]) < 1e-5 else 2
                                     for k in range(3)) for v in core}
                axis_plane_count = sum(sum(abs(c) > 1e-5 for c in read('<3f', es + k * 0x10)) == 1 for k in range(en))
                is_box = len(corner_keys) == 8 and all(2 not in p for p in corner_keys) and axis_plane_count == 6
                radius = f(ps + 0x40)
                top_core = max(-read('<4f', es+k*0x10)[3]/read('<4f', es+k*0x10)[2]
                               for k in range(en) if read('<4f', es+k*0x10)[2] > 0.99)
                coll_bsps = []
                rg_n, rg_s = block(collision + 0x20, 0x10, 256)
                for rg in range(rg_n):
                    pm_n, pm_s = block(rg_s+rg*0x10+4, 0x28, 256)
                    for pm in range(pm_n):
                        bsp_n, bsp_s = block(pm_s+pm*0x28+4, 0x70, 256)
                        for bs in range(bsp_n):
                            bsp = bsp_s+bs*0x70
                            if h(bsp) != 0:
                                raise ValueError('Collision BSP has nonroot node')
                            ve_n, ve_s = block(bsp + 0x64, 0x10, 0x10000)
                            pl_n, pl_s = block(bsp + 0x1C, 0x10, 0x10000)
                            su_n, su_s = block(bsp + 0x4C, 0xC, 0x10000)
                            ed_n, ed_s = block(bsp + 0x58, 0xC, 0x10000)
                            verts = [v3(ve_s+k*0x10) for k in range(ve_n)]
                            clo = [min(v[k] for v in verts) for k in range(3)]
                            chi = [max(v[k] for v in verts) for k in range(3)]
                            top_area = 0.0
                            top_surfaces = 0
                            top_invalid_or_slip = 0
                            for sn in range(su_n):
                                sf = su_s+sn*0xC
                                first = read('<H', sf+2)[0]
                                if first >= ed_n:
                                    raise ValueError('Surface edge outside block')
                                current, polygon, seen = first, [], set()
                                while current not in seen:
                                    if not 0 <= current < ed_n:
                                        raise ValueError('Invalid edge chain')
                                    seen.add(current)
                                    st, end, forward, reverse, left, right = read('<6h', ed_s+current*0xC)
                                    if left == sn:
                                        vi, current = st, forward
                                    elif right == sn:
                                        vi, current = end, reverse
                                    else:
                                        raise ValueError('Edge does not belong to surface')
                                    if not 0 <= vi < ve_n:
                                        raise ValueError('Vertex outside block')
                                    polygon.append(verts[vi])
                                if current != first or len(polygon) < 3:
                                    raise ValueError('Nonclosed surface chain')
                                if all(abs(v[2]-chi[2]) < 1e-5 for v in polygon):
                                    area = abs(sum(a[0]*b[1]-b[0]*a[1] for a,b in zip(polygon,polygon[1:]+polygon[:1]))) / 2
                                    top_area += area
                                    top_surfaces += 1
                                    top_invalid_or_slip += bool(read('<B',sf+0xA)[0] & 0x50)
                            coll_bsps.append({'region_index':rg, 'permutation_index':pm, 'bsp_index':bs,
                                              'metadata_offset_hex':hex(bsp), 'node_index':0,
                                              'plane_count':pl_n, 'vertex_count':ve_n, 'surface_count':su_n,
                                              'bounds_min_wu':clo, 'bounds_max_wu':chi,
                                              'top_surface_area_wu2':top_area, 'top_surface_count':top_surfaces,
                                              'top_surface_invalid_or_slip_count':top_invalid_or_slip,
                                              'top_area_matches_rectangle':abs(top_area-(chi[0]-clo[0])*(chi[1]-clo[1])) < 1e-5})
                rows.append({'palette_name':name,'quota_index':entry['quota_index'],
                             'object_tag':object_tag,'model_tag':model_tag,'physics_model_tag':physics_tag,'collision_model_tag':collision_tag,
                             'metadata_offsets_hex':{'object':hex(obj),'model':hex(model),'phmo':hex(physics),'coll':hex(collision)},
                             'model_root_node_identity':node_identity,
                             'rigid_body_motion_type':read('<B',rs+0x1C)[0],
                             'rigid_body_shape_type':4,'rigid_body_shape_index':0,
                             'polyhedron_core_is_axis_aligned_box':is_box,
                             'polyhedron_core_bounds_min_wu':lo,'polyhedron_core_bounds_max_wu':hi,
                             'polyhedron_convex_radius_wu':radius,
                             'top_core_plane_height_wu':top_core,
                             'inferred_havok_top_core_plus_radius_wu':top_core+radius,
                             'collision_bsps':coll_bsps})
    return {'cache_path':str(cache),'cache_build':palette['build'],'cache_sha256':palette['source_sha256'],
            'method':'Read-only stock cache object->model->physics/collision references; identity nodes; scalar convex shape and BSP surface measurements. No raw meshes/vertices/planes saved.',
            'schema_sources':[{'path':str(p),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),
                               'url':f'https://raw.githubusercontent.com/XboxChaos/Assembly/{COMMIT}/src/Assembly/Plugins/ReachMCC/{p.name}'} for p in SCHEMAS],
            'schema_offsets':{'bloc.model_ref':'0x64;datum+0xC','hlmt.coll_ref':'0x10;datum+0xC','hlmt.phmo_ref':'0x30;datum+0xC',
                              'hlmt.nodes':'0x12C;stride0x5C','phmo.rigid_bodies':'0x5C;stride0xD0','rigid_body.shape':'0xA8:type16;0xAA:index16',
                              'phmo.polyhedra':'0xB0;stride0xB0','poly.radius':'0x40:f32','phmo.four_vectors':'0xBC;stride0x30',
                              'phmo.plane_equations':'0xC8;stride0x10','coll.regions':'0x20;stride0x10','region.permutations':'0x4;stride0x28',
                              'permutation.bsps':'0x4;stride0x70','bsp.planes':'0x1C;stride0x10','bsp.surfaces':'0x4C;stride0xC',
                              'bsp.edges':'0x58;stride0xC','bsp.vertices':'0x64;stride0x10'},
            'limitations':['These establish stored collision geometry, not a runtime jump/playtest.',
                           'Core-plus-radius support is an inference from convex-shape fields; independently compare BSP top.',
                           'Use the core XY footprint as a conservative flat-top region, inset further by player footprint and construction allowance.',
                           'Probe only supports the selected simple unscaled upright identity-node stock blocks. Rotated map poses require the decoded object transform.'],
            'rows':rows}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--cache', type=Path, default=DEFAULT_CACHE)
    ap.add_argument('--output', type=Path, required=True)
    args = ap.parse_args()
    result = probe(args.cache)
    with args.output.open('x', encoding='utf-8') as output:
        output.write(json.dumps(result, indent=2, allow_nan=False)+'\n')
    print(json.dumps({'output':str(args.output),'rows':len(result['rows'])}))


if __name__ == '__main__':
    main()
