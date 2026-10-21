"""Write terrain_grid_2wu.json: Forge World's terrain height on a 2 WU grid (replaces the lost
corkscrew/research/terrain_grid_2wu.json), plus the ground under the water.

Blender background script. Links the terrain (Clusters:001, real 0.328 scale) from the Mjolnir library read-only and
ray-casts straight down at every grid point. `rows` = the first surface hit (the water surface over the sea),
`floor` = the first hit that is not a water material (the lagoon or sea bed). null where nothing is hit.
Usage: Blender -b --factory-startup --python terrain_grid.py -- terrain_grid_2wu.json [step]
"""
import bpy, json, sys
from mathutils import Vector
from mathutils.bvhtree import BVHTree
from pathlib import Path
argv = sys.argv[sys.argv.index('--') + 1:]
OUT = argv[0]; STEP = float(argv[1]) if len(argv) > 1 else 2.0
LIB = str(Path(__file__).resolve().parents[1] / 'Mjolnir-Forge-Editor/Addon/Resources/Halo Reach.blend')
bpy.ops.wm.read_factory_settings(use_empty=True)
with bpy.data.libraries.load(LIB, link=True) as (src, dst):
    dst.objects = ['Clusters:001']
ob = dst.objects[0]; bpy.context.scene.collection.objects.link(ob); bpy.context.view_layer.update()
dg = bpy.context.evaluated_depsgraph_get()
me = ob.evaluated_get(dg).to_mesh(); mw = ob.matrix_world
verts = [mw @ v.co for v in me.vertices]
water = {i for i, m in enumerate(me.materials) if m and 'water' in m.name.lower() and 'underwater' not in m.name.lower()}
polys = [list(p.vertices) for p in me.polygons]
is_water = [p.material_index in water for p in me.polygons]
dry = [p for p, w in zip(polys, is_water) if not w]
top = BVHTree.FromPolygons(verts, polys); bed = BVHTree.FromPolygons(verts, dry)
xs = [v.x for v in verts]; ys = [v.y for v in verts]
x0, x1 = int(min(xs) // STEP * STEP), max(xs); y0, y1 = int(min(ys) // STEP * STEP), max(ys)
rows = []; floor = []
y = y0
while y <= y1:
    r = []; f = []
    x = x0
    while x <= x1:
        h = top.ray_cast(Vector((x, y, 400.0)), Vector((0, 0, -1)))
        g = bed.ray_cast(Vector((x, y, 400.0)), Vector((0, 0, -1)))
        r.append(None if h[0] is None else round(h[0].z, 3)); f.append(None if g[0] is None else round(g[0].z, 3))
        x += STEP
    rows.append(r); floor.append(f); y += STEP
json.dump(dict(x0=x0, y0=y0, step=STEP, materials=[m.name if m else None for m in me.materials], water_materials=sorted(water),
               note='rows[i][j] is z at (x0 + j*step, y0 + i*step); rows = first surface, floor = first non-water surface',
               rows=rows, floor=floor), open(OUT, 'w'))
print('GRID', len(rows), len(rows[0]), 'water materials', [me.materials[i].name for i in water])
