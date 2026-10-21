"""Build a versioned local full-palette Blender library without changing originals."""
import gzip
import hashlib
import json
import math
import sys
from pathlib import Path

import bpy
from mathutils import Matrix, Quaternion, Vector

HERE = Path(__file__).resolve().parent
FORGE = HERE.parent
REPO = FORGE / 'Mjolnir-Forge-Editor'
ORIGINAL = REPO / 'Addon/Resources/Halo Reach.blend'
sys.path.insert(0, str(REPO))
import Addon

bpy.ops.wm.read_factory_settings(use_empty=True)
Addon.register()
source_hash = hashlib.sha256(ORIGINAL.read_bytes()).hexdigest()
with bpy.data.libraries.load(str(ORIGINAL), link=False) as (src, dst):
    dst.collections = ['Forge World Palette', 'Shape Models']
root = bpy.data.collections['Forge World Palette']
shape_models = bpy.data.collections['Shape Models']
root.use_fake_user = True
shape_models.use_fake_user = True
definitions = json.loads((REPO / 'Addon/mvarlib/data/object_support.json').read_text())['objects']
prefabs = json.loads((HERE / 'assets/prefabs.json').read_text())
shader_definitions = json.loads((HERE / 'assets/materials.json').read_text())
assert len(prefabs) == 158
convert = Matrix.Rotation(math.pi / 2, 4, 'Z')
mesh_cache, material_cache, model_cache, node_cache = {}, {}, {}, {}


def model(index):
    if index not in model_cache:
        model_cache[index] = json.loads(gzip.decompress((HERE / f'assets/models/{index}.json.gz').read_bytes()))
    return model_cache[index]


def transform(row, include_scale=True):
    x, y, z, w = row['rotation']
    q = Quaternion((w, x, y, z))
    q.normalize()
    scale = row.get('scale', 1.0) if include_scale else 1.0
    return Matrix.Translation(Vector(row['position'])) @ q.to_matrix().to_4x4() @ Matrix.Scale(scale, 4)


def node_world(model_id, node_index, active=()):
    if node_index < 0:
        return Matrix.Identity(4)
    key = (model_id, node_index)
    if key not in node_cache:
        assert key not in active, ('Cyclic node graph', key)
        nodes = model(model_id)['nodes']
        assert node_index < len(nodes)
        row = nodes[node_index]
        node_cache[key] = node_world(model_id, row['parent'], active + (key,)) @ transform(row)
    return node_cache[key]


def marker_world(model_id, marker):
    if marker is None:
        return Matrix.Identity(4)
    # Marker scale is an authoring/effect field; physical child-object placement
    # uses its node/marker translation and rotation with object scale one.
    return node_world(model_id, marker['node']) @ transform(marker, include_scale=False)


