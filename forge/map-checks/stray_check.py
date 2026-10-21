"""Stray-piece check for a decoded Reach map: every non-road piece must touch or hold up something real.

Blender background script, read-only (writes only the report). Exits with an error when anything fails.
Usage:
  Blender -b --factory-startup --python-exit-code 1 --python stray_check.py -- \
      objects.json course_manifest.json stock_meshes.json report.json

objects.json comes from decode.py (run it on the exported .mvar, not the scene). The manifest gives each object
`role` (road, barrier, support, decor, checkpoint, spawn) and `section`, in the same order as the decoded slots.

FAIL (must be fixed before delivery):
  unsupported   support clusters whose top touches no deck underside (they hold nothing up)
  floating      support/decor clusters that rest on neither terrain nor a road/barrier piece
  duplicates    two pieces of one type stacked inside each other (centres closer than 35% along every native dimension)
  clipping      support/decor pieces passing through a road or barrier piece
  barrier_gap   barriers more than 0.10 WU from every road piece and not resting on terrain
  barrier_pile  barriers overlapping any barrier that is not their neighbour in the same line (see neighbours())
WARN (look at it in the render): deck_overlap, road tiles overlapping a tile that is not their neighbour
"""
import bpy, json, sys, math
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from duplicate_check import near_duplicate_offset
from mathutils import Vector
from mathutils.bvhtree import BVHTree
OBJ, MAN, MESH, OUT = sys.argv[sys.argv.index('--') + 1:]
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from workspace_paths import terrain_library
LIB = str(terrain_library())
TOUCH = 0.05; DECK_GAP = 0.15; GROUND = 0.30; BARRIER_GAP = 0.10; DUP = 0.35
meshes = json.load(open(MESH)); objs = json.load(open(OBJ)); mo = json.load(open(MAN))['objects']
if len(mo) != len(objs):
    raise SystemExit('manifest has %d objects but the map has %d; they must match slot for slot' % (len(mo), len(objs)))
ROLE_ALIAS = {'crossbeam': 'support'}
role = [ROLE_ALIAS.get(m.get('role', ''), m.get('role', 'unknown')) for m in mo]
section = [m.get('section', '') for m in mo]

with bpy.data.libraries.load(LIB, link=True) as (src, dst): dst.objects = ['Clusters:001']
terrain = dst.objects[0]
bpy.context.scene.collection.objects.link(terrain); bpy.context.view_layer.update()  # matrix_world holds the 0.328 scale only once linked
tv = [terrain.matrix_world @ v.co for v in terrain.data.vertices]
tp = [p for p in terrain.data.polygons if 'ocean_water' not in terrain.data.materials[p.material_index].name]
TER = BVHTree.FromPolygons(tv, [list(p.vertices) for p in tp])


def frame(o):
    u = Vector(o['up']).normalized(); f = Vector(o['fwd']); f = (f - u * f.dot(u)).normalized()
    return f.cross(u).normalized(), f, u


V = {}; B = {}; C = {}
for i, o in enumerate(objs):
    m = meshes.get(o['type'])
    if not m or not m['v'] or role[i] in ('checkpoint', 'spawn'):
        continue
    r, f, u = frame(o); p = Vector(o['pos'])
    V[i] = [p + r * v[0] + f * v[1] + u * v[2] for v in m['v']]
    B[i] = BVHTree.FromPolygons(V[i], m['f'])
    c = sum(V[i], Vector()) / len(V[i]); C[i] = (c, max((v - c).length for v in V[i]))
roads = [i for i in B if role[i] == 'road']
barriers = [i for i in B if role[i] == 'barrier']
structs = [i for i in B if role[i] not in ('road', 'barrier')]
dv = []; df = []
for i in roads:
    base = len(dv); dv += V[i]; df += [[base + k for k in f] for f in meshes[objs[i]['type']]['f']]
DECK = BVHTree.FromPolygons(dv, df) if roads else None


def near(i, j, gap=TOUCH):
    (ci, ri), (cj, rj) = C[i], C[j]
    if (ci - cj).length > ri + rj + gap:
        return False
    if B[i].overlap(B[j]):
        return True
    return any(B[j].find_nearest(p, gap)[0] is not None for p in V[i])


