"""Render a whole map for a visual inspection: one framed view per route section, plus a driver's-eye view every STEP WU
around the lap. Blender background script; builds its own scene and writes only PNGs (and an index JSON).

Colours: road grey, railings blue, curbs orange, supports/decor red, checkpoint volumes yellow wire, spawns green.
Usage:
  Blender -b --factory-startup --python inspect_render.py -- objects.json course_manifest.json stock_meshes.json out_dir [step] [views.json]
Then: python contact_sheets.py out_dir   (tiles the driver's-eye views six to a page)
"""
import bpy, json, sys, math, os
from mathutils import Vector
argv = sys.argv[sys.argv.index('--') + 1:]
OBJ, MAN, MESH, OUTDIR = argv[:4]; STEP = float(argv[4]) if len(argv) > 4 else 25.0
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from workspace_paths import terrain_library
LIB = str(terrain_library())
os.makedirs(OUTDIR, exist_ok=True)
meshes = json.load(open(MESH)); objs = json.load(open(OBJ)); man = json.load(open(MAN)); mo = man['objects']

bpy.ops.wm.read_factory_settings(use_empty=True)
scene = bpy.context.scene
with bpy.data.libraries.load(LIB, link=True) as (src, dst): dst.objects = ['Clusters:001']
scene.collection.objects.link(dst.objects[0])


def mat(name, rgba):
    m = bpy.data.materials.new(name); m.diffuse_color = rgba; return m


M = dict(road=mat('road', (.80, .80, .78, 1)), rail=mat('rail', (.25, .45, .90, 1)), curb=mat('curb', (.95, .55, .15, 1)),
         stray=mat('stray', (.85, .08, .06, 1)), cp=mat('cp', (1.0, .9, .1, 1)), spawn=mat('spawn', (.2, .85, .3, 1)))


def frame(o):
    u = Vector(o['up']).normalized(); f = Vector(o['fwd']); f = (f - u * f.dot(u)).normalized(); return f.cross(u).normalized(), f, u


def add_mesh(name, vs, faces, material, wire=False):
    me = bpy.data.meshes.new(name); me.from_pydata(vs, [], faces); me.update()
    ob = bpy.data.objects.new(name, me); scene.collection.objects.link(ob); ob.data.materials.append(material)
    if wire:                                   # Workbench renders solids, so turn the box into a thin cage
        mod = ob.modifiers.new('cage', 'WIREFRAME'); mod.thickness = 0.04; mod.use_replace = True
    return ob


BOX_F = [(0, 1, 2, 3), (4, 5, 6, 7), (0, 1, 5, 4), (1, 2, 6, 5), (2, 3, 7, 6), (3, 0, 4, 7)]
for i, o in enumerate(objs):
    role = mo[i].get('role', '')
    r, f, u = frame(o); p = Vector(o['pos'])
    if role == 'checkpoint' and o.get('shape') == 3:
        hx, hy = o['w'] / 2, o['l'] / 2
        vs = [p + r * x + f * y + u * z for z in (-o['bot'], o['top']) for x, y in ((-hx, -hy), (hx, -hy), (hx, hy), (-hx, hy))]
        add_mesh('cp%d' % i, vs, BOX_F, M['cp'], wire=True); continue
    if role == 'spawn':
        vs = [p + Vector((x, y, z)) * 0.3 for z in (-1, 1) for x, y in ((-1, -1), (1, -1), (1, 1), (-1, 1))]
        add_mesh('sp%d' % i, vs, BOX_F, M['spawn']); continue
    m = meshes.get(o['type'])
    if not m or not m['v']:
        continue
    vs = [p + r * v[0] + f * v[1] + u * v[2] for v in m['v']]
    kind = 'road' if role == 'road' else 'curb' if o['type'] == 'Block, 5x1, Short' else 'rail' if role == 'barrier' else 'stray'
    add_mesh('o%d' % i, vs, m['f'], M[kind])

