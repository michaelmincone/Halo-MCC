#!/usr/bin/env python3
"""Check a decoded map against Forge World's built-in play boundaries, read from the installed game cache.

Read-only. Opens forge_halo.map with ACCESS_READ and writes only the report. Nothing launches MCC.
It reads two kinds of boundary that the map variant itself does not contain:
  * scenario trigger volumes marked as KILL and SAFE volumes: scnr+0x280 (volumes, 0x7C each),
    scnr+0x4C8 (kill index block), scnr+0x4D4 (safe index block). A volume is a box (type 0: position, forward, up,
    extents) or a sector (type 1: polygon of points at +0x44, 0x14 each, between the runtime z bounds at +0x6C/+0x70);
    in Reach a player inside a kill volume dies (kill_soft: after the "return to the battlefield" countdown) and a
    player outside every soft safe zone gets the same countdown;
  * soft ceilings from each structure design (sddt) tag: scnr+0x5C structure designs (0x20 each, tag datum at +0xC),
    sddt+0x40 soft ceilings (0x14 each: name, type 0 acceleration / 1 soft kill / 2 slip, triangle block at +8),
    triangles 0x44 each with world-space vertices at +0x20, +0x2C, +0x38.
Layouts follow HaloMapStudio's native walkers (publisher/investigation/research/public/HaloMapStudio/native/
MccMapStudioDLL/ScenarioTriggerVolumeWalker.cpp and SoftCeilingWalker.cpp) and TagTool's Reach trigger volume
(z sink +0x40, sector points +0x44, runtime bounds +0x5C). Players are tested at their centre, 0.5 WU above the
surface they stand on.

Usage: python3 bounds_check.py objects.json course_manifest.json report.json [--cache forge_halo.map] [--clearance 2.5]
Players are sampled 0.5 WU (their centre) and `clearance` WU (a driver's head on a Mongoose) above every road piece
and every spawn. PASS means every sample is inside a soft safe zone, outside every kill volume, inside
the soft ceiling shell (a ceiling crossing above it, none within `margin` of it), and under no soft-kill surface.
Run it on Bungie's shipped Forge World variants first to see the boundaries agree with their spawns.
"""
import argparse, json, math, mmap, struct, sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from workspace_paths import BOUNDARIES
MCC = BOUNDARIES
SUPPORTED_BUILD = 'Jun 21 2023 15:35:31'
CEILING_TYPES = {0: 'acceleration', 1: 'soft kill', 2: 'slip surface'}