def overlaps(i, j):
    (ci, ri), (cj, rj) = C[i], C[j]
    return (ci - cj).length <= ri + rj and bool(B[i].overlap(B[j]))


def dist_to(i, tree, cap):
    best = None
    for p in V[i]:
        h = tree.find_nearest(p, cap)
        if h[0] is not None and (best is None or h[3] < best):
            best = h[3]
    return best


def grounded(i):
    low = min(V[i], key=lambda v: v.z)
    h = TER.ray_cast(low + Vector((0, 0, 50)), Vector((0, 0, -1)), 400)
    return h[0] is not None and low.z - h[0].z <= GROUND


def holds_deck(i):
    if DECK is None:
        return False
    top = max(v.z for v in V[i])
    for p in V[i]:
        if p.z >= top - 0.05:
            h = DECK.ray_cast(p + Vector((0, 0, 0.001)), Vector((0, 0, 1)), DECK_GAP)
            if h[0] is not None:
                return True
    return False


def label(i):
    o = objs[i]
    return dict(slot=i, type=o['type'], role=role[i], section=section[i], pos=[round(c, 2) for c in o['pos']])


rep = dict(fail={k: [] for k in ('unsupported', 'floating', 'duplicates', 'clipping', 'barrier_gap', 'barrier_pile')},
           warn=dict(deck_overlap=[]))

# A joined two-dimensional shell cannot use ordered barrier-line neighbours.
# Opt-in metadata identifies the stock mesh's thin axis. Only physically
# touching, nearby panels whose planes differ by at most 60 degrees may form
# a shell joint. Non-local intersections remain barrier_pile failures. Existing
# manifests without surface_group keep the original behavior.
def surface_joint(i,j):
    a,b=mo[i],mo[j]
    if not a.get('surface_group') or a.get('surface_group')!=b.get('surface_group'):
        return False
    ia,ib=a.get('surface_normal_axis'),b.get('surface_normal_axis')
    if ia not in (0,1,2) or ib not in (0,1,2):return False
    da=[meshes[objs[i]['type']]['max'][k]-meshes[objs[i]['type']]['min'][k] for k in range(3)]
    db=[meshes[objs[j]['type']]['max'][k]-meshes[objs[j]['type']]['min'][k] for k in range(3)]
    if da[ia]!=min(da) or db[ib]!=min(db):return False
    if abs(frame(objs[i])[ia].dot(frame(objs[j])[ib]))<.5:return False
    if (C[i][0]-C[j][0]).length>3.8:return False
    return near(i,j)

surface_ids=[i for i in barriers if mo[i].get('surface_group')]
surface_graph={i:set() for i in surface_ids}
for k,i in enumerate(surface_ids):
    for j in surface_ids[k+1:]:
        if surface_joint(i,j):surface_graph[i].add(j);surface_graph[j].add(i)
surface_roots={i for i in surface_ids if grounded(i) or any(near(i,j,.075) for j in roads)}
surface_seated=set(surface_roots);queue=list(surface_roots)
for i in queue:
    for j in surface_graph[i]-surface_seated:surface_seated.add(j);queue.append(j)
rep['surface_assembly']=dict(panels=len(surface_ids),root_panels=len(surface_roots),
    connected_to_floor=len(surface_seated),local_mesh_joints=sum(map(len,surface_graph.values()))//2,
    joint_rule='Mutual surface group, declared native thin axes, <=60 degree plane angle, centres <=3.8 WU, actual mesh contact within 0.05 WU')

# Support and decor clusters (pieces touching each other count as one structure)
seen = set()
for i in structs:
    if i in seen:
        continue
    cluster = [i]; seen.add(i); k = 0
    while k < len(cluster):
        a = cluster[k]; k += 1
        for j in structs:
            if j not in seen and near(a, j):
                seen.add(j); cluster.append(j)
    rests = any(grounded(j) or any(near(j, r) for r in roads + barriers) for j in cluster)
    item = dict(pieces=[label(j) for j in cluster])
    if any(role[j] == 'support' for j in cluster) and not any(holds_deck(j) for j in cluster):
        rep['fail']['unsupported'].append(item)
    elif not rests:
        rep['fail']['floating'].append(item)
    for j in cluster:
        hit = [label(r) for r in roads + barriers if overlaps(j, r)]
        if hit:
            rep['fail']['clipping'].append(dict(piece=label(j), through=hit))

