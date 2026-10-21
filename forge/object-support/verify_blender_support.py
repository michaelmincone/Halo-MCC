"""Exercise the actual add-on and local library in factory-startup Blender.

Reads original files; exported bytes are checked in memory and never installed or published.
"""
import hashlib
import json
import os
import sys
from pathlib import Path

import bpy

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'tools'))
from workspace_paths import full_library, STOCK_REACH, blender_executable
FORGE = HERE.parent
REPO = FORGE / 'Mjolnir-Forge-Editor'
sys.path.insert(0, str(REPO))
FULL = full_library()
os.environ['MJOLNIR_LIBRARY'] = str(FULL)
import Addon
from Addon import mjolnir, palette, provider, state

bpy.ops.wm.read_factory_settings(use_empty=True)
Addon.register()
P = provider.get_provider()
data = json.loads((REPO / 'Addon/mvarlib/data/object_support.json').read_text())
names = [row['name'] for row in data['objects']]
all_names = [item[0] for item in palette.search_items(bpy.context.scene)]
assert set(all_names) == set(names) and len(all_names) == 348

icons = set(bpy.types.UILayout.bl_rna.functions['operator'].parameters['icon'].enum_items.keys())
bad_icons = {key: value for key, value in palette.GROUP_ICONS.items() if value not in icons}
assert not bad_icons, bad_icons

game = STOCK_REACH
path = game / 'map_variants/hr_forgeWorld_paradiso.mvar'
source = path.read_bytes()
loaded = P.load_map_variant(source)
state.set_from_load(bpy.context.scene, source, loaded, str(path))
palette.ensure_palette()
scene = bpy.context.scene
scene.forge.scaleConvention = '1X'
instances = []
for i, row in enumerate(data['objects']):
    obj = mjolnir.create_forge_object(bpy.context, row['name'])
    obj.location = ((i % 20) * 2 - 20, (i // 20) * 2 - 20, 10)
    assert mjolnir.forge_type_name(obj) == row['name'], row['name']
    assert obj.forge.objectType == row['id'], row['name']
    assert obj.forge.spawnTime == row['respawn'], row['name']
    assert obj.instance_collection is not None, row['name']
    assert any(child.type == 'MESH' for child in obj.instance_collection.all_objects), row['name']
    assert Path(bpy.path.abspath(obj.instance_collection.library.filepath)).resolve() == FULL.resolve(), row['name']
    instances.append((row, obj))
scene.view_layers[0].update()

export_objects = []
errors = []
for row, obj in instances:
    eo, issues = mjolnir.to_export_object(P, obj, obj.matrix_world, claim_slot=False)
    errors.extend(issue.message for issue in issues)
    export_objects.append(eo)
assert not errors, errors

result = P.export_map_variant(source, export_objects, P.ExportOptions(
    allow_unverified_rotation=True, raise_quota_max=True, fsm_policy='DROP'))
assert result.ok, [(e.code, e.message) for e in result.errors]
again = P.load_map_variant(result.data)
assert len(again.objects) == 348
assert {o.type_name for o in again.objects} == set(names)
assert again.info.quota_count == 145
assert again.info.palette_crc == 0x8B33E8AC
decoded = {o.type_name: o for o in again.objects}
for requested in export_objects:
    got = decoded[requested.type_name]
    assert got.other_a == requested.other_a, requested.type_name
    assert got.other_b == requested.other_b, requested.type_name
    assert got.shape == requested.shape, requested.type_name
assert path.read_bytes() == source

report = dict(browser_entries_before_template=len(all_names),
              library=str(FULL), modeled_instances=len(instances),
              browser_entries_on_paradiso=len(palette.search_items(scene)),
              created=len(instances), exported_and_decoded=len(again.objects),
              source_sha256=hashlib.sha256(source).hexdigest(),
              export_sha256=hashlib.sha256(result.data).hexdigest(),
              native_classes_used=result.stats.get('native_object_definitions', []),
              issue_codes=sorted({x.code for x in result.warnings}),
              native_palette_extension=result.stats.get('native_palette_extension'),
              native_location_codec=result.stats.get('native_location_codec'),
              excluded=[],
              in_game_verified=False)
(HERE / 'research/blender_support_full_palette.json').write_text(json.dumps(report, indent=2) + '\n')
print('BLENDER_SUPPORT', json.dumps(report), flush=True)