def read_cache(path):
    path = Path(path)
    if path.suffix.lower() == '.json':
        snapshot = json.loads(path.read_text())
        if snapshot.get('schema') != 'halo-reach.forge-world-boundaries/1' or snapshot.get('build') != SUPPORTED_BUILD:
            raise ValueError('Unsupported Forge World boundary snapshot')
        if not snapshot.get('volumes') or not snapshot.get('ceilings'):
            raise ValueError('Incomplete Forge World boundary snapshot')
        return snapshot['build'], snapshot['volumes'], snapshot['ceilings']
    with path.open('rb') as fh, mmap.mmap(fh.fileno(), 0, access=mmap.ACCESS_READ) as data:
        size = len(data)

        def rd(fmt, off):
            n = struct.calcsize(fmt)
            if off < 0 or off + n > size:
                raise ValueError('read outside cache at %d' % off)
            return struct.unpack_from(fmt, data, off)

        u32 = lambda o: rd('<I', o)[0]; i32 = lambda o: rd('<i', o)[0]; i64 = lambda o: rd('<q', o)[0]
        i16 = lambda o: rd('<h', o)[0]; u16 = lambda o: rd('<H', o)[0]; f3 = lambda o: rd('<3f', o)
        if data[:4] != b'daeh':
            raise ValueError('not an MCC cache')
        build = data[160:192].split(b'\0')[0].decode()
        if build != SUPPORTED_BUILD:
            raise ValueError('unsupported build ' + build)
        header_magic = (-u32(1228)) & 0xFFFFFFFF
        tag_magic = i64(736) - ((u32(1260) + u32(1236)) & 0xFFFFFFFF)

        def meta(raw):
            s = raw if raw < 0x80000000 else raw - 0x100000000
            return (s << 2) + 0x50000000 - tag_magic

        def block(off, stride, cap):
            n = i32(off)
            if not 0 <= n <= cap:
                raise ValueError('implausible block count %d at %d' % (n, off))
            return n, (meta(u32(off + 4)) if n else 0)

        ti = i64(744) - tag_magic
        ncls, ntag = i32(ti), i32(ti + 16)
        carr, tarr = i64(ti + 8) - tag_magic, i64(ti + 24) - tag_magic
        classes = [data[carr + i * 16:carr + i * 16 + 4][::-1].decode('ascii') for i in range(ncls)]

        def tag(index):
            at = tarr + index * 8
            return classes[i16(at)] if 0 <= i16(at) < ncls else None, meta(u32(at + 4))

        scn = [tag(i)[1] for i in range(ntag) if tag(i)[0] == 'scnr']
        if len(scn) != 1:
            raise ValueError('expected one scenario')
        scnr = scn[0]

        # string ids (same scheme as research/extract_palette_costs.py)
        scount, bsize = i32(48), i32(56); sblob = u32(52) - header_magic; sidx = u32(60) - header_magic
        nns = i32(64); nsat = u32(68) - header_magic; mask = (1 << 19) - 1
        nss = [u32(nsat + i * 4) & mask for i in range(nns)]; starts = [0]; cur = nss[0]
        for c in nss[1:]:
            starts.append(cur); cur += c
        starts[0] = cur

        def sid(v):
            if v in (0, 0xFFFFFFFF):
                return ''
            idx, ns = v & mask, min((v >> 19) & 0xFF, nns - 1)
            if idx >= (nss[0] if ns == 0 else 0):
                idx = idx - (nss[0] if ns == 0 else 0) + starts[ns]
            if not 0 <= idx < scount:
                return '?'
            o = i32(sidx + idx * 4)
            return data[sblob + o:sblob + o + 128].split(b'\0')[0].decode('utf-8', 'replace')

        n, arr = block(scnr + 0x280, 0x7C, 4096)
        vols = []
        for k in range(n):
            v = arr + k * 0x7C
            npts, parr = block(v + 0x44, 0x14, 4096)
            vols.append(dict(index=k, name=sid(u32(v)), shape=u16(v + 0x0C), forward=f3(v + 0x10), up=f3(v + 0x1C),
                             position=f3(v + 0x28), extents=f3(v + 0x34), z_sink=rd('<f', v + 0x40)[0],
                             points=[f3(parr + j * 0x14) for j in range(npts)], bounds=rd('<6f', v + 0x5C), kill=False, safe=False))
        for off, key in ((0x4C8, 'kill'), (0x4D4, 'safe')):
            m, a = block(scnr + off, 4, 4096)
            for k in range(m):
                j = i16(a + k * 4)
                if 0 <= j < n:
                    vols[j][key] = True

        ceilings = []
        m, a = block(scnr + 0x5C, 0x20, 64)
        for d in range(m):
            raw = u32(a + d * 0x20 + 0x0C)
            if raw == 0xFFFFFFFF:
                continue
            cls, sddt = tag(raw & 0xFFFF)
            if cls != 'sddt':
                continue
            c, carr2 = block(sddt + 0x40, 0x14, 128)
            for k in range(c):
                e = carr2 + k * 0x14
                t, tarr2 = block(e + 0x08, 0x44, 0x7FFF)
                tris = [(f3(tarr2 + q * 0x44 + 0x20), f3(tarr2 + q * 0x44 + 0x2C), f3(tarr2 + q * 0x44 + 0x38)) for q in range(t)]
                ceilings.append(dict(design=d, name=sid(u32(e)), type=CEILING_TYPES.get(u16(e + 4), str(u16(e + 4))), triangles=tris))
        return build, vols, ceilings


def sub(a, b): return (a[0] - b[0], a[1] - b[1], a[2] - b[2])
def dot(a, b): return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
def cross(a, b): return (a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0])
def norm(a):
    L = math.sqrt(dot(a, a)) or 1.0
    return (a[0] / L, a[1] / L, a[2] / L)


def in_polygon(x, y, poly):
    inside = False
    for (x1, y1, _), (x2, y2, _) in zip(poly, poly[1:] + poly[:1]):
        if (y1 > y) != (y2 > y) and x < x1 + (y - y1) * (x2 - x1) / (y2 - y1):
            inside = not inside
    return inside


def edge_distance(x, y, poly):
    best = 1e9
    for (x1, y1, _), (x2, y2, _) in zip(poly, poly[1:] + poly[:1]):
        dx, dy = x2 - x1, y2 - y1; L = dx * dx + dy * dy
        t = 0.0 if L == 0 else max(0.0, min(1.0, ((x - x1) * dx + (y - y1) * dy) / L))
        best = min(best, math.hypot(x - x1 - t * dx, y - y1 - t * dy))
    return best