def material(index):
    if index in material_cache:
        return material_cache[index]
    row = shader_definitions.get(str(index))
    name = row['tag']['name'].split('\\')[-1] if row else 'Native untextured surface'
    mat = bpy.data.materials.new('Native / ' + name)
    mat.use_nodes = True
    mat.diffuse_color = (0.45, 0.48, 0.52, 1)
    bsdf = mat.node_tree.nodes.get('Principled BSDF')
    bsdf.inputs['Roughness'].default_value = 0.48
    if row:
        mat['native_shader'] = row['tag']['name']
        diffuse = row.get('diffuse')
        color = None
        texture = None
        if diffuse:
            texture_path = HERE / 'assets/textures' / Path(diffuse['path']).name
            image = bpy.data.images.load(str(texture_path), check_existing=True)
            image.colorspace_settings.name = 'sRGB'
            texture = mat.node_tree.nodes.new('ShaderNodeTexImage')
            texture.image = image
            uv = mat.node_tree.nodes.new('ShaderNodeUVMap')
            uv.uv_map = 'UVMap'
            scale_x, scale_y, offset_x, offset_y = row['uv_transform']
            multiply = mat.node_tree.nodes.new('ShaderNodeVectorMath')
            multiply.operation = 'MULTIPLY'
            multiply.inputs[1].default_value = (scale_x, scale_y, 1)
            add = mat.node_tree.nodes.new('ShaderNodeVectorMath')
            add.operation = 'ADD'
            add.inputs[1].default_value = (offset_x, 1 - scale_y - offset_y, 0)
            mat.node_tree.links.new(uv.outputs['UV'], multiply.inputs[0])
            mat.node_tree.links.new(multiply.outputs['Vector'], add.inputs[0])
            mat.node_tree.links.new(add.outputs['Vector'], texture.inputs['Vector'])
            color = texture.outputs['Color']
            mat.node_tree.links.new(color, bsdf.inputs['Base Color'])
            if ('decal' in row['tag']['name'].lower() or row['tag']['group'] in ('rmde', 'rmfl')
                    or row.get('options', {}).get('alpha_test') not in (None, 'none', 'off')):
                mat.node_tree.links.new(texture.outputs['Alpha'], bsdf.inputs['Alpha'])
                mat.surface_render_method = 'DITHERED'
        floats = row.get('floats', {})
        emissive = next((v for k, v in floats.items() if k == 'self_illum_color'), None)
        if emissive and max(emissive[:3]) > 0:
            if not diffuse:
                bsdf.inputs['Base Color'].default_value = tuple(emissive[:3]) + (1,)
                mat.diffuse_color = tuple(emissive[:3]) + (1,)
            if row.get('diffuse_usage', '').startswith('self_illum') or not diffuse:
                if color is not None:
                    mat.node_tree.links.new(color, bsdf.inputs['Emission Color'])
                else:
                    bsdf.inputs['Emission Color'].default_value = tuple(emissive[:3]) + (1,)
                bsdf.inputs['Emission Strength'].default_value = 0.35
        if row.get('options', {}).get('albedo') == 'constant_color':
            tint = floats.get('albedo_color', [0.45, 0.48, 0.52, 1])
            if color is None:
                bsdf.inputs['Base Color'].default_value = tuple(tint[:3]) + (1,)
                mat.diffuse_color = tuple(tint[:3]) + (1,)
        blend = row.get('options', {}).get('blend_mode', 'opaque')
        if blend in ('additive', 'alpha_blend', 'pre_multiplied_alpha'):
            # A static transparent/emissive preview of a native effect pass.
            # Game-time colour changes, depth fading and animation are not run.
            transparent = mat.node_tree.nodes.new('ShaderNodeBsdfTransparent')
            emission = mat.node_tree.nodes.new('ShaderNodeEmission')
            if color is not None:
                mat.node_tree.links.new(color, emission.inputs['Color'])
            else:
                emission.inputs['Color'].default_value = tuple((emissive or [0.4, 0.65, 1])[:3]) + (1,)
            emission.inputs['Strength'].default_value = 1
            mix = mat.node_tree.nodes.new('ShaderNodeMixShader')
            mix.inputs[0].default_value = 0.15
            if texture is not None:
                brightness = mat.node_tree.nodes.new('ShaderNodeRGBToBW')
                mat.node_tree.links.new(texture.outputs['Color'], brightness.inputs[0])
                mat.node_tree.links.new(brightness.outputs[0], mix.inputs[0])
            mat.node_tree.links.new(transparent.outputs[0], mix.inputs[1])
            mat.node_tree.links.new(emission.outputs[0], mix.inputs[2])
            output = mat.node_tree.nodes.get('Material Output')
            mat.node_tree.links.new(mix.outputs[0], output.inputs['Surface'])
            mat.surface_render_method = 'DITHERED'
            mat['native_preview_blend'] = blend
    material_cache[index] = mat
    return mat


def mesh(model_id, section_index):
    key = (model_id, section_index)
    if key not in mesh_cache:
        data = model(model_id)
        row = data['sections'][section_index]
        faces, parts = [], []
        for part in row['parts']:
            if part.get('specialized_render', 0) in (1, 5, 7):
                continue
            selected = row['triangles'][part['first']:part['first'] + part['count']]
            parts.append(dict(material=part['material'], first=len(faces), count=len(selected)))
            faces.extend(selected)
        if not row['parts']:
            faces = row['triangles']
        used = sorted({index for tri in faces for index in tri})
        remap = {old: new for new, old in enumerate(used)}
        triangles = [[remap[index] for index in tri] for tri in faces]
        native = bpy.data.meshes.new(f'Native {model_id} section {section_index}')
        native.from_pydata([row['vertices'][i] for i in used], [], triangles)
        native.update()
        if row.get('uv'):
            layer = native.uv_layers.new(name='UVMap')
            for loop in native.loops:
                u, v = row['uv'][used[loop.vertex_index]]
                layer.data[loop.index].uv = (u, 1 - v)
        for shader in data['materials']:
            native.materials.append(material(shader['index'] if shader else -1))
        for part in parts:
            if 0 <= part['material'] < len(native.materials):
                for index in range(part['first'], part['first'] + part['count']):
                    native.polygons[index].material_index = part['material']
        for poly in native.polygons:
            poly.use_smooth = True
        if row.get('normals'):
            native.normals_split_custom_set_from_vertices([row['normals'][i] for i in used])
        native['native_mode'] = data['tag']['name']
        native['native_section'] = section_index
        mesh_cache[key] = native
    return mesh_cache[key]


