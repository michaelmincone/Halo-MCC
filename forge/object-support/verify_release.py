"""Verify release bytes and start the packaged code in a disposable Blender profile.

The large library is independently APFS-cloned after its ZIP member is hashed;
this avoids reserving another full allocation on this Mac's nearly full disk.
No real Blender profile is modified.
"""
import hashlib
import json
import sys
import os
from pathlib import Path
import subprocess
import tempfile
import zipfile

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'tools'))
from workspace_paths import full_library, STOCK_REACH, blender_executable
REPO = HERE.parent / 'Mjolnir-Forge-Editor'
FULL = full_library()
BLENDER = blender_executable()


def digest_file(path):
    with Path(path).open('rb') as stream:
        return digest_stream(stream)


def digest_stream(stream):
    digest = hashlib.sha256()
    for chunk in iter(lambda: stream.read(1024 * 1024), b''):
        digest.update(chunk)
    return digest.hexdigest()


work = Path(tempfile.mkdtemp(prefix='mjolnir-release-verification-'))
profile = work / 'user_res'
stage = profile / 'scripts/addons/mjolnir_forge'
stage.mkdir(parents=True)
packages = []
for name in ['code-only', 'full-library']:
    path = HERE / 'release' / name / 'mjolnir_forge-1.1.0.zip'
    with zipfile.ZipFile(path) as archive:
        assert archive.testzip() is None
        assert not any('ForgeBridge' in x or '__pycache__' in x for x in archive.namelist())
        for info in archive.infolist():
            rel = Path(info.filename)
            assert not rel.is_absolute() and '..' not in rel.parts
            if info.is_dir():
                continue
            if rel.as_posix() == 'Resources/Halo Reach.blend':
                assert name == 'full-library'
                with archive.open(info) as stream:
                    assert digest_stream(stream) == digest_file(FULL)
            else:
                assert archive.read(info) == (REPO / 'Addon' / rel).read_bytes(), str(rel)
                if name == 'full-library':
                    target = stage / rel
                    target.parent.mkdir(parents=True, exist_ok=True)
                    target.write_bytes(archive.read(info))
        assert ('Resources/Halo Reach.blend' in archive.namelist()) == (name == 'full-library')
        packages.append(dict(kind=name, path=str(path), bytes=path.stat().st_size,
                             sha256=digest_file(path), members=len(archive.namelist())))
(stage / 'Resources').mkdir(exist_ok=True)
subprocess.run(['/bin/cp', '-c', str(FULL), str(stage / 'Resources/Halo Reach.blend')], check=True)
assert digest_file(stage / 'Resources/Halo Reach.blend') == digest_file(FULL)
script = work / 'smoke.py'
script.write_text('''import json
from pathlib import Path
import bpy
import mjolnir_forge
from mjolnir_forge import palette, mjolnir
assert mjolnir_forge.bl_info['version'] == (1, 1, 0)
assert palette.ensure_palette()
names = [x[0] for x in palette.search_items(bpy.context.scene)]
assert len(names) == len(set(names)) == 348
for name in names:
    obj = mjolnir.create_forge_object(bpy.context, name)
    assert obj.instance_collection is not None, name
    assert any(x.type == 'MESH' for x in obj.instance_collection.all_objects), name
    assert Path(bpy.path.abspath(obj.instance_collection.library.filepath)).resolve().is_relative_to(Path(mjolnir_forge.__file__).parent.resolve())
print('PACKAGE_SMOKE_348_MODELED', flush=True)
''')
env = os.environ.copy()
env['BLENDER_USER_RESOURCES'] = str(profile)
env.pop('MJOLNIR_LIBRARY', None)
with (HERE / 'research/package-startup.log').open('w') as log:
    result = subprocess.run([BLENDER, '-b', '--factory-startup', '--python-exit-code', '1',
                             '--addons', 'mjolnir_forge', '--python', str(script)],
                            env=env, stdout=log, stderr=subprocess.STDOUT)
assert result.returncode == 0, result.returncode
assert 'PACKAGE_SMOKE_348_MODELED' in (HERE / 'research/package-startup.log').read_text()
report = dict(packages=packages, packaged_code_matches_source=True,
              bundled_library_matches_verified_library=True,
              startup_created_348_modeled_objects=True,
              isolated_profile=str(profile), actual_user_profile_modified=False,
              library_sha256=digest_file(FULL), in_game_verified=False)
(HERE / 'research/release-verification.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report, indent=2))
