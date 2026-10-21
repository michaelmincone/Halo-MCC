"""Real Blender integration: library switching, native settings and save/reopen."""
import dataclasses
import hashlib
import json
import os
from pathlib import Path
import sys

import bpy

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'tools'))
from workspace_paths import full_library, STOCK_REACH, blender_executable
FORGE = HERE.parent
REPO = FORGE / 'Mjolnir-Forge-Editor'
ORIGINAL = REPO / 'Addon/Resources/Halo Reach.blend'
FULL = full_library()
sys.path.insert(0, str(REPO))
os.environ['MJOLNIR_LIBRARY'] = str(ORIGINAL)
import Addon
from Addon import mjolnir, palette, provider, state

bpy.ops.wm.read_factory_settings(use_empty=True)
Addon.register()
P = provider.get_provider()
game = STOCK_REACH
sources = {name: (game / 'map_variants' / name).read_bytes()
           for name in ['hr_forgeWorld_paradiso.mvar', 'hr_forgeWorld_theCage.mvar']}
source_hashes = {name: hashlib.sha256(data).hexdigest() for name, data in sources.items()}


def export_view(obj):
    eo, issues = mjolnir.to_export_object(P, obj, obj.matrix_world)
    assert not issues, issues
    return eo


paradiso = sources['hr_forgeWorld_paradiso.mvar']
scene = bpy.context.scene
state.set_from_load(scene, paradiso, P.load_map_variant(paradiso), str(game / 'map_variants/hr_forgeWorld_paradiso.mvar'))
assert palette.ensure_palette()
rifle = mjolnir.create_forge_object(bpy.context, 'Assault Rifle')
block = mjolnir.create_forge_object(bpy.context, 'Block, 1x4')
rifle.location = (12, 13, 14)
block.location = (-5, 6, 7)
rifle.forge.otherInfoA = 3
bpy.context.view_layer.update()
before = {obj.name: dataclasses.asdict(export_view(obj)) for obj in [rifle, block]}
assert rifle.instance_collection is None, 'The original library unexpectedly has a rifle model'
old_block_library = block.instance_collection.library.filepath

os.environ['MJOLNIR_LIBRARY'] = str(FULL)
assert palette.ensure_palette()
assert Path(palette.find_collection('Assault Rifle').library.filepath).resolve() == FULL.resolve()
assert bpy.ops.forge.refresh_previews() == {'FINISHED'}
after = {obj.name: dataclasses.asdict(export_view(obj)) for obj in [rifle, block]}
assert before == after, 'Refreshing previews changed export properties or placement'
for obj in [rifle, block]:
    assert obj.instance_collection is not None
    assert Path(bpy.path.abspath(obj.instance_collection.library.filepath)).resolve() == FULL.resolve()
    assert any(child.type == 'MESH' for child in obj.instance_collection.all_objects)

legacy = bpy.data.scenes.new('Legacy weapon settings')
bpy.context.window.scene = legacy
cage = sources['hr_forgeWorld_theCage.mvar']
loaded = P.load_map_variant(cage)
state.set_from_load(legacy, cage, loaded, str(game / 'map_variants/hr_forgeWorld_theCage.mvar'))
record = next(row for row in loaded.objects if row.type_name == 'DMR' and row.cached_type == 0)
weapon = mjolnir.create_import_object(bpy.context, record, legacy)
for obj in bpy.context.selected_objects:
    obj.select_set(False)
weapon.select_set(True)
bpy.context.view_layer.objects.active = weapon
bpy.context.view_layer.update()
pose = weapon.matrix_world.copy()
assert bpy.ops.forge.enable_native_settings() == {'FINISHED'}
assert weapon.forge.cachedType == 1
assert weapon.matrix_world == pose
weapon.forge.otherInfoA = 5
location = mjolnir.create_forge_object(bpy.context, 'Location Name')
location.location = (10, 10, 10)
assert location.forge.otherInfoA == -1
bpy.context.view_layer.update()
result = P.export_map_variant(cage, [export_view(weapon), export_view(location)], P.ExportOptions(
    allow_unverified_rotation=True, raise_quota_max=True, fsm_policy='DROP'))
assert result.ok, [(x.code, x.message) for x in result.errors]
decoded = P.load_map_variant(result.data)
assert next(x for x in decoded.objects if x.type_name == 'DMR').other_a == 5
assert next(x for x in decoded.objects if x.type_name == 'Location Name').other_a == -1

expected = {obj.name: dataclasses.asdict(export_view(obj)) for obj in [weapon, location]}
out = HERE / 'research/blender-roundtrip'
out.mkdir(exist_ok=True)
version = 1
while (out / f'PreviewWorkflow_v{version:02d}.blend').exists():
    version += 1
blend = out / f'PreviewWorkflow_v{version:02d}.blend'
bpy.ops.wm.save_as_mainfile(filepath=str(blend), check_existing=False, compress=True)
bpy.ops.wm.open_mainfile(filepath=str(blend))
assert state.template_bytes(bpy.context.scene) == cage
for name, value in expected.items():
    obj = bpy.data.objects[name]
    assert dataclasses.asdict(export_view(obj)) == value, name
    assert Path(bpy.path.abspath(obj.instance_collection.library.filepath)).resolve() == FULL.resolve()
reopened = P.export_map_variant(cage, [export_view(bpy.data.objects[name]) for name in expected], P.ExportOptions(
    allow_unverified_rotation=True, raise_quota_max=True, fsm_policy='DROP'))
assert reopened.ok, [(x.code, x.message) for x in reopened.errors]
assert reopened.data == result.data, 'Save/reopen changed exported map bytes'
for name, data in sources.items():
    assert (game / 'map_variants' / name).read_bytes() == data

report = dict(library=str(FULL), prior_library=old_block_library, refresh_kept_export_objects_exact=True,
              native_legacy_weapon_clips=5, named_location_none_preserved=True,
              saved_blend=str(blend), save_reopen_kept_export_objects_exact=True,
              save_reopen_kept_export_bytes_exact=True,
              source_variants_unchanged=source_hashes, in_game_verified=False)
(HERE / 'research/preview-workflow-verification.json').write_text(json.dumps(report, indent=2) + '\n')
print('PREVIEW_WORKFLOW', json.dumps(report), flush=True)
