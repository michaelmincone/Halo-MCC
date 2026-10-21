"""Render only the 158 new native previews and merge into the complete gallery."""
import json
import hashlib
from pathlib import Path
import subprocess
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'tools'))
from workspace_paths import full_library, blender_executable
FORGE = HERE.parent
library = str(full_library())
names = list(json.loads((HERE / 'assets/prefabs.json').read_text()))
assert len(names) == 158
renderer = FORGE / 'object-catalog/render_models.py'
library_hash = hashlib.sha256(Path(library).read_bytes()).hexdigest()
config_hash = hashlib.sha256(renderer.read_bytes()).hexdigest()
progress_path = HERE / f'research/preview-batches-{library_hash[:12]}-{config_hash[:8]}.json'
progress = json.loads(progress_path.read_text()) if progress_path.exists() else dict(library=library, rows=[])
fresh_by_name = {row['name']: row for row in progress['rows']}
remaining = [name for name in names if name not in fresh_by_name]
for index in range(0, len(remaining), 12):
    batch = remaining[index:index+12]
    manifest = HERE / f'research/preview-batch-{index//12:02d}.json'
    command = [blender_executable(), '--background', '--factory-startup',
               '--threads', '2', '--python-exit-code', '1', '--python', str(renderer),
               '--', '--full', '--textured', '--force', '--library', library, '--manifest', str(manifest), '--names'] + batch
    subprocess.run(command, check=True)
    rendered = json.loads(manifest.read_text())
    assert len(rendered) == len(batch) and all(row['image'] for row in rendered)
    fresh_by_name.update({row['name']: row for row in rendered})
    progress['rows'] = list(fresh_by_name.values())
    progress_path.write_text(json.dumps(progress, indent=2))
    print('PREVIEW_BATCH_COMPLETE', len(fresh_by_name), 'of', len(names), flush=True)
catalog = FORGE / 'object-catalog/catalog-full.json'
rows = {row['id']: row for row in json.loads(catalog.read_text())}
fresh = list(fresh_by_name.values())
assert len(fresh) == 158 and all(row['image'] for row in fresh)
rows.update({row['id']: row for row in fresh})
assert len(rows) == 348 and all(row['image'] for row in rows.values())
catalog.write_text(json.dumps(sorted(rows.values(), key=lambda row: row['id']), indent=2))
subprocess.run([sys.executable, str(FORGE / 'object-catalog/build_gallery.py'), '--full'], check=True)
print('REFRESHED_NATIVE_PREVIEWS', len(fresh), 'and rebuilt the complete 348-picture gallery', flush=True)
