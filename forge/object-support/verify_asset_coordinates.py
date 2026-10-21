"""Compare extracted native vertices with unmodified bundled library controls."""
import gzip
import json
import math
from pathlib import Path

import bpy
from mathutils import Vector
from mathutils.kdtree import KDTree

HERE = Path(__file__).resolve().parent
LIBRARY = HERE.parent / 'Mjolnir-Forge-Editor/Addon/Resources/Halo Reach.blend'
audit = json.loads((HERE / 'research/native_palette_audit.json').read_text())
names = ['Block, 1x1', 'Block, 1x4', 'Bank, 1x2', 'Railing, Long', 'Rock, Arch']
bpy.ops.wm.read_factory_settings(use_empty=True)
with bpy.data.libraries.load(str(LIBRARY), link=True) as (src, dst):
    dst.collections = names


def tree(points):
    result = KDTree(len(points))
    for i, v in enumerate(points):
        result.insert(v, i)
    result.balance()
    return result


reports = []
for col in dst.collections:
    bpy.context.scene.collection.children.link(col)
    bpy.context.view_layer.update()
    library = [ob.matrix_world @ v.co for ob in col.all_objects if ob.type == 'MESH' for v in ob.data.vertices]
    native_row = next(x for x in audit['objects'] if x['name'] == col.name)
    index = native_row['native']['render_model']['index']
    data = json.loads(gzip.decompress((HERE / f'assets/models/{index}.json.gz').read_bytes()))
    native = [Vector(v) for mesh in data['sections'] for v in mesh['vertices']]
    reference = tree(library)
    rotations = []
    for turn in range(4):
        angle = turn * math.pi / 2
        cs, sn = round(math.cos(angle)), round(math.sin(angle))
        moved = [Vector((cs*v.x-sn*v.y, sn*v.x+cs*v.y, v.z)) for v in native]
        candidate = tree(moved)
        errors = [reference.find(v)[2] for v in moved] + [candidate.find(v)[2] for v in library]
        rotations.append(dict(degrees=turn*90, maximum_error=max(errors), mean_error=sum(errors)/len(errors)))
    winner = min(rotations, key=lambda row: row['maximum_error'])
    reports.append(dict(name=col.name, native_vertices=len(native), library_vertices=len(library),
                        best=winner, candidates=rotations))
    assert winner['maximum_error'] < 0.0002, (col.name, rotations)
    bpy.context.scene.collection.children.unlink(col)

out = dict(native_to_blender='Native forward-X becomes Blender forward-Y: (-y, x, z); original library may have per-asset turns', controls=reports,
           tolerance_wu=0.0002, original_library_modified=False)
(HERE / 'research/asset-coordinate-controls.json').write_text(json.dumps(out, indent=2) + '\n')
print('ASSET_COORDINATES', json.dumps(out), flush=True)
