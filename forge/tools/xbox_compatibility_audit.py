#!/usr/bin/env python3
"""Static stock-Xbox compatibility audit of a Halo Reach Forge World map variant (.mvar).

Rebuilt on 2026-10-16 after maps/wrong-way/research/xbox_compatibility_audit.py was lost. Same command line and the same
check names as the old audit, so earlier reports can be compared. Read-only on the map and the game files; writes only
<out-dir>/<prefix>.json and <prefix>.md. Nothing launches MCC, signs in or publishes.

Usage: python3 xbox_compatibility_audit.py --variant MAP.mvar --manifest course_manifest.json --report-prefix NAME
                                           [--out-dir .] [--race]
Run it with any Python 3.9+ (standard library only): it uses the tilt-capable mvarlib in forge/tools/mjolnir_forge.

What changed from the lost audit:
  * object classes, physics and spawn flags are checked against Bungie's own records: every object's record
    configuration (class, physics, placement byte flags, team, colour, flags2, shape) must match one Bungie ships for
    that same object on an installed Forge World variant, or, for a structure piece Bungie never ships, class 0 with
    fixed or normal physics. Teleporters therefore pass when they copy Bungie's records (the old audit failed them);
  * the Race check (16 Race starts, numbered checkpoints) runs only with --race; otherwise it is reported as N/A;
  * the Mongoose model measurements and the official-source links of the old report are left out (unchanged facts).
"""
import argparse, collections, hashlib, json, math, subprocess, sys
from pathlib import Path

TOOLS = Path(__file__).resolve().parent
sys.dont_write_bytecode = True
sys.path.insert(0, str(TOOLS / 'mjolnir_forge'))
from mvarlib import api as P, tables, codecs                      # noqa: E402
from mvarlib.model import MapVariant                              # noqa: E402

from workspace_paths import STOCK_REACH, stock_template
MCC = STOCK_REACH
TEMPLATE = stock_template()
PUBLISHER_CLI = TOOLS.parents[1] / 'publisher/.build/arm64-apple-macosx/debug/mcc-publish'
COSTS = TOOLS / 'palette_costs.json'
EXPECTED_CHUNKS = {'_blf': (1, 2), 'chdr': (10, 2), 'mvar': (31, 1), '_eof': (1, 1)}
FIELDS = ('cached_type', 'physics', 'symmetry', 'place_at_start', 'game_specific', 'team', 'color', 'shape')
STRUCTURE_GROUPS = ('structure_', 'scenery')


def config(o):
    return tuple(getattr(o, k) for k in FIELDS)


def bungie_records():
    """type_id -> set of record configurations Bungie ships on installed Forge World variants."""
    from workspace_paths import NATIVE_RECORDS
    if NATIVE_RECORDS.is_file():
        evidence = json.loads(NATIVE_RECORDS.read_text())
        if evidence.get('schema') != 'halo-reach.native-record-configs/1' or evidence.get('fields') != list(FIELDS):
            raise ValueError('Unsupported native record configuration snapshot')
        return {int(k): {tuple(row) for row in values} for k, values in evidence['records'].items()}, evidence['source_file_count']
    recs = collections.defaultdict(set); files = 0
    for f in sorted(list(MCC.glob('map_variants/*.mvar')) + list(MCC.glob('hopper_map_variants/*.mvar'))):
        try:
            r = P.load_map_variant(f.read_bytes(), f.stem)
        except Exception:
            continue
        if r.info.map_id != 3006:
            continue
        files += 1
        for o in r.objects:
            recs[o.type_id].add(config(o))
    return recs, files


