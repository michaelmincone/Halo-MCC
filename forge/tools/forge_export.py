"""Shared exporter: a list of pieces (world poses) -> a new Forge World .mvar, course manifest and build summary.

Rebuilt 2026-10-16 from the export half of statue-of-liberty/scripts/build_liberty.py, using the tilt-capable mvarlib in
forge/tools/mjolnir_forge. Reads the shipped Paradiso Forge World variant read-only and writes only new files; refuses to
overwrite. Nothing launches MCC, installs or publishes anything.

    import sys; sys.path.insert(0, '/Users/michaelmincone/Local_Documents/Halo-MCC/forge/tools')
    import forge_export
    res = forge_export.export(pieces, dest_dir, 'TajMahal_v01', 'TAJ MAHAL', 'description <= 127 chars',
                              bounds_margin=2.0, extra_summary={...})

Each piece is a dict: type (stock Forge World name), pos, fwd, up (world, WU), role, section, and optionally part,
chain, chain_index, channel (teleporters), lift. The optional export_properties dict supplies native colour or a
stock pickup's physics/team/extras. Spawns, teleporters use Bungie's usual records (classes 15, 13, 14).
"""
import sys, os, json, math, time, uuid, hashlib, collections
from pathlib import Path

TOOLS = Path(__file__).resolve().parent
FORGE = TOOLS.parent
sys.dont_write_bytecode = True
sys.path.insert(0, str(TOOLS / 'mjolnir_forge'))
sys.path.insert(0, str(FORGE / 'map-checks'))
from mvarlib import api as P, tables, edit, codecs                        # noqa: E402
from mvarlib.model import MapVariant                                      # noqa: E402
from mvarlib.bitio import BitWriter                                       # noqa: E402
from mvarlib.ugc_header import write_header, encode_u16, build_chdr       # noqa: E402
import bounds_check as BC                                                 # noqa: E402

from workspace_paths import STOCK_REACH, stock_template
MCC = STOCK_REACH
TEMPLATE = stock_template()
COSTS = TOOLS / 'palette_costs.json'
MANIFEST_KEYS = ('part', 'chain', 'chain_index', 'channel', 'lift', 'route_index')


def _eobj(base, name, typ, pos, fwd, up, **kw):
    tid = tables.object_id_for_name('Forge World', typ)
    if tid is None:
        raise SystemExit('not a stock Forge World object: ' + typ)
    ex = edit.learn_example(base, tid >> 8, tid & 255)
    view = codecs.placement_view(ex[0][0] if ex else edit.DEFAULT_PLACEMENT)
    opts = dict(name=name, slot=None, token_raw=None, token_bits=None, type_name=typ, position=tuple(map(float, pos)),
                forward=tuple(map(float, fwd)), up=tuple(map(float, up)), physics=1, symmetry=view.symmetry,
                place_at_start=view.place_at_start, game_specific=view.game_specific, team=8, color=-1, cached_type=0)
    opts.update(kw)
    return P.ExportObject(**opts)