scene.render.engine = 'BLENDER_WORKBENCH'
sh = scene.display.shading
sh.light = 'STUDIO'; sh.color_type = 'MATERIAL'; sh.show_shadows = True; sh.show_cavity = True; sh.show_object_outline = True
scene.world = bpy.data.worlds.new('bg'); scene.world.color = (.45, .55, .65); sh.background_type = 'WORLD'
scene.render.image_settings.file_format = 'PNG'
cd = bpy.data.cameras.new('cam'); cam = bpy.data.objects.new('cam', cd); scene.collection.objects.link(cam); scene.camera = cam
cd.clip_start = 0.05; cd.clip_end = 3000


def shoot(path, loc, target, ortho=None, lens=22, res=(1280, 800)):
    scene.render.resolution_x, scene.render.resolution_y = res
    cam.location = loc; cam.rotation_euler = (Vector(target) - Vector(loc)).to_track_quat('-Z', 'Y').to_euler()
    if ortho:
        cd.type = 'ORTHO'; cd.ortho_scale = ortho
    else:
        cd.type = 'PERSP'; cd.lens = lens
    scene.render.filepath = path; bpy.ops.render.render(write_still=True)


if len(argv) > 5:                              # optional views.json: [{"name", "loc", "target", "lens"}] instead of the full set
    for v in json.load(open(argv[5])):
        shoot(os.path.join(OUTDIR, v['name'] + '.png'), Vector(v['loc']), Vector(v['target']), lens=v.get('lens', 20), res=(960, 600))
    print('INSPECT_RENDER views', len(json.load(open(argv[5])))); sys.exit(0)

index = dict(sections=[], drive=[])
secs = man['sections']
for k, s in enumerate(secs):
    pts = [Vector(p) for p in s['points']]
    lo = Vector([min(p[j] for p in pts) for j in range(3)]); hi = Vector([max(p[j] for p in pts) for j in range(3)])
    c = (lo + hi) / 2; span = max(hi.x - lo.x, hi.y - lo.y, 24.0)
    loc = c + Vector((0.55, -0.75, 0.9)).normalized() * span * 3
    path = os.path.join(OUTDIR, 'section_%02d.png' % k)
    shoot(path, loc, c, ortho=span * 1.35)
    index['sections'].append(dict(file=os.path.basename(path), section=s['name'], constructed=s['constructed']))

# driver's eye: walk the guide polylines in driving order (the jump gap is flown, not driven)
route = []
for s in secs:
    if s.get('jump'):
        continue
    for p in s['points']:
        if not route or (Vector(p) - Vector(route[-1][0])).length > 1e-6:
            route.append((p, s['name']))
cum = [0.0]
for (a, _), (b, _) in zip(route, route[1:]):
    cum.append(cum[-1] + (Vector(b) - Vector(a)).length)


def at(dist):
    import bisect
    j = min(max(bisect.bisect_left(cum, dist), 1), len(cum) - 1)
    a, b = Vector(route[j - 1][0]), Vector(route[j][0]); t = (dist - cum[j - 1]) / max(cum[j] - cum[j - 1], 1e-9)
    return a + (b - a) * t, route[j][1]


d = 0.0; n = 0
while d < cum[-1] - 1.0:
    p, name = at(d); q, _ = at(min(d + 18.0, cum[-1]))
    path = os.path.join(OUTDIR, 'drive_%03d.png' % n)
    shoot(path, p + Vector((0, 0, 1.4)), q + Vector((0, 0, 0.7)), lens=20, res=(960, 600))
    index['drive'].append(dict(file=os.path.basename(path), section=name, distance_wu=round(d, 1), at=[round(c, 1) for c in p]))
    d += STEP; n += 1
json.dump(index, open(os.path.join(OUTDIR, 'index.json'), 'w'), indent=1)
print('INSPECT_RENDER', len(index['sections']), 'section views', len(index['drive']), 'driver views')
