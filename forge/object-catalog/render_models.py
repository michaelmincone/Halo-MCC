"""Render the installed Mjolnir asset library, read-only, for an object catalog.

Run with Blender --background --factory-startup --python render_models.py.
Optional arguments after --: --limit N, --force.
"""
import argparse
import json
import sys
from pathlib import Path

import bpy
from mathutils import Vector

HERE = Path(__file__).resolve().parent
FORGE = HERE.parent
DATA = FORGE / 'Mjolnir-Forge-Editor/Addon/mvarlib/data'
LIBRARY = FORGE / 'Mjolnir-Forge-Editor/Addon/Resources/Halo Reach.blend'
parser = argparse.ArgumentParser()
parser.add_argument('--limit', type=int)
parser.add_argument('--force', action='store_true')
parser.add_argument('--textured', action='store_true')
parser.add_argument('--only-helpers', action='store_true')
parser.add_argument('--full', action='store_true')
parser.add_argument('--library', type=Path)
parser.add_argument('--names', nargs='+')
parser.add_argument('--manifest', type=Path)
parser.add_argument('--image-folder')
args = parser.parse_args(sys.argv[sys.argv.index('--') + 1:] if '--' in sys.argv else [])
if args.library:
    LIBRARY = args.library
elif args.full:
    sys.path.insert(0, str(FORGE / 'tools'))
    from workspace_paths import full_library
    LIBRARY = full_library()

stock = json.loads((DATA / 'stock_objects.json').read_text())['maps']['Forge World']
tree = json.loads((DATA / 'palette_tree.json').read_text())
native_definitions = {}
if args.full:
    sys.path.insert(0, str(DATA.parent.parent))
    from mvarlib import catalog
    tree = catalog.browser_tree(tree)
    native_definitions = {row['id']: row for row in json.loads((DATA / 'object_support.json').read_text())['objects']}
menu = {}


def walk(groups, parents=()):
    for group in groups:
        path = parents + (group['name'],)
        for name in group.get('leaves', []):
            menu[name] = ' > '.join(path)
        walk(group.get('groups', []), path)


walk(tree['groups'])
categories = {}
row_meta = {}
category = ''
prior = None
for line in (FORGE / 'forge_world_objects.md').read_text().splitlines():
    if line.startswith('## '):
        category = line[3:]
    if line.startswith('| ') and line.split('|')[1].strip().isdigit():
        cells = [v.strip() for v in line.split('|')[1:-1]]
        if cells[3] == '″' and prior:
            cells[3:7] = prior[3:7]
        categories[int(cells[0])] = category
        row_meta[int(cells[0])] = {'price': cells[5], 'ordinaryQuota': cells[4]}
        prior = cells

out = HERE / (args.image_folder or ('full-textured' if args.full else 'textured' if args.textured else 'images'))
out.mkdir(parents=True, exist_ok=True)
bpy.ops.wm.read_factory_settings(use_empty=True)
wanted = [name for _, _, name in stock if name in menu and (not args.names or name in args.names)]
with bpy.data.libraries.load(str(LIBRARY), link=False) as (source, target):
    target.collections = [name for name in wanted if name in source.collections]
collections = {col.name: col for col in target.collections if col}

scene = bpy.context.scene
scene.render.engine = 'BLENDER_WORKBENCH'
scene.render.resolution_x = 480
scene.render.resolution_y = 360
scene.render.resolution_percentage = 100
scene.render.image_settings.file_format = 'JPEG'
scene.render.image_settings.quality = 91
scene.render.film_transparent = False
scene.display.shading.light = 'STUDIO'
scene.display.shading.color_type = 'MATERIAL'
scene.display.shading.show_shadows = True
scene.display.shading.show_cavity = True
scene.display.shading.cavity_type = 'BOTH'
scene.display.shading.curvature_ridge_factor = 1.5
scene.display.shading.curvature_valley_factor = 1.2
scene.display.shading.show_specular_highlight = True
scene.display.shading.background_type = 'WORLD'
scene.world = bpy.data.worlds.new('Catalog background')
scene.world.color = (0.055, 0.065, 0.085)
cam = bpy.data.objects.new('Catalog camera', bpy.data.cameras.new('Catalog camera'))
scene.collection.objects.link(cam)
scene.camera = cam
cam.data.type = 'ORTHO'
cam.data.clip_start = 0.001
cam.data.clip_end = 100000