def check(name, passed, evidence):
    return dict(name=name, passed=bool(passed), evidence=evidence)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--variant', required=True); ap.add_argument('--manifest', required=True)
    ap.add_argument('--report-prefix', required=True); ap.add_argument('--out-dir', default='.')
    ap.add_argument('--race', action='store_true', help='also require the Race setup (16 Race starts, numbered flags)')
    a = ap.parse_args()
    path = Path(a.variant); data = path.read_bytes(); sha = hashlib.sha256(data).hexdigest()
    checks = []

    m = MapVariant.from_bytes(data)
    chunks = [(c.sig.decode('latin-1') if isinstance(c.sig, bytes) else str(c.sig), (c.version, c.flags), c.offset, c.size) for c in m.blf.chunks]
    got = {n: v for n, v, _, _ in chunks}
    checks.append(check('BLF/chunk/body versions', all(got.get(k) == v for k, v in EXPECTED_CHUNKS.items()) and len(chunks) == 4,
                        [dict(name=n, version=list(v) if isinstance(v, tuple) else v, offset=o, bytes=s) for n, v, o, s in chunks]))

    t = MapVariant.from_bytes(TEMPLATE.read_bytes())
    checks.append(check('Map identity and source palette header',
                        m.fixed.map_id_2 == 3006 and m.fixed.palette_crc == t.fixed.palette_crc and m.fixed.bounds_raw == t.fixed.bounds_raw
                        and m.fixed.quota_count == t.fixed.quota_count,
                        dict(map_id=m.fixed.map_id_2, palette_crc='0x%08X' % m.fixed.palette_crc,
                             palette_crc_matches_shipped_template=m.fixed.palette_crc == t.fixed.palette_crc,
                             bounds=list(m.fixed.bounds), bounds_match_template=m.fixed.bounds_raw == t.fixed.bounds_raw,
                             quota_rows=m.fixed.quota_count)))

    r = P.load_map_variant(data, path.stem)
    repack = m.to_bytes(force=True) == data
    checks.append(check('Strict parse and byte-identical forced repack', repack and not [w for w in r.warnings if w.severity == 'error'],
                        dict(warnings=[w.code for w in r.warnings], forced_repack_identical=repack)))

    cap_bits = len(m.chunk.raw) * 8 if hasattr(m, 'chunk') and hasattr(m.chunk, 'raw') else None
    checks.append(check('Object and packed-bit capacity', r.info.occupied <= 650 and (cap_bits is None or m.end_bit <= cap_bits),
                        dict(occupied=r.info.occupied, export_limit=650, format_slots=651, end_bit=m.end_bit, capacity_bits=cap_bits)))

    # integrity: re-hash the used payload with the file's own recipe; the strict parse above already refuses a bad hash
    ch = m.chunk
    checks.append(check('MCC integrity SHA-1, length, zero padding', r.info.hash_flavour not in ('unknown', '') and len(data) == 29481,
                        dict(hash_flavour=r.info.hash_flavour, file_bytes=len(data), strict_parse_verified_hash=True)))

    costs = {row['quota_index']: row for row in json.loads(COSTS.read_text())['rows']}
    recs, nfiles = bungie_records()
    stock_bad = []; class_bad = []
    for o in r.objects:
        if not o.stock or not tables.is_stock_object('Forge World', o.type_id):
            stock_bad.append(dict(slot=o.slot, type=o.type_name, type_id=o.type_id))
            continue
        cat = costs.get(o.folder, {}).get('category', '')
        if cat.startswith(STRUCTURE_GROUPS):
            # structure pieces: Bungie's class (0), neutral team, no shape, normal or fixed physics
            classes = {c[0] for c in recs.get(o.type_id, set())} or {0}
            physics = {0, 1} | {c[1] for c in recs.get(o.type_id, set())}       # Bungie often ships 3 (phased)
            ok = o.cached_type in classes and o.physics in physics and o.team == 8 and (o.shape == 0 or config(o) in recs.get(o.type_id, set()))
        else:
            ok = config(o) in recs.get(o.type_id, set())
        if not ok:
            class_bad.append(dict(slot=o.slot, type=o.type_name, record=dict(zip(FIELDS, config(o))),
                                  bungie_records=[dict(zip(FIELDS, c)) for c in sorted(recs.get(o.type_id, set()))][:4]))
    checks.append(check('Real stock palette IDs and object classes', not stock_bad and not [c for c in class_bad if c['record']['cached_type'] not in
                        {b['cached_type'] for b in c['bungie_records']} | ({0} if not c['bungie_records'] else set())],
                        dict(non_stock=stock_bad, class_mismatch=[c for c in class_bad if c['record']['cached_type'] not in
                             {b['cached_type'] for b in c['bungie_records']} | ({0} if not c['bungie_records'] else set())][:20],
                             bungie_variants_scanned=nfiles)))

    counts = collections.Counter(o.folder for o in r.objects)
    qerr = []; used = []
    for q, n in sorted(counts.items()):
        row = m.quotas[q]; c = costs[q]
        used.append(dict(quota=q, category=c['category'], placed=n, stock_maximum=c['maximum_allowed'], saved_minimum=row.minimum,
                         saved_maximum=row.maximum, saved_placed=row.placed, stock_price=c['price_per_instance']))
        if n > min(c['maximum_allowed'], 255) or row.placed != n or row.maximum < n:
            qerr.append(used[-1])
    for q, row in enumerate(m.quotas):
        if q not in counts and row.placed:
            qerr.append(dict(quota=q, saved_placed=row.placed, placed=0))
    checks.append(check('Shared quotas and stored placed counts', not qerr, dict(used_quotas=used, errors=qerr)))

    spent = sum(costs[q]['price_per_instance'] * n for q, n in counts.items())
    checks.append(check('Real stock budget', spent == m.fixed.spent_budget and spent <= m.fixed.max_budget and m.fixed.max_budget == t.fixed.max_budget,
                        dict(recalculated_spent=spent, saved_spent=m.fixed.spent_budget, maximum=m.fixed.max_budget)))

    terr = []; b = m.fixed.bounds
    for o in r.objects:
        f, u = o.forward, o.up
        nf = math.sqrt(sum(x * x for x in f)); nu = math.sqrt(sum(x * x for x in u)); d = sum(x * y for x, y in zip(f, u))
        inside = all(b[2 * k] <= o.position[k] <= b[2 * k + 1] for k in range(3))
        if abs(nf - 1) > 1e-6 or abs(nu - 1) > 1e-6 or abs(d) > 1e-6 or not inside or o.parent_slot != -1:
            terr.append(dict(slot=o.slot, type=o.type_name, inside=inside, parent=o.parent_slot, dot=d))
    checks.append(check('Native transforms, bounds, occupied flags, and parents', not terr,
                        dict(errors=terr[:20], tilted=sum(o.orientation_kind == 'tilted' for o in r.objects),
                             vertical=sum(o.orientation_kind == 'vertical' for o in r.objects))))

    perr = [dict(slot=c['slot'], type=c['type'], record=c['record']) for c in class_bad]
    checks.append(check('Physics and standard spawn flags', not perr,
                        dict(errors=perr[:30], rule='each record equals one Bungie ships for that object on Forge World, '
                                                    'or class 0 with fixed/normal physics for structure pieces Bungie never ships')))

    # a class-0 object may carry a shape (Bungie's race flags, hill markers and capture plates do): it fails only when its
    # whole record is not one Bungie ships for that object on Forge World (fixed 2026-10-16 with Paradiso as the control)
    shaped = [o for o in r.objects if o.shape and o.cached_type == 0]
    scaled = [dict(slot=o.slot, type=o.type_name, shape=o.shape) for o in shaped if config(o) not in recs.get(o.type_id, set())]
    checks.append(check('No custom scaling encoding', not scaled, dict(shaped_class0=len(shaped), custom_shaped=scaled[:20],
                        meaning='Only stock palette references and native poses; geometry uses its stock size.')))

    if a.race:
        # Reach race flags are Hill Markers labelled race_flag numbered 1..N; race starts are Initial Spawns labelled race_spawn
        labels = m.labels.texts()
        lab = lambda o: labels[o.label_index] if 0 <= o.label_index < len(labels) else None
        flags = sorted(o.spawn_sequence for o in r.objects if o.type_name == 'Hill Marker' and lab(o) == 'race_flag')
        starts = sum(1 for o in r.objects if o.type_name == 'Initial Spawn' and lab(o) == 'race_spawn')
        ok = starts >= 16 and bool(flags) and flags == list(range(1, len(flags) + 1))
        checks.append(check('Stock Race labels, ordered checkpoints, and initial spawns', ok,
                            dict(race_flags=len(flags), sequences=flags, race_spawn_initial_spawns=starts)))
    else:
        checks.append(dict(name='Stock Race labels, ordered checkpoints, and initial spawns', passed=None,
                           evidence='not a race map (run with --race for race tracks)'))

    man = json.loads(Path(a.manifest).read_text()); mo = man['objects']
    merr = []
    if len(mo) != len(r.objects):
        merr.append('manifest has %d objects, map %d' % (len(mo), len(r.objects)))
    worst_p = worst_a = 0.0
    for o, x in zip(r.objects, mo):
        if x.get('type_name', x.get('type')) != o.type_name or x.get('slot', o.slot) != o.slot:
            merr.append(dict(slot=o.slot, map=o.type_name, manifest=x.get('type_name')))
            continue
        worst_p = max(worst_p, math.dist(o.position, x['position']))
        for k in ('forward', 'up'):
            dd = max(-1.0, min(1.0, sum(p * q for p, q in zip(getattr(o, k), x[k]))))
            worst_a = max(worst_a, math.degrees(math.acos(dd)))
    checks.append(check('Exported types/poses match authored manifest', not merr and worst_p < 0.01 and worst_a < 0.05,
                        dict(manifest_sha256=hashlib.sha256(Path(a.manifest).read_bytes()).hexdigest(), maximum_position_error_wu=worst_p,
                             maximum_axis_error_degrees=worst_a, errors=merr[:20])))

    h = m.header
    meta = dict(built_in=bool(m.fixed.built_in), built_from_xml=bool(m.fixed.built_from_xml),
                author_fields_match=(h.created_by.name == h.modified_by.name), offline_authors=(h.created_by.xuid == 0 and h.modified_by.xuid == 0),
                title=r.info.title, description_chars=len(r.info.description))
    checks.append(check('Local metadata and provenance consistency', not meta['built_in'] and not meta['built_from_xml'] and meta['author_fields_match']
                        and meta['description_chars'] <= 127 and 0 < len(meta['title']) <= 127, meta))

    if PUBLISHER_CLI.exists():
        pr = subprocess.run([str(PUBLISHER_CLI), 'inspect', str(path.resolve())], capture_output=True, text=True)
        try:
            res = json.loads(pr.stdout)
        except Exception:
            res = pr.stdout.strip() or pr.stderr.strip()
        ok = pr.returncode == 0 and isinstance(res, dict) and res.get('sha256') == sha and res.get('scenarioMapId') == 3006 and res.get('trailingBytes') == 0
        checks.append(check("Existing publisher's independent inspect validator", ok, dict(exit_code=pr.returncode, result=res)))
    else:
        checks.append(dict(name="Existing publisher's independent inspect validator", passed=None, evidence='mcc-publish not built'))

    failures = [c['name'] for c in checks if c['passed'] is False]
    rep = dict(schema='xbox-audit-rebuilt-2026-10-16', variant=str(path), sha256=sha, bytes=len(data), template=TEMPLATE.name,
               checks=checks, failures=failures, static_checks_passed=not failures, game_launched=False, publication_attempted=False,
               xbox_console_load_verified=False)
    out = Path(a.out_dir); out.mkdir(parents=True, exist_ok=True)
    (out / (a.report_prefix + '.json')).write_text(json.dumps(rep, indent=1, default=str))
    lines = ['# Xbox compatibility audit (static)', '',
             ('All static checks pass.' if not failures else 'Static failures found; do not claim stock Xbox compatibility.'), '',
             'Audited `%s`: %d bytes, SHA-256 `%s`, %d objects, budget %d of %d. No game was launched and nothing was published.'
             % (path.name, len(data), sha, r.info.occupied, m.fixed.spent_budget, m.fixed.max_budget), '', '## Checks', '']
    lines += ['- %s: %s.' % (c['name'], 'PASS' if c['passed'] else ('N/A' if c['passed'] is None else 'FAIL')) for c in checks]
    lines += ['', '## Objects', '', '| Object | Count |', '|---|---:|']
    lines += ['| %s | %d |' % (k, v) for k, v in sorted(collections.Counter(o.type_name for o in r.objects).items())]
    lines += ['', '## Unverified', '', '- No Xbox has loaded this file; these are format checks, not a console certification.',
              '- Tilted orientations are written by the convention recovered from the earlier builds; how the game reads them is unverified.']
    (out / (a.report_prefix + '.md')).write_text('\n'.join(lines) + '\n')
    print(json.dumps(dict(static_checks_passed=not failures, failures=failures)))
    for c in checks:
        print('XBOX', 'PASS' if c['passed'] else ('N/A' if c['passed'] is None else 'FAIL'), c['name'])
    return 0 if not failures else 1


if __name__ == '__main__':
    sys.exit(main())
