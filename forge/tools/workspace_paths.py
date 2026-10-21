"""Resolve the checked-in Forge assets from any checkout or working directory."""
import json
import os
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
FORGE = ROOT / 'forge'
STOCK_REACH = FORGE / 'stock-mvars' / 'haloreach'
BOUNDARIES = FORGE / 'tools' / 'forge_world_bounds.json'
NATIVE_RECORDS = FORGE / 'tools' / 'native_record_configs.json'


def full_library():
    override = os.environ.get('MJOLNIR_LIBRARY')
    if override:
        path = Path(override).expanduser()
    else:
        manifest = FORGE / 'object-support' / 'research' / 'full-library-build.json'
        path = Path(json.loads(manifest.read_text())['library'])
        if not path.is_absolute():
            path = ROOT / path
    if not path.is_file():
        raise FileNotFoundError('Full Forge library is missing: %s. Run git lfs pull.' % path)
    if path.stat().st_size < 1024:
        raise ValueError('Full Forge library is an LFS pointer, not the asset: %s. Run git lfs pull.' % path)
    return path.resolve()


def terrain_library():
    return FORGE / 'Mjolnir-Forge-Editor' / 'Addon' / 'Resources' / 'Halo Reach.blend'


def stock_template(name='hr_forgeWorld_paradiso.mvar'):
    return STOCK_REACH / 'map_variants' / name


def blender_executable():
    candidate = os.environ.get('BLENDER') or shutil.which('blender')
    if candidate:
        return str(Path(candidate).expanduser())
    mac = Path('/Applications/Blender.app/Contents/MacOS/Blender')
    if mac.is_file():
        return str(mac)
    raise FileNotFoundError('Set BLENDER to your Blender executable, or put blender on PATH.')
