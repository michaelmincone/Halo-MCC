"""Write stock_meshes.json: the stock Forge meshes for every piece type used in a decoded map.

Blender background script. Reads the Mjolnir asset library read-only; writes only the output file.
Usage: Blender -b --factory-startup --python dump_meshes.py -- objects.json stock_meshes.json
"""
import bpy, json, sys
argv = sys.argv[sys.argv.index('--') + 1:]
OBJ, OUT = argv
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from workspace_paths import full_library
LIB = str(full_library())
names = sorted({o['type'] for o in json.load(open(OBJ))})
with bpy.data.libraries.load(LIB, link=False) as (src, dst):
    missing = [n for n in names if n not in src.collections]
    dst.collections = [n for n in names if n in src.collections]


def walk(col):
    yield from col.objects
    for ch in col.children:
        yield from walk(ch)


out = {}
for c in bpy.data.collections:
    if c.name not in names:
        continue
    vs = []; fs = []
    for ob in walk(c):
        if ob.type != 'MESH':
            continue
        start = len(vs); m = ob.matrix_basis
        vs.extend(list(m @ v.co) for v in ob.data.vertices)
        fs.extend([start + i for i in p.vertices] for p in ob.data.polygons)
    mn = [min(v[k] for v in vs) for k in range(3)] if vs else None
    mx = [max(v[k] for v in vs) for k in range(3)] if vs else None
    out[c.name] = dict(v=vs, f=fs, min=mn, max=mx)
json.dump(out, open(OUT, 'w'))
print('DUMPED', len(out), 'types; no mesh in library for:', missing)