# Duplicates and near-duplicates
ids = sorted(B)
for x, i in enumerate(ids):
    native_box = meshes[objs[i]['type']]
    for j in ids[x + 1:]:
        if objs[j]['type'] != objs[i]['type']:
            continue
        d = (Vector(objs[i]['pos']) - Vector(objs[j]['pos'])).length
        # The distance heuristic only describes copies with the same complete
        # orientation. Nearby crossing piers, complementary Dish halves and
        # angled bridge junctions are distinct geometry, even with equal up.
        # Disjoint tall shafts / long beams also need real mesh intersection.
        # Test each native dimension: using the longest dimension calls normal
        # overlapping joints between 1-WU-long, 5-WU-wide strips duplicates.
        offset = Vector(objs[j]['pos']) - Vector(objs[i]['pos'])
        if (near_duplicate_offset(offset, frame(objs[i]), native_box['min'], native_box['max'], DUP)
                and Vector(objs[i]['up']).dot(Vector(objs[j]['up'])) > 0.99
                and Vector(objs[i]['fwd']).dot(Vector(objs[j]['fwd'])) > 0.99 and overlaps(i, j)):
            rep['fail']['duplicates'].append(dict(a=label(i), b=label(j), apart_wu=round(d, 3)))

# Barriers: seated on a road (or terrain), and not piled into other barriers
for i in barriers:
    if i in surface_seated:
        continue
    g = dist_to(i, DECK, 5) if DECK else None
    if (g is None or g > BARRIER_GAP) and not grounded(i):
        rep['fail']['barrier_gap'].append(dict(piece=label(i), nearest_road_wu=None if g is None else round(g, 3)))
def neighbours(i, j):
    """Barriers laid end to end in one line may touch. A manifest that names the line (`chain`, `chain_index`) says
    which; otherwise neighbours are pieces of one section at most two slots apart."""
    a, b = mo[i], mo[j]
    if a.get('surface_group') or b.get('surface_group'):
        return j in surface_graph.get(i,set())
    if 'chain' in a and 'chain' in b:
        if a['chain'] != b['chain']:
            return False
        apart = abs(a['chain_index'] - b['chain_index'])
        if a.get('chain_closed') and b.get('chain_closed'):
            length = a.get('chain_length')
            if (isinstance(length, int) and length > 1 and length == b.get('chain_length')
                    and 0 <= a['chain_index'] < length and 0 <= b['chain_index'] < length):
                # The closing pair of an explicitly declared ring are neighbours too.
                apart = min(apart, length - apart)
        return apart <= 1
    return section[i] == section[j] and abs(j - i) <= 2


for x, i in enumerate(barriers):
    for j in barriers[x + 1:]:
        if neighbours(i, j) or not overlaps(i, j):
            continue
        rep['fail']['barrier_pile'].append(dict(a=label(i), b=label(j)))

# Road tiles overlapping a tile that is not their route neighbour (the first and last tile close the lap). The manifest's
# `route_index` gives driving order when slot order differs from it.
roads = sorted(roads, key=lambda i: mo[i].get('route_index', i))
for x, i in enumerate(roads):
    for y in range(x + 2, len(roads)):
        j = roads[y]
        if (x == 0 and y == len(roads) - 1) or not overlaps(i, j):
            continue
        rep['warn']['deck_overlap'].append(dict(a=label(i), b=label(j)))

rep['summary'] = {k: len(v) for k, v in {**rep['fail'], **rep['warn']}.items()}
rep['passed'] = not any(rep['fail'].values())
json.dump(rep, open(OUT, 'w'), indent=1)
print('STRAY_CHECK', 'PASS' if rep['passed'] else 'FAIL', json.dumps(rep['summary']), flush=True)
if not rep['passed']:
    raise SystemExit('stray check failed; see ' + OUT)
