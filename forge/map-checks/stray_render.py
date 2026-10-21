"""Render a decoded map with stray_check problems colour-coded, so a person or a multimodal agent can look at it.

Blender background script; builds its own scene and writes only PNGs. Red = failed support/decor/duplicate/clipping
pieces, orange = barrier problems, yellow = overlapping decks (warning), grey = everything else. Markers are hidden.
Usage:
  Blender -b --factory-startup --python stray_render.py -- \
      objects.json course_manifest.json stock_meshes.json report.json out_prefix [name:x,y,z:tx,ty,tz:ortho ...]
Without extra views it renders an angled overview and a top view framed on the whole layout.
"""
import bpy, json, sys
from mathutils import Vector
argv = sys.argv[sys.argv.index('--') + 1:]
OBJ, MAN, MESH, REP, OUT = argv[:5]
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from workspace_paths import terrain_library
LIB = str(terrain_library())
meshes = json.load(open(MESH)); objs = json.load(open(OBJ)); mo = json.load(open(MAN))['objects']; rep = json.load(open(REP))

bpy.ops.wm.read_factory_settings(use_empty=True)
scene = bpy.context.scene
with bpy.data.libraries.load(LIB, link=True) as (src, dst): dst.objects = ['Clusters:001']
scene.collection.objects.link(dst.objects[0])


def slots(entries):
    out = set()
    for e in entries:
        for v in e.values():
            for x in (v if isinstance(v, list) else [v]):
                if isinstance(x, dict) and 'slot' in x:
                    out.add(x['slot'])
    return out


red = set().union(*(slots(rep['fail'][k]) for k in ('unsupported', 'floating', 'duplicates')))
red |= {e['piece']['slot'] for e in rep['fail']['clipping']}
orange = slots(rep['fail']['barrier_gap']) | slots(rep['fail']['barrier_pile'])
yellow = slots(rep['warn']['deck_overlap'])


def mat(name, rgba):
    m = bpy.data.materials.new(name); m.diffuse_color = rgba; return m


M = dict(grey=mat('grey', (.78, .78, .76, 1)), red=mat('red', (.85, .08, .06, 1)),
         orange=mat('orange', (1, .55, .05, 1)), yellow=mat('yellow', (.95, .85, .1, 1)))
lo = Vector((1e9,) * 3); hi = Vector((-1e9,) * 3)
for i, o in enumerate(objs):
    m = meshes.get(o['type'])
    if mo[i].get('role') in ('checkpoint', 'spawn') or not m or not m['v']:
        continue
    u = Vector(o['up']).normalized(); f = Vector(o['fwd']); f = (f - u * f.dot(u)).normalized(); r = f.cross(u).normalized()
    p = Vector(o['pos']); vs = [p + r * v[0] + f * v[1] + u * v[2] for v in m['v']]
    me = bpy.data.meshes.new('m%d' % i); me.from_pydata(vs, [], m['f']); me.update()
    ob = bpy.data.objects.new('%04d %s' % (i, o['type']), me); scene.collection.objects.link(ob)
    ob.data.materials.append(M['red' if i in red else 'orange' if i in orange else 'yellow' if i in yellow else 'grey'])
    for v in vs:
        lo = Vector(map(min, lo, v)); hi = Vector(map(max, hi, v))

scene.render.engine = 'BLENDER_WORKBENCH'
sh = scene.display.shading
sh.light = 'STUDIO'; sh.color_type = 'MATERIAL'; sh.show_shadows = True; sh.show_cavity = True; sh.show_object_outline = True
scene.world = bpy.data.worlds.new('bg'); scene.world.color = (.06, .085, .11); sh.background_type = 'WORLD'
scene.render.resolution_x = 1600; scene.render.resolution_y = 1000; scene.render.image_settings.file_format = 'PNG'
centre = (lo + hi) / 2; span = max(hi.x - lo.x, hi.y - lo.y, 20)
views = [('overview', centre + Vector((1, -1.25, 1.0)).normalized() * span * 2, centre, span * 1.15),
         ('top', centre + Vector((0, -0.001, 1)) * span * 2, centre, max(hi.x - lo.x, (hi.y - lo.y) * 1.6) * 1.1)]
for spec in argv[5:]:
    name, a, b, s = spec.split(':')
    views.append((name, Vector(map(float, a.split(','))), Vector(map(float, b.split(','))), float(s)))
for name, loc, target, ortho in views:
    cd = bpy.data.cameras.new(name); co = bpy.data.objects.new(name, cd); scene.collection.objects.link(co)
    co.location = loc; co.rotation_euler = (Vector(target) - Vector(loc)).to_track_quat('-Z', 'Y').to_euler()
    cd.type = 'ORTHO'; cd.ortho_scale = ortho; cd.clip_end = 5000
    scene.camera = co; scene.render.filepath = '%s_%s.png' % (OUT, name); bpy.ops.render.render(write_still=True)
    print('RENDERED', scene.render.filepath, flush=True)
