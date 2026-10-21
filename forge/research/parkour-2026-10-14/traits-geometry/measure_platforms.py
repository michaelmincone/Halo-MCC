"""Read stock Blender collections; save scalar geometry only, never game mesh data.

Run Blender -b --factory-startup --python this.py -- platform_dimensions.json.
These are render-mesh measurements, not recovered engine collision surfaces.
"""
import bpy
import hashlib
import json
import sys
from pathlib import Path
from mathutils import Vector

ROOT = Path(__file__).resolve().parents[4]
LIB = ROOT / 'forge/Mjolnir-Forge-Editor/Addon/Resources/Halo Reach.blend'
NAMES = [
    'Block, 1x1', 'Block, 1x1, Flat', 'Block, 1x1, Short',
    'Block, 1x1, Tall', 'Block, 1x1, Tall And Thin',
    'Block, 2x2', 'Block, 2x2, Flat', 'Block, 2x2, Short',
    'Block, 3x3, Flat', 'Block, 4x4, Flat', 'Block, 5x5, Flat',
    'Bridge, Small', 'Wall, Double', 'Wall, Coliseum',
    'Platform, Large', 'Platform, Y',
]
out = Path(sys.argv[sys.argv.index('--') + 1])
with bpy.data.libraries.load(str(LIB), link=True) as (src, dst):
    missing = [name for name in NAMES if name not in src.collections]
    dst.collections = [name for name in NAMES if name in src.collections]
for col in dst.collections:
    bpy.context.scene.collection.children.link(col)
bpy.context.view_layer.update()


def rounded(v):
    return [round(float(x), 6) for x in v]


rows = []
for col in dst.collections:
    vertices = []
    layers = {}
    for ob in col.all_objects:
        if ob.type != 'MESH':
            continue
        vv = [ob.matrix_world @ v.co for v in ob.data.vertices]
        vertices.extend(vv)
        for poly in ob.data.polygons:
            pp = [vv[i] for i in poly.vertices]
            if max(v.z for v in pp) - min(v.z for v in pp) > 1e-5:
                continue
            cross = sum(((pp[i] - pp[0]).cross(pp[i+1] - pp[0])
                         for i in range(1, len(pp)-1)), Vector())
            if cross.z <= 1e-8:
                continue
            z = round(sum(v.z for v in pp) / len(pp), 6)
            layer = layers.setdefault(z, {'height_from_origin_wu': z, 'area_wu2': 0,
                                          'polygon_count': 0, 'xy_bounds': None})
            layer['area_wu2'] += cross.length / 2
            layer['polygon_count'] += 1
            mn = [min(v[k] for v in pp) for k in range(2)]
            mx = [max(v[k] for v in pp) for k in range(2)]
            if layer['xy_bounds']:
                old = layer['xy_bounds']
                mn = [min(mn[k], old[0][k]) for k in range(2)]
                mx = [max(mx[k], old[1][k]) for k in range(2)]
            layer['xy_bounds'] = [mn, mx]
    mn = [min(v[k] for v in vertices) for k in range(3)]
    mx = [max(v[k] for v in vertices) for k in range(3)]
    for layer in layers.values():
        layer['area_wu2'] = round(layer['area_wu2'], 6)
        layer['xy_bounds'] = [rounded(v) for v in layer['xy_bounds']]
    rows.append({'type': col.name, 'bounds_min_wu': rounded(mn),
                 'bounds_max_wu': rounded(mx), 'dimensions_wu': rounded([b-a for a,b in zip(mn,mx)]),
                 'horizontal_upward_render_layers': sorted(layers.values(), key=lambda l:l['height_from_origin_wu'])})
report = {'source': str(LIB), 'source_sha256': hashlib.sha256(LIB.read_bytes()).hexdigest(),
          'coordinate_basis': 'stock collection evaluated matrix_world; neutral object pose; WU == Blender coordinate unit',
          'scope': 'render mesh scalar dimensions and horizontal upward patches, NOT engine collision; XY bounds are not a filled safe landing rectangle',
          'missing_collections': missing, 'platforms': rows}
out.write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({'output': str(out), 'platform_count':len(rows), 'missing':missing}))