if args.textured:
    scene.render.engine = 'BLENDER_EEVEE'
    scene.eevee.taa_render_samples = 32
    scene.world.use_nodes = True
    scene.world.node_tree.nodes['Background'].inputs['Color'].default_value = (0.23, 0.27, 0.34, 1)
    scene.world.node_tree.nodes['Background'].inputs['Strength'].default_value = 0.6
    for label, direction, strength in [
        ('Key', (3, -4, 6), 3.0), ('Fill', (-4, -2, 2), 1.4), ('Rim', (0, 4, 4), 2.0)
    ]:
        light = bpy.data.lights.new(label, 'SUN')
        light.energy = strength
        light.angle = 0.2
        obj = bpy.data.objects.new(label, light)
        scene.collection.objects.link(obj)
        obj.rotation_euler = (-Vector(direction)).to_track_quat('-Z', 'Y').to_euler()

records = []
rendered = 0
for type_id, internal, name in stock:
    if args.names and name not in args.names:
        continue
    record = dict(id=type_id, name=name, internal=internal,
                  category=categories.get(type_id, 'Other'),
                  menu=menu.get(name), image=None)
    record.update(row_meta.get(type_id, {}))
    col = collections.get(name)
    if col is not None:
        scene.collection.children.link(col)
        bpy.context.view_layer.update()
        depsgraph = bpy.context.evaluated_depsgraph_get()
        vertices = []
        for inst in depsgraph.object_instances:
            obj = inst.object
            if obj.type == 'MESH':
                vertices.extend(inst.matrix_world @ v.co for v in obj.data.vertices)
        if vertices:
            helper = (menu.get(name, '').startswith(('Hidden > Invisible', 'Spawning', 'Objectives'))
                      or native_definitions.get(type_id, {}).get('editor_only', False))
            scene.render.engine = 'BLENDER_EEVEE' if args.textured and not helper else 'BLENDER_WORKBENCH'
            record['previewKind'] = 'Editor helper mesh' if helper else ('Textured mesh' if args.textured else 'Shape preview')
            scene.display.shading.color_type = 'SINGLE' if helper else 'MATERIAL'
            scene.display.shading.single_color = (0.3, 0.62, 0.85)
            if helper:
                for obj in col.all_objects:
                    obj.hide_render = False
                    obj.hide_viewport = False
                    obj.hide_set(False)
                    obj.display_type = 'TEXTURED'
                    for material in getattr(obj.data, 'materials', []):
                        if material:
                            material.diffuse_color = (*material.diffuse_color[:3], 1.0)
            low = Vector([min(v[k] for v in vertices) for k in range(3)])
            high = Vector([max(v[k] for v in vertices) for k in range(3)])
            center = (low + high) / 2
            size = max((high - low).length, 0.01)
            direction = Vector((1.35, -1.8, 1.25)).normalized()
            cam.location = center + direction * size * 3
            cam.rotation_euler = (center - cam.location).to_track_quat('-Z', 'Y').to_euler()
            bpy.context.view_layer.update()
            inverse = cam.matrix_world.inverted()
            projected = [inverse @ v for v in vertices]
            width = max(v.x for v in projected) - min(v.x for v in projected)
            height = max(v.y for v in projected) - min(v.y for v in projected)
            # Blender's orthographic scale is the horizontal frame width here.
            cam.data.ortho_scale = max(width, height * 480 / 360, 0.01) * 1.18
            # Center in camera coordinates, including asymmetric meshes.
            midx = (max(v.x for v in projected) + min(v.x for v in projected)) / 2
            midy = (max(v.y for v in projected) + min(v.y for v in projected)) / 2
            cam.location += cam.rotation_euler.to_matrix() @ Vector((midx, midy, 0))
            dest = out / f'{type_id:05d}.jpg'
            if (not dest.exists() or args.force) and (not args.only_helpers or helper):
                scene.render.filepath = str(dest)
                bpy.ops.render.render(write_still=True)
            record['image'] = f'{out.name}/{dest.name}'
            record['dimensions'] = [round(v, 4) for v in (high - low)]
            rendered += 1
            if rendered % 10 == 0:
                print('CATALOG_PROGRESS', rendered, name, flush=True)
        else:
            record['note'] = 'The menu entry has no mesh in the installed asset library.'
        scene.collection.children.unlink(col)
    elif name in menu:
        record['note'] = 'The menu entry has no collection in the installed asset library.'
    else:
        record['note'] = 'No preview model is bundled with this plugin.'
    records.append(record)
    if args.limit and rendered >= args.limit:
        break

manifest = args.manifest or HERE / ('catalog-full.json' if args.full else 'catalog-textured.json' if args.textured else 'catalog.json')
manifest.write_text(json.dumps(records, indent=2))
print('CATALOG_COMPLETE', len(records), 'entries;', rendered, 'mesh previews', flush=True)