def in_volume(p, v, grow=0.0):
    """Inside a trigger volume, grown by `grow` WU (a margin around kill volumes)."""
    if v['shape'] == 1 and len(v['points']) >= 3:
        b = v['bounds']
        if not (b[4] - grow <= p[2] <= b[5] + grow):
            return False
        return in_polygon(p[0], p[1], v['points']) or (grow > 0 and edge_distance(p[0], p[1], v['points']) <= grow)
    # Box: position is a corner; extents run along forward, left (up x forward) and up. (Checked against Bungie's
    # shipped spawns: the centred reading puts Hemorrhage's start inside the south sea box.)
    f = norm(v['forward']); u = norm(v['up']); l = norm(cross(u, f)); d = sub(p, v['position']); e = v['extents']
    return all(-grow <= dot(d, ax) <= ext + grow for ax, ext in ((f, e[0]), (l, e[1]), (u, e[2])))


def safe_margin(p, v):
    """How far p is inside a sector safe zone (negative: outside)."""
    b = v['bounds']; d = edge_distance(p[0], p[1], v['points'])
    inside = in_polygon(p[0], p[1], v['points']) and b[4] <= p[2] <= b[5]
    return min(d, p[2] - b[4], b[5] - p[2]) if inside else -min(d, 99)


def heights_at(x, y, tris):
    """z of every triangle that the vertical line through (x, y) crosses."""
    out = []
    for a, b, c in tris:
        if max(a[0], b[0], c[0]) < x or min(a[0], b[0], c[0]) > x or max(a[1], b[1], c[1]) < y or min(a[1], b[1], c[1]) > y:
            continue
        den = (b[1] - c[1]) * (a[0] - c[0]) + (c[0] - b[0]) * (a[1] - c[1])
        if abs(den) < 1e-12:
            continue
        l1 = ((b[1] - c[1]) * (x - c[0]) + (c[0] - b[0]) * (y - c[1])) / den
        l2 = ((c[1] - a[1]) * (x - c[0]) + (a[0] - c[0]) * (y - c[1])) / den
        l3 = 1 - l1 - l2
        if min(l1, l2, l3) >= -1e-9:
            out.append(l1 * a[2] + l2 * b[2] + l3 * c[2])
    return out


CELL = 8.0


def ceiling_heights(x, y, c):
    """heights_at() through a lazily built grid index of the ceiling's triangles (8 WU cells)."""
    idx = c.get('_index')
    if idx is None:
        idx = {}
        for t in c['triangles']:
            xs = [v[0] for v in t]; ys = [v[1] for v in t]
            for i in range(int(math.floor(min(xs) / CELL)), int(math.floor(max(xs) / CELL)) + 1):
                for j in range(int(math.floor(min(ys) / CELL)), int(math.floor(max(ys) / CELL)) + 1):
                    idx.setdefault((i, j), []).append(t)
        c['_index'] = idx
    return heights_at(x, y, idx.get((int(math.floor(x / CELL)), int(math.floor(y / CELL))), []))


def samples(objs, mo, clearance):
    """(label, point) pairs where a player can be: 0.5 and `clearance` WU above the corners, edge midpoints and centre of
    every road piece, and above every spawn (Initial Spawn, Respawn Point, vehicle)."""
    pts = []
    for i, o in enumerate(objs):
        role = mo[i].get('role') if i < len(mo) else None
        u = norm(o['up']); f = norm(o['fwd']); r = norm(cross(f, u)); p = o['pos']
        if role == 'road':
            hx, hy = (2.5, 2.5) if o['type'].startswith('Block, 5x5') else (1.0, 2.5)
            for sx in (-1, 0, 1):
                for sy in (-1, 0, 1):
                    q = tuple(p[k] + r[k] * sx * hx + f[k] * sy * hy for k in range(3))
                    pts.append(('slot %d %s +0.5' % (i, o['type']), (q[0], q[1], q[2] + 0.5)))
                    pts.append(('slot %d %s +%.1f' % (i, o['type'], clearance), (q[0], q[1], q[2] + clearance)))
        elif role == 'spawn':
            pts.append(('slot %d %s +0.5' % (i, o['type']), (p[0], p[1], p[2] + 0.5)))
            pts.append(('slot %d %s +%.1f' % (i, o['type'], clearance), (p[0], p[1], p[2] + clearance)))
    return pts