def export(pieces, dest, stem, title, description, bounds_margin=2.0, extra_summary=None, sections=None, author=b'Michael\0'):
    dest = Path(dest); target = dest / (stem + '.mvar')
    version = stem.rsplit('_', 1)[-1]
    if len(description) > 127 or len(title) > 127:
        raise SystemExit('title/description too long')
    if len(pieces) > 650:
        raise SystemExit('too many objects: %d' % len(pieces))
    if target.exists():
        raise SystemExit('refusing to overwrite ' + str(target))
    source = TEMPLATE.read_bytes(); base = MapVariant.from_bytes(source)
    plan = []
    for k, p in enumerate(pieces):
        row = dict(role=p['role'], section=p['section'])
        for key in MANIFEST_KEYS:
            if key in p:
                row[key] = p[key]
        name = '%s %s %d' % (p['section'], p['type'], k)
        t = p['type']
        if t == 'Initial Spawn':
            eo = _eobj(base, name, t, p['pos'], p['fwd'], p['up'], physics=3, cached_type=15, game_specific=True)
        elif t == 'Respawn Point':
            eo = _eobj(base, name, t, p['pos'], p['fwd'], p['up'], physics=1, cached_type=15, game_specific=False)
        elif t == 'Sender Node':
            eo = _eobj(base, name, t, p['pos'], p['fwd'], p['up'], physics=3, cached_type=13, other_a=p['channel'], other_b=0,
                       shape=2, width=0.24, length=0.0, top=1.03, bottom=0.0)
        elif t == 'Receiver Node':
            eo = _eobj(base, name, t, p['pos'], p['fwd'], p['up'], physics=3, cached_type=14, other_a=p['channel'], other_b=0)
        else:
            props = p.get('export_properties', {})
            allowed = {'color', 'physics', 'team', 'cached_type', 'other_a', 'other_b'}
            if set(props) - allowed:
                raise ValueError('unsupported export properties: %s' % (set(props) - allowed))
            eo = _eobj(base, name, t, p['pos'], p['fwd'], p['up'], **props)
        plan.append((eo, row))
    objs = [eo for eo, _ in plan]

    probe = [dict(type=eo.type_name, pos=list(eo.position), fwd=list(eo.forward), up=list(eo.up)) for eo in objs]
    bounds = BC.evaluate(BC.samples(probe, [row for _, row in plan], 2.5), BC.read_cache(BC.MCC), bounds_margin)
    print('bounds', bounds['summary'])
    if not bounds['passed']:
        raise SystemExit('out of bounds: %s' % json.dumps(bounds['summary']))

    res = P.export_map_variant(source, objs, P.ExportOptions(allow_unverified_rotation=True, fsm_policy='DROP', raise_quota_max=True))
    if not res.ok:
        raise SystemExit('export failed: %s' % [(e.code, getattr(e, 'message', '')) for e in res.errors][:8])

    m = MapVariant.from_bytes(res.data)
    rows = json.loads(COSTS.read_text())['rows']
    costs = {r['quota_index']: r['price_per_instance'] for r in rows}; qmax = {r['quota_index']: r['maximum_allowed'] for r in rows}
    qcount = collections.Counter(tables.object_id_for_name('Forge World', eo.type_name) >> 8 for eo in objs)
    spent = sum(costs[q] * n for q, n in qcount.items())
    over = {q: (n, qmax[q]) for q, n in qcount.items() if n > min(qmax[q], 255)}
    if over or spent > m.fixed.max_budget:
        raise SystemExit('quota or budget exceeded: %s spent %d' % (over, spent))
    m.header.title = encode_u16(title); m.header.description = encode_u16(description)
    now = int(time.time())
    for a in (m.header.created_by, m.header.modified_by):
        a.timestamp = now; a.xuid = 0; a.name = author; a.is_online_id = 0
    local_uid = uuid.uuid4().int & ((1 << 64) - 1)
    for key in ('unk08', 'unk10', 'unk18'):
        setattr(m.header, key, local_uid)
    m.header.unk20 = 0; m.header.game_mode = 4; m.header.activity_raw = 0
    w = BitWriter(); write_header(w, m.header); m.header.raw = w.getbits()
    m.fixed.built_in = 0; m.fixed.built_from_xml = 0; m.fixed.spent_budget = spent
    w = BitWriter()
    for field, bits in m.fixed.FIELDS:
        w.write(getattr(m.fixed, field), bits)
    for n in m.fixed.bounds_raw:
        w.write(n, 32)
    w.write(m.fixed.max_budget, 32); w.write(m.fixed.spent_budget, 32); m.fixed.raw = w.getbits()
    d = m.chdr
    d['title_raw'] = title.encode('utf-16-le').ljust(256, b'\0'); d['description_raw'] = description.encode('utf-16-le').ljust(256, b'\0')
    for key in ('unk08', 'unk10', 'unk18', 'unk20'):
        d[key] = getattr(m.header, key)
    d['activity'] = m.header.activity; d['game_mode'] = m.header.game_mode
    for who, a in (('created_by', m.header.created_by), ('modified_by', m.header.modified_by)):
        d[who].update(timestamp=a.timestamp, xuid=a.xuid, name=a.name.ljust(16, b'\0'), is_online_id=0)
    ch = m.blf.find('chdr'); ch.raw = build_chdr(d); ch.dirty = True
    data = m.to_bytes(force=True)
    chk = P.load_map_variant(data, title)
    assert chk.info.title == title and chk.info.occupied == len(objs) and chk.info.spent_budget_raw == spent
    dest.mkdir(parents=True, exist_ok=True)
    if target.exists():
        raise SystemExit('refusing to overwrite ' + str(target))
    target.write_bytes(data)

    # manifest in slot order: decoded objects matched back to the plan
    unused = list(range(len(plan))); slot_rows = []
    by_type = collections.defaultdict(list)
    for i, (eo, _) in enumerate(plan):
        by_type[eo.type_name].append(i)
    used = set()
    for o in chk.objects:
        best = None
        for i in by_type[o.type_name]:
            if i in used:
                continue
            dist = math.dist(plan[i][0].position, o.position)
            if best is None or dist < best[0]:
                best = (dist, i)
        assert best is not None and best[0] < 0.01, (o.slot, o.type_name, best)
        used.add(best[1]); slot_rows.append((o, plan[best[1]]))
    mobj = [dict(slot=o.slot, name=eo.name, type_name=o.type_name, type_id=o.type_id, position=list(o.position),
                 forward=list(o.forward), up=list(o.up), **row) for o, (eo, row) in slot_rows]
    summary = dict(name=title, version=version, description=description, object_count=len(objs), spent_budget=spent,
                   maximum_budget=m.fixed.max_budget, type_counts=dict(collections.Counter(eo.type_name for eo in objs)),
                   role_counts=dict(collections.Counter(row['role'] for _, row in plan)),
                   quota_counts={str(q): n for q, n in sorted(qcount.items())}, bounds_margin_wu=bounds_margin,
                   ceiling_headroom_wu=bounds['summary']['headroom'] and bounds['summary']['headroom'][0],
                   safe_zone_margin_wu=bounds['summary']['safe_margin'], template=TEMPLATE.name,
                   sha256=hashlib.sha256(data).hexdigest(), unverified_in_game=True)
    if extra_summary:
        summary.update(extra_summary)
    (dest / ('course_manifest_%s.json' % version)).write_text(json.dumps(dict(summary=summary, sections=sections or [], objects=mobj), indent=1, default=float))
    (dest / ('build_summary_%s.json' % version)).write_text(json.dumps(summary, indent=2, default=float))
    (dest / ('pieces_%s.json' % version)).write_text(json.dumps([dict(type=eo.type_name, pos=list(eo.position), fwd=list(eo.forward), up=list(eo.up),
                                                                  export_properties=dict(color=eo.color, physics=eo.physics, team=eo.team,
                                                                                         cached_type=eo.cached_type, other_a=eo.other_a, other_b=eo.other_b), **row)
                                                                 for eo, row in plan], default=float))
    return dict(path=str(target), summary=summary, bounds=bounds, warnings=sorted(set(w.code for w in res.warnings)))
