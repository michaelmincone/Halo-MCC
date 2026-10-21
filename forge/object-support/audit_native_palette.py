"""Read the installed cache and variants without executing or modifying Halo."""
import hashlib
import json
import sys
from collections import Counter
from pathlib import Path
import xml.etree.ElementTree as ET

HERE = Path(__file__).resolve().parent
FORGE = HERE.parent
ADDON = FORGE / 'Mjolnir-Forge-Editor/Addon'
sys.dont_write_bytecode = True
sys.path.insert(0, str(FORGE / 'maps/cannon-odyssey/scripts'))
sys.path.insert(0, str(ADDON))
from inspect_cannons import Cache, BC
from mvarlib.model import MapVariant
from mvarlib.edit import learn_class
from native_palette_crc import palette_crc

stock = json.loads((ADDON / 'mvarlib/data/stock_objects.json').read_text())['maps']['Forge World']
preview = {row['id']: row for row in json.loads((FORGE / 'object-catalog/catalog-textured.json').read_text())}
schema_path = FORGE / 'research/parkour-2026-10-14/physics/sources/scnr.xml'
object_schema = FORGE / 'maps/cannon-odyssey/research/physics/sources/bloc.xml'
palette_schema = ET.parse(schema_path).getroot().find("tagblock[@name='Map Variant Palettes']")
mp_schema = ET.parse(object_schema).getroot().find("tagblock[@name='Multiplayer Object']")
mp_type_names = {int(v.get('value'), 0): v.get('name') for v in mp_schema.find("enum8[@name='Type']")}
c = Cache(BC.MCC)
scenario = next(t for t in c.tags.values() if t['group'] == 'scnr')
native = {}
category_layout = []
folder = 0
for palette in c.block(scenario['offset'] + int(palette_schema.get('offset'), 0), 0x14):
    category_name = c.sid(c.u32(palette))
    counts = []
    category_layout.append(counts)
    for entry in c.block(palette + 8, 0x1C):
        entry_name = c.sid(c.u32(entry))
        maximum, price = c.read('<ii', entry + 0x10)
        variants = c.block(entry + 4, 0x18)
        counts.append(len(variants))
        for item, variant in enumerate(variants):
            ref = c.reference(variant + 4)
            row = dict(id=(folder << 8) | item, category=category_name,
                       entry_name=entry_name, variant_name=c.sid(c.u32(variant)),
                       model_variant_name=c.sid(c.u32(variant + 0x14)),
                       ordinary_maximum=maximum, price=price,
                       palette_offset=hex(entry), variant_offset=hex(variant), object=ref)
            if ref:
                row['bounding_radius'] = c.read('<f', ref['offset'] + 0xC)[0]
                row['bounding_offset'] = list(c.read('<3f', ref['offset'] + 0x10))
                properties = c.block(ref['offset'] + int(mp_schema.get('offset'), 0), 0xBC)
                row['multiplayer_properties'] = []
                for at in properties:
                    typ = c.read('<b', at + 1)[0]
                    row['multiplayer_properties'].append(dict(
                        offset=hex(at), type=typ, type_name=mp_type_names.get(typ),
                        fields=c.fields(at, mp_schema)))
                model = c.reference(ref['offset'] + 0x64)
                row['model'] = model
                if model and model['group'] == 'hlmt':
                    row['render_model'] = c.reference(model['offset'])
            native[row['id']] = row
        folder += 1

templates = {}
for path in sorted((c.path.parent.parent / 'map_variants').glob('hr_forgeWorld_*.mvar')):
    data = path.read_bytes()
    model = MapVariant.from_bytes(data)
    templates[path.name] = dict(
        sha256=hashlib.sha256(data).hexdigest(), quota_count=model.fixed.quota_count,
        palette_crc=model.fixed.palette_crc,
        observed={str(tid): sorted({s.cached_type for s in model.present_slots()
                                  if s.folder == tid >> 8 and s.item == tid & 255}) for tid, _, _ in stock},
        learned={str(tid): learn_class(model, tid >> 8, tid & 255) for tid, _, _ in stock})

rows = []
for tid, internal, name in stock:
    n = native.get(tid)
    row = dict(id=tid, name=name, internal=internal, native=n,
               preview=bool(preview[tid]['image']), in_original_menu=bool(preview[tid]['menu']))
    row['template_classes'] = {key: value['learned'][str(tid)] for key, value in templates.items()
                               if tid >> 8 < value['quota_count']}
    row['observed_classes'] = {key: value['observed'][str(tid)] for key, value in templates.items()
                              if value['observed'][str(tid)]}
    if n:
        row['native_multiplayer_classes'] = sorted({p['type'] for p in n.get('multiplayer_properties', [])})
    rows.append(row)

binary = c.path.parent.parent / 'haloreach.dll'
legacy_layout = [list(values) for values in category_layout]
legacy_layout[-1] = legacy_layout[-1][:-1]
controls = [(89, category_layout[:10], 0x20E1C0E1), (144, legacy_layout, 0x3715E608)]
for entry_count, layout, expected_crc in controls:
    assert sum(map(len, layout)) == entry_count and palette_crc(layout) == expected_crc
report = dict(cache=dict(path=str(c.path), build=c.build, sha256=hashlib.sha256(c.data).hexdigest()),
              binary=dict(path=str(binary), sha256=hashlib.sha256(binary.read_bytes()).hexdigest()),
              schemas={str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in (schema_path, object_schema)},
              native_entry_count=folder, native_variant_count=len(native),
              native_budget=c.read('<f', scenario['offset'] + 0x38)[0],
              native_palette_crc=palette_crc(category_layout), category_layout=category_layout,
              palette_crc_evidence=dict(procedure='0x18006bd5c',
                  evidence_id='ev_1980de16eacbd3f6e1f16d19f1e47d6b6c129f11dd96961f7e564b2780d093a6',
                  controls=[dict(entries=n, crc=crc) for n, _, crc in controls]),
              templates=templates, objects=rows)
out = HERE / 'research'
out.mkdir(parents=True, exist_ok=True)
(out / 'native_palette_audit.json').write_text(json.dumps(report, indent=2) + '\n')
summary = dict(recognized=len(stock), native_entries=folder, native_variants=len(native),
               matched=sum(bool(r['native']) for r in rows),
               unmatched=[r['name'] for r in rows if not r['native']],
               native_classes=dict(Counter(tuple(r.get('native_multiplayer_classes', [])) for r in rows)))
summary['native_classes'] = {str(key): value for key, value in summary['native_classes'].items()}
print(json.dumps(summary, indent=2))