def evaluate(pts, boundaries, margin=0.0):
    """Score (label, point) samples against the boundaries from read_cache(). Returns the report dict."""
    build, vols, ceilings = boundaries
    kills = [v for v in vols if v['kill']]; safes = [v for v in vols if v['safe'] and v['shape'] == 1]
    inside = [(lab, [round(c, 2) for c in q], v['index'], v['name']) for lab, q in pts for v in kills if in_volume(q, v, margin)]
    outside_safe = []; worst_safe = None
    if safes:
        for lab, q in pts:
            m = max(safe_margin(q, v) for v in safes)
            if m < margin:
                outside_safe.append((lab, [round(c, 2) for c in q], round(m, 2)))
            if worst_safe is None or m < worst_safe[0]:
                worst_safe = (round(m, 2), lab, [round(c, 2) for c in q])
    ceiling_rows = []; under_ceiling = []; soft_kill_above = []; no_ceiling = 0
    for c in ceilings:
        lo = [min(t[i][k] for t in c['triangles'] for i in range(3)) for k in range(3)] if c['triangles'] else None
        hi = [max(t[i][k] for t in c['triangles'] for i in range(3)) for k in range(3)] if c['triangles'] else None
        ceiling_rows.append(dict(name=c['name'], type=c['type'], design=c['design'], triangles=len(c['triangles']),
                                 bounds_min=lo and [round(x, 2) for x in lo], bounds_max=hi and [round(x, 2) for x in hi]))
    worst_headroom = None
    for lab, q in pts:
        # The acceleration ceiling is a closed shell around the play space: inside means an odd number of shell
        # crossings above the point (lid above, floor below), and none closer than the margin.
        shell = [z for c in ceilings if c['type'] in ('acceleration', 'slip surface') for z in ceiling_heights(q[0], q[1], c)]
        above = [z for z in shell if z > q[2]]
        no_ceiling += not shell
        if ceilings and (len(above) % 2 == 0 or any(abs(z - q[2]) < margin for z in shell)):
            under_ceiling.append((lab, [round(x, 2) for x in q], 'outside the soft ceiling shell' if not shell else 'outside or too close to the shell',
                                  [round(z, 2) for z in sorted(shell)]))
        elif above:
            h = min(above) - q[2]
            if worst_headroom is None or h < worst_headroom[0]:
                worst_headroom = (round(h, 2), lab, [round(x, 2) for x in q], round(min(above), 2))
        for c in ceilings:
            if c['type'] == 'soft kill' and any(z >= q[2] for z in ceiling_heights(q[0], q[1], c)):
                soft_kill_above.append((lab, [round(x, 2) for x in q], c['name']))
    zs = [q[2] for _, q in pts]
    rep = dict(build=build, trigger_volumes=len(vols), kill_volumes=len(kills),
               safe_volumes=sum(v['safe'] for v in vols), soft_ceilings=ceiling_rows, samples=len(pts),
               sample_z_range=[round(min(zs), 2), round(max(zs), 2)], inside_kill_volume=inside[:50],
               inside_kill_volume_count=len(inside), above_acceleration_or_slip_ceiling=under_ceiling[:50],
               above_ceiling_count=len(under_ceiling), soft_kill_surface_above=soft_kill_above[:50],
               soft_kill_above_count=len(soft_kill_above), smallest_headroom_to_ceiling=worst_headroom,
               safe_zones=len(safes), outside_safe_zone=outside_safe[:50], outside_safe_zone_count=len(outside_safe),
               smallest_safe_zone_margin=worst_safe, margin_wu=margin,
               samples_with_no_ceiling_overhead=no_ceiling,
               kill_volume_list=[dict(index=v['index'], name=v['name'], shape=v['shape'], bounds=[round(x, 2) for x in v['bounds']],
                                      points=len(v['points']), position=[round(x, 2) for x in v['position']],
                                      extents=[round(x, 2) for x in v['extents']], forward=[round(x, 3) for x in v['forward']],
                                      up=[round(x, 3) for x in v['up']]) for v in kills])
    rep['passed'] = not inside and not under_ceiling and not soft_kill_above and not outside_safe
    rep['summary'] = dict(samples=len(pts), kill_volumes=len(kills), inside_kill=len(inside), outside_safe=len(outside_safe),
                          above_ceiling=len(under_ceiling), soft_kill_above=len(soft_kill_above), headroom=worst_headroom,
                          safe_margin=worst_safe and worst_safe[0], no_ceiling_overhead=no_ceiling)
    return rep


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('objects'); ap.add_argument('manifest'); ap.add_argument('report')
    ap.add_argument('--cache', type=Path, default=MCC); ap.add_argument('--clearance', type=float, default=2.5)
    ap.add_argument('--margin', type=float, default=0.0, help='required distance from every boundary (WU)')
    a = ap.parse_args()
    objs = json.load(open(a.objects)); mo = json.load(open(a.manifest))['objects'] if a.manifest != '-' else []
    rep = evaluate(samples(objs, mo, a.clearance), read_cache(a.cache), a.margin)
    rep['cache'] = str(a.cache)
    json.dump(rep, open(a.report, 'w'), indent=1)
    print('BOUNDS_CHECK', 'PASS' if rep['passed'] else 'FAIL', json.dumps(rep['summary']))
    if not rep['passed']:
        sys.exit(1)


if __name__ == '__main__':
    main()