def populate(collection, prefab, matrix=Matrix.Identity(4), depth=0):
    assert depth < 8
    model_id = prefab['model']
    if model_id is None:
        return
    data = model(model_id)
    for si in prefab['sections']:
        row = data['sections'][si]
        if not row['triangles']:
            continue
        geometry = mesh(model_id, si)
        if not geometry.polygons:
            continue
        ob = bpy.data.objects.new(f'{collection.name} / {depth}:{si}', geometry)
        collection.objects.link(ob)
        pose = matrix
        # MCC's float vertex buffers are already in model-space bind pose,
        # including rigid sections. Applying the bind node again separates
        # wheels/panels from the body. Node transforms are used for sockets only.
        ob.matrix_world = convert @ pose
        ob['native_object'] = prefab['object']['name']
    for child in prefab['children']:
        child_id = child['prefab']['model']
        attachment = marker_world(model_id, child['parent_marker'])
        if child_id is not None:
            attachment = attachment @ marker_world(child_id, child['child_marker']).inverted()
        populate(collection, child['prefab'], matrix @ attachment, depth + 1)


def group_for(path):
    parent = root
    prefix = []
    for label in path:
        prefix.append(label)
        full_name = label if len(prefix) == 1 else ' / '.join(prefix)
        child = next((col for col in parent.children if col.name == full_name or col.name == label), None)
        if child is None:
            child = bpy.data.collections.new(full_name)
            parent.children.link(child)
        parent = child
    return parent


generated = []
for definition in definitions:
    name = definition['name']
    if name not in prefabs:
        continue
    old = bpy.data.collections.get(name)
    if old is not None:
        assert not any(ob.type == 'MESH' for ob in old.all_objects), ('Would replace an existing modeled asset', name)
        bpy.data.collections.remove(old)
    col = bpy.data.collections.new(name)
    group_for(definition['category']).children.link(col)
    populate(col, prefabs[name])
    col['native_type_id'] = definition['id']
    col['native_variant'] = prefabs[name]['selected_variant']
    col['preview_kind'] = 'Native static model; game effects and animation are not simulated'
    assert any(ob.type == 'MESH' for ob in col.all_objects), ('Empty generated preview', name)
    generated.append(name)

all_names = {row['name'] for row in definitions}
modeled = [col.name for col in bpy.data.collections if col.name in all_names
           and any(ob.type == 'MESH' for ob in col.all_objects)]
assert len(generated) == 158 and len(modeled) == 348, (len(generated), len(modeled))
for image in bpy.data.images:
    if image.source == 'FILE' and not image.packed_file:
        image.pack()

version = 1
while (HERE / f'assets/full-v{version:02d}').exists():
    version += 1
out = HERE / f'assets/full-v{version:02d}'
out.mkdir()
target = out / 'Halo Reach.blend'
bpy.ops.wm.save_as_mainfile(filepath=str(target), check_existing=False, compress=True)
assert hashlib.sha256(ORIGINAL.read_bytes()).hexdigest() == source_hash
report = dict(library=str(target), generated=generated, model_count=len(modeled),
              original_sha256=source_hash, original_unchanged=True,
              library_sha256=hashlib.sha256(target.read_bytes()).hexdigest(),
              packed_images=len([im for im in bpy.data.images if im.packed_file]),
              static_preview_limitations=json.loads((HERE / 'research/native-prefab-extraction.json').read_text()).get('attachment_origin_fallbacks'))
(HERE / 'research/full-library-build.json').write_text(json.dumps(report, indent=2) + '\n')
(out / 'build-report.json').write_text(json.dumps(report, indent=2) + '\n')
print('FULL_LIBRARY', json.dumps({k: v for k, v in report.items() if k != 'generated'}), flush=True)
