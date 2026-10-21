"""Write piece_boxes.json: the local bounding box (min, max in the piece's own frame, WU) of every stock Forge World
piece that has a model in the Mjolnir asset library. Replaces the lost xbox-logo/research/piece_boxes.json.

Blender background script; reads the library read-only and writes only the output file.
Usage: Blender -b --factory-startup --python make_piece_boxes.py -- piece_boxes.json
"""
import bpy, json, sys
from pathlib import Path
OUT = sys.argv[sys.argv.index('--') + 1]
FORGE = Path(__file__).resolve().parents[1]
LIB = str(FORGE / 'Mjolnir-Forge-Editor/Addon/Resources/Halo Reach.blend')
stock = json.loads((FORGE / 'tools/mjolnir_forge/mvarlib/data/stock_objects.json').read_text())
names = {row[2] for row in stock['maps']['Forge World']}
with bpy.data.libraries.load(LIB, link=False) as (src, dst):
    want = sorted(n for n in src.collections if (not names or n in names))
    dst.collections = want


def walk(col):
    yield from col.objects
    for ch in col.children:
        yield from walk(ch)


out = {}
for c in bpy.data.collections:
    vs = []
    for ob in walk(c):
        if ob.type == 'MESH':
            m = ob.matrix_basis
            vs.extend(m @ v.co for v in ob.data.vertices)
    if vs:
        out[c.name] = dict(min=[min(v[k] for v in vs) for k in range(3)], max=[max(v[k] for v in vs) for k in range(3)])
json.dump(out, open(OUT, 'w'), indent=0, sort_keys=True)
print('BOXES', len(out))
