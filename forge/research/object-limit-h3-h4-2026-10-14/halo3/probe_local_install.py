#!/usr/bin/env python3
"""Read-only, bounded inventory of Halo 3 engine/map sources and MCC support data.

Does not execute or modify an installed target, inspect user account state, or
infer engine object capacities from common-front-end strings.
"""
import hashlib
import json
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path('/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection')
OUT = Path(__file__).resolve().parent


def record(path):
    relative = str(path.relative_to(ROOT))
    if not path.exists():
        return {'relative_path': relative, 'exists': False}
    if path.is_dir():
        children = sorted(str(p.relative_to(path)) for p in path.rglob('*'))
        return {'relative_path': relative, 'exists': True, 'kind': 'directory',
                'recursive_entries': children, 'recursive_entry_count': len(children)}
    data = path.read_bytes()
    return {'relative_path': relative, 'exists': True, 'kind': 'file',
            'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}


result = {
    'observed_utc': datetime.now(timezone.utc).isoformat(),
    'root': str(ROOT),
    'source_execution_or_modification': False,
    'scope': 'Declared MCC installation, only target engine folders and public-facing support files',
    'paths': [record(ROOT / relative) for relative in [
        'halo3', 'halo3/halo3.dll', 'halo3/maps', 'halo3/map_variants',
        'halo3/hopper_map_variants', 'halo3/game_variants',
        'Data/BuiltInData/Halo3.json', 'Data/BuiltInData/Halo3Controller.json',
        'Data/settings/default.xml', 'Data/settings/optionsdata.xml',
        'MCC/Binaries/Win64/MCC-Win64-Shipping.exe', 'build_tag.txt',
    ]],
}
build = ROOT / 'build_tag.txt'
if build.exists():
    result['build_tag'] = build.read_text().strip()

core_inventory = OUT.parents[3] / 'publisher/investigation/research/static/MCC-Win64-Shipping.exe.json'
if core_inventory.exists():
    existing = json.loads(core_inventory.read_text())
    core = next(item for item in result['paths'] if item['relative_path'].endswith('MCC-Win64-Shipping.exe'))
    result['previous_core_inventory_sha256'] = existing['sha256']
    result['current_core_matches_previous_inventory'] = core['sha256'] == existing['sha256']
    selected = [item for item in existing['strings'] if item['value'] in {
        'Halo3Forge', 'CreateMapVariantFromFile', 'halo3\\map_variants',
    }]
    result['mcc_core_support_strings'] = selected
    result['support_string_interpretation'] = 'Common front-end routing exists; these strings and paths do not prove a game-specific placement capacity.'

(OUT / 'local-install-inventory.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({'halo3_engine_folder': result['paths'][0],
                  'core_hash_matches': result.get('current_core_matches_previous_inventory'),
                  'build_tag': result.get('build_tag')}, indent=2))
