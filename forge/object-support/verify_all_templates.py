"""All 348 types on all five shipped Forge World templates, in memory only."""
import hashlib
import json
import math
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'tools'))
from workspace_paths import full_library, STOCK_REACH, blender_executable
ADDON = HERE.parent / 'Mjolnir-Forge-Editor/Addon'
sys.path.insert(0, str(ADDON))
from mvarlib import api, catalog, codecs
from mvarlib.model import MapVariant

game = STOCK_REACH
definitions = json.loads((ADDON / 'mvarlib/data/object_support.json').read_text())['objects']
reports = []
for path in sorted((game / 'map_variants').glob('hr_forgeWorld_*.mvar')):
    source = path.read_bytes()
    objects = []
    for i, row in enumerate(definitions):
        defaults = catalog.new_object_defaults('Forge World', row['name'], source)
        angle = (i % 8) * math.pi / 4
        pitch = (i % 5) * math.pi / 9
        objects.append(api.ExportObject(
            name=row['name'], slot=None, token_raw=None, token_bits=None, type_name=row['name'],
            position=((i % 20) * 2 - 20, (i // 20) * 2 - 20, 10),
            forward=(-math.sin(angle)*math.cos(pitch), math.cos(angle)*math.cos(pitch), math.sin(pitch)),
            up=(math.sin(angle)*math.sin(pitch), -math.cos(angle)*math.sin(pitch), math.cos(pitch)),
            cached_type=defaults['cached_type'], shape=defaults['shape'],
            width=defaults['width'], length=defaults['length'], top=defaults['top'], bottom=defaults['bottom'],
            spawn_time=defaults['respawn'], physics=defaults['physics'],
            symmetry=defaults['symmetry'], place_at_start=defaults['place_at_start'], game_specific=defaults['game_specific'],
            other_a=3 if row['cached_type'] == 1 else 7 if row['cached_type'] in (12, 13, 14, 19) else 0,
            other_b=17 if row['cached_type'] in (12, 13, 14) else 0))
    result = api.export_map_variant(source, objects, api.ExportOptions(
        allow_unverified_rotation=True, raise_quota_max=True, fsm_policy='DROP'))
    assert result.ok, (path.name, [(x.code, x.message) for x in result.errors])
    model = MapVariant.from_bytes(result.data)
    records = {o.type_name: o for o in model.objects()}
    assert len(records) == 348
    for request in objects:
        got = records[request.type_name]
        assert got.cached_type == request.cached_type
        assert (got.other_a, got.other_b) == (request.other_a, request.other_b)
        assert got.shape == request.shape
        assert got.spawn_time == request.spawn_time
        for axis in range(3):
            tolerance = codecs.pos_tolerance(model.hypothesis.axis_bits[axis], *model.fixed.bounds[axis*2:axis*2+2])
            assert abs(got.position[axis] - request.position[axis]) <= tolerance + 1e-8
        assert math.dist(got.forward, request.forward) < 0.006
        assert math.dist(got.up, request.up) < 0.006
    assert model.fixed.quota_count == 145 and model.fixed.palette_crc == 0x8B33E8AC
    assert (model.fixed.spent_budget, model.fixed.max_budget) == (21220, 30000)
    clean = [api.ExportObject(name=o.type_name, slot=o.slot, token_raw=o.raw, token_bits=o.raw_bits,
                type_name=o.type_name, type_id_hint=o.type_id, position=o.position, forward=o.forward, up=o.up,
                shape=o.shape, width=o.width, length=o.length, top=o.top, bottom=o.bottom,
                spawn_sequence=o.spawn_sequence, spawn_time=o.spawn_time, cached_type=o.cached_type,
                label_index=o.label_index, physics=o.physics, symmetry=o.symmetry, place_at_start=o.place_at_start,
                game_specific=o.game_specific, team=8 if o.team == -1 else o.team, color=o.color,
                other_a=o.other_a, other_b=o.other_b) for o in model.objects()]
    unchanged = api.export_map_variant(result.data, clean, api.ExportOptions())
    assert unchanged.ok and unchanged.data == result.data
    assert path.read_bytes() == source
    reports.append(dict(template=path.name, source_sha256=hashlib.sha256(source).hexdigest(), objects=348,
                        exported_sha256=hashlib.sha256(result.data).hexdigest(), budget=21220,
                        max_budget=30000, typed_properties_checked=True, pose_checked=True, exact_noop_roundtrip=True))
    print('TEMPLATE_VERIFIED', path.name, '348 types and properties; byte-exact unchanged round trip', flush=True)

(HERE / 'research/all-template-verification.json').write_text(json.dumps(dict(templates=reports, in_game_verified=False), indent=2) + '\n')
