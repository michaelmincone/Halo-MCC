"""Backdated Blender pose baselines must preserve real imported orientation bits."""
import dataclasses
import json
import os
from pathlib import Path
import sys

import bpy

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'tools'))
from workspace_paths import full_library, stock_template
REPO = HERE.parent / 'Mjolnir-Forge-Editor'
sys.path.insert(0, str(REPO))
os.environ['MJOLNIR_LIBRARY'] = str(full_library())
import Addon
from Addon import mjolnir, palette, provider, state
from Addon.mvarlib import codecs
from Addon.mvarlib.model import MapVariant

bpy.ops.wm.read_factory_settings(use_empty=True)
Addon.register()
P = provider.get_provider()
path = stock_template()
source = path.read_bytes()
loaded = P.load_map_variant(source)
model = MapVariant.from_bytes(source)
slot = next(s for s in model.present_slots() if not s.up_global and s.parent_raw == 0)
record = model.record_for(slot)
old_forward, old_up = codecs.reconstruct_orientation(slot.up_global, slot.up_code, slot.angle)
legacy_record = dataclasses.replace(record, forward=old_forward, up=old_up)
legacy_info = dataclasses.replace(loaded.info, hypothesis={k: v for k, v in loaded.info.hypothesis.items() if k != 'orientation_basis'})
legacy_load = P.LoadResult(legacy_info, [legacy_record], loaded.warnings)
state.set_from_load(bpy.context.scene, source, legacy_load, str(path), '1.0.0', '1.0.0')
palette.ensure_palette()
obj = mjolnir.create_import_object(bpy.context, legacy_record, bpy.context.scene)
mjolnir.capture_pose_baselines(bpy.context, [obj])


def export():
    bpy.context.view_layer.update()
    eo, errors = mjolnir.to_export_object(P, obj, obj.matrix_world)
    assert not errors
    result = P.export_map_variant(source, [eo], P.ExportOptions(imported_slots=[record.slot]))
    assert result.ok, [(e.code, e.message) for e in result.errors]
    return result


untouched = export()
assert untouched.data == source, 'An old .blend baseline rewrote its unchanged orientation'
obj.location.x += 2
moved = export()
again = MapVariant.from_bytes(moved.data)
assert (again.slots[record.slot].up_global, again.slots[record.slot].up_code, again.slots[record.slot].angle) == (slot.up_global, slot.up_code, slot.angle)
assert bpy.ops.forge.refresh_previews() == {'FINISHED'}
refreshed = export()
assert refreshed.data == moved.data, 'Preview migration changed the actual game placement'
pose = mjolnir.pose_from_matrix(obj.matrix_world)
assert mjolnir._angle_between(pose[1], record.forward) < 0.00001
assert mjolnir._angle_between(pose[2], record.up) < 0.00001
assert path.read_bytes() == source
report = dict(slot=record.slot, type_name=record.type_name, no_op_bytes_exact=True,
              moved_orientation_bits_exact=True, preview_migration_kept_export_bytes_exact=True,
              original_unchanged=True)
(HERE / 'research/legacy-orientation-verification.json').write_text(json.dumps(report, indent=2) + '\n')
print('LEGACY_ORIENTATION', json.dumps(report), flush=True)
