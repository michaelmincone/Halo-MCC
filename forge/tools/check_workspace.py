#!/usr/bin/env python3
"""Verify the portable Forge build inputs without opening Halo or editing assets."""
import argparse
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from workspace_paths import ROOT, FORGE, BOUNDARIES, NATIVE_RECORDS, full_library, terrain_library


def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def verify(full=False):
    required = ['AGENTS.md', 'forge/racetrack_rules.md', 'forge/parkour/rules.md',
                'forge/object_limit.md', 'forge/map-checks/README.md',
                'forge/object-support/RELEASE.md', 'forge/object-catalog/index.html',
                'forge/Mjolnir-Forge-Editor/Addon/provider.py',
                'forge/tools/terrain_grid_2wu.json', 'forge/tools/piece_boxes.json',
                'forge/tools/palette_costs.json']
    for name in required:
        if not (ROOT / name).is_file():
            raise ValueError('Missing build input: ' + name)
    metadata = json.loads((FORGE / 'object-support/research/full-library-build.json').read_text())
    library = full_library()
    if digest(library) != metadata['library_sha256']:
        raise ValueError('Full library checksum does not match its build record')
    if digest(terrain_library()) != metadata['original_sha256']:
        raise ValueError('Original library/terrain checksum does not match its build record')
    gallery = FORGE / 'object-catalog'
    entries = json.loads((gallery / 'catalog-full.json').read_text())
    sheets = json.loads((gallery / 'sheets.json').read_text())
    if len(entries) != 348 or len({e['id'] for e in entries}) != 348 or len(sheets) != 21:
        raise ValueError('Expected 348 unique previews and 21 picture sheets')
    for relative in [e['image'] for e in entries] + [s['path'] for s in sheets]:
        path = (gallery / relative).resolve()
        if gallery.resolve() not in path.parents or not path.is_file() or path.stat().st_size < 100:
            raise ValueError('Missing catalog image: ' + relative)
    bounds = json.loads(BOUNDARIES.read_text())
    if bounds['schema'] != 'halo-reach.forge-world-boundaries/1' or sum(v['kill'] for v in bounds['volumes']) != 31:
        raise ValueError('Invalid boundary snapshot')
    records = json.loads(NATIVE_RECORDS.read_text())
    if records['schema'] != 'halo-reach.native-record-configs/1' or not records['records']:
        raise ValueError('Missing native record configurations')
    stock = FORGE / 'stock-mvars'
    originals = json.loads((stock / 'manifest.json').read_text())
    for row in originals['files']:
        if digest(stock / row['path']) != row['sha256']:
            raise ValueError('Stock template changed: ' + row['path'])
    files_verified = 0
    if full:
        manifest = json.loads((FORGE / 'build-kit.json').read_text())
        for row in manifest['files']:
            path = ROOT / row['path']
            if not path.is_file() or path.stat().st_size != row['size_bytes'] or digest(path) != row['sha256']:
                raise ValueError('Build-kit file missing or changed: ' + row['path'])
            files_verified += 1
    gaps_path = FORGE / 'historical-gaps.json'
    gaps = json.loads(gaps_path.read_text()) if gaps_path.exists() else []
    return dict(standard_map_build_inputs='PASS', preview_types=len(entries), picture_sheets=len(sheets),
                stock_variants=len(originals['files']), boundary_snapshot_build=bounds['build'],
                native_record_source_files=records['source_file_count'], manifest_files_verified=files_verified,
                historical_gaps=gaps, in_game_verified=False)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--full', action='store_true', help='Hash every archived build-kit file')
    args = parser.parse_args()
    print(json.dumps(verify(args.full), indent=2))
