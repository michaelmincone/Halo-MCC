"""Bounded, read-only MCC Reach mesh extraction for local preview assets.

Resource layout is adapted from the locally pinned HaloMapStudio native parsers
and corroborated against the ReachMCC schema. This cache uses 24-byte render-model
permutations (the cloned viewer's 16-byte assumption is not used).
No game code is executed. All output stays outside the add-on source repository.
"""
from collections import OrderedDict
import gzip
import hashlib
import json
import math
import mmap
from pathlib import Path
import struct
import sys
import zlib

HERE = Path(__file__).resolve().parent
FORGE = HERE.parent
sys.path.insert(0, str(FORGE / 'maps/cannon-odyssey/scripts'))
from inspect_cannons import Cache, BC


class NativeAssets:
    def __init__(self, path=BC.MCC, page_cache_limit=384 * 1024**2):
        self.c = Cache(path)
        c = self.c
        zone = next(t['offset'] for t in c.tags.values() if t['group'] == 'zone')
        play = next(t['offset'] for t in c.tags.values() if t['group'] == 'play')
        self.entries = c.block(zone + 100, 64)
        self.fixup_data = c.meta(c.u32(zone + 340))
        self.fixup_size = c.u32(zone + 328)
        self.pages = [dict(cache=c.read('<h', a + 4)[0], offset=c.u32(a + 8),
                           compressed=c.u32(a + 12), size=c.u32(a + 16))
                      for a in c.block(play + 24, 88)]
        self.segments = [c.read('<hhii', a) for a in c.block(play + 60, 16)]
        self.shared_names = [c.string(a, 32).replace('\\', '/').split('/')[-1]
                             for a in c.block(play + 12, 264)]
        self.sources = {-1: (c.file, c.data)}
        self.page_cache = OrderedDict()
        self.page_cache_size = 0
        self.page_cache_limit = page_cache_limit

    def _source(self, index):
        if index not in self.sources:
            assert 0 <= index < len(self.shared_names)
            path = self.c.path.parent / self.shared_names[index]
            stream = path.open('rb')
            data = mmap.mmap(stream.fileno(), 0, access=mmap.ACCESS_READ)
            assert data[:4] == b'daeh'
            self.sources[index] = (stream, data)
        return self.sources[index][1]

    def page(self, index):
        if index in self.page_cache:
            self.page_cache.move_to_end(index)
            return self.page_cache[index]
        page = self.pages[index]
        assert 0 < page['size'] <= 512 * 1024**2
        source = self._source(page['cache'])
        data_base = struct.unpack_from('<I', source, 1232)[0]
        start = data_base + page['offset']
        assert 0 <= start < len(source) and start + page['compressed'] <= len(source)
        packed = source[start:start + page['compressed']]
        if page['compressed'] == page['size']:
            data = packed
        else:
            decoder = zlib.decompressobj(-15)
            data = decoder.decompress(packed, page['size'] + 1)
            assert decoder.eof and len(data) == page['size'], (index, len(data), page)
        if len(data) <= self.page_cache_limit:
            while self.page_cache and self.page_cache_size + len(data) > self.page_cache_limit:
                _, old = self.page_cache.popitem(last=False)
                self.page_cache_size -= len(old)
            self.page_cache[index] = data
            self.page_cache_size += len(data)
        return data

    def resource(self, resource_id):
        c = self.c
        entry = self.entries[resource_id & 0xFFFF]
        segment_index = c.read('<h', entry + 34)[0]
        assert 0 <= segment_index < len(self.segments)
        primary, secondary, first, second = self.segments[segment_index]
        page_index, offset = (secondary, second) if secondary >= 0 else (primary, first)
        page = self.pages[page_index]
        if page['compressed'] == 0 or page['offset'] == 0xFFFFFFFF:
            page_index, offset = primary, first
        data = self.page(page_index)
        assert 0 <= offset < len(data)
        return entry, memoryview(data)[offset:]

    def buffers(self, entry):
        c = self.c
        start, size = c.read('<ii', entry + 20)
        assert 0 <= start and size >= 24 and start + size <= self.fixup_size
        base = self.fixup_data + start
        nv = c.read('<i', base + size - 24)[0]
        ni = c.read('<i', base + size - 12)[0]
        assert 0 <= nv <= 0x10000 and 0 <= ni <= 0x10000
        vertices = [(c.u32(base + i * 28), c.u32(base + i * 28 + 8)) for i in range(nv)]
        ibase = base + nv * (28 + 12)
        indices = [(c.u32(ibase + i * 28) & 255, c.u32(ibase + i * 28 + 8)) for i in range(ni)]
        fixups = [c.u32(a + 4) & 0x0FFFFFFF for a in c.block(entry + 40, 8)]
        assert len(fixups) >= nv * 2 + ni
        return vertices, indices, fixups

    @staticmethod
    def triangles(indices, fmt, restart):
        if fmt == 3:
            assert len(indices) % 3 == 0
            return [list(indices[i:i + 3]) for i in range(0, len(indices), 3)
                    if len(set(indices[i:i + 3])) == 3]
        if fmt in (0, 5):
            result, run = [], []
            for value in indices:
                if value == restart:
                    run = []
                    continue
                run.append(value)
                if len(run) >= 3:
                    tri = run[-3:]
                    if len(run) % 2 == 0:
                        tri = [tri[0], tri[2], tri[1]]
                    if len(set(tri)) == 3:
                        result.append(tri)
            return result
        if fmt == 4:
            return [[indices[0], indices[i], indices[i + 1]] for i in range(1, len(indices) - 1)]
        raise ValueError('Unsupported index format: ' + str(fmt))

    def model(self, tag_index):
        c = self.c
        tag = c.tags[tag_index]
        assert tag['group'] == 'mode'
        b = tag['offset']
        entry, resource = self.resource(c.u32(b + 248))
        vbuffers, ibuffers, fixups = self.buffers(entry)
        bounds = c.block(b + 116, 52)
        compression = c.read('<H', bounds[0])[0] if bounds else 0
        position_bounds = c.read('<6f', bounds[0] + 4) if bounds else (0, 1, 0, 1, 0, 1)
        uv_bounds = c.read('<4f', bounds[0] + 28) if bounds else (0, 1, 0, 1)
        sections = []
        for si, at in enumerate(c.block(b + 104, 92)):
            vi, ii = c.read('<h', at + 24)[0], c.read('<h', at + 40)[0]
            flags, node, fmt = c.read('<Hbb', at + 44)
            if vi < 0:
                sections.append(dict(index=si, vertices=[], triangles=[], parts=[]))
                continue
            assert fmt in (0, 1, 2, 4, 5, 6, 15), (tag['name'], si, fmt)
            count, length = vbuffers[vi]
            stride = 44 if fmt in (2, 6) else (32 if fmt == 15 else 36)
            start = fixups[vi]
            assert length >= count * stride and start + length <= len(resource)
            vertices, uvs, normals = [], [], []
            for i in range(count):
                pos = start + i * stride
                xyz = struct.unpack_from('<3f', resource, pos)
                assert all(math.isfinite(v) and abs(v) < 100000 for v in xyz)
                if compression & 1:
                    assert all(-0.0001 <= v <= 1.0001 for v in xyz), (tag['name'], si, xyz)
                    xyz = tuple(position_bounds[2 * axis] + value *
                                (position_bounds[2 * axis + 1] - position_bounds[2 * axis])
                                for axis, value in enumerate(xyz))
                vertices.append(xyz)
                if fmt == 15:
                    uv = struct.unpack_from('<2f', resource, pos + 12)
                elif fmt in (0, 4):
                    uv = struct.unpack_from('<2e', resource, pos + 16)
                else:
                    u, v = struct.unpack_from('<2H', resource, pos + 16)
                    uv = (u / 65535, v / 65535)
                    if compression & 2:
                        uv = (uv_bounds[0] + uv[0] * (uv_bounds[1] - uv_bounds[0]),
                              uv_bounds[2] + uv[1] * (uv_bounds[3] - uv_bounds[2]))
                uvs.append(uv)
                n = (struct.unpack_from('<3f', resource, pos + 20) if fmt == 15 else
                     tuple(max(-1.0, value / 32767.0) for value in struct.unpack_from('<3h', resource, pos + 20)))
                normal_length = math.sqrt(sum(v * v for v in n))
                normals.append(tuple(v / normal_length for v in n) if normal_length > 0.000001 else (0, 0, 1))
            if ii < 0 or flags & 16:
                values, ifmt, restart = list(range(count)), c.data[at + 50], 0xFFFFFFFF
            else:
                ifmt, ilen = ibuffers[ii]
                size = 4 if count > 65535 else 2
                istart = fixups[len(vbuffers) * 2 + ii]
                assert istart + ilen <= len(resource)
                values = struct.unpack_from('<' + ('I' if size == 4 else 'H') * (ilen // size), resource, istart)
                restart = (1 << (size * 8)) - 1
            parts, faces = [], []
            raw_parts = c.block(at, 24)
            for part in raw_parts:
                material = c.read('<h', part)[0]
                first, n = c.read('<II', part + 4)
                assert first + n <= len(values), (tag['name'], si, first, n, len(values))
                triangles = self.triangles(values[first:first + n], ifmt, restart)
                assert all(0 <= index < count for triangle in triangles for index in triangle)
                parts.append(dict(material=material, first=len(faces), count=len(triangles),
                                  part_type=c.data[part + 16], specialized_render=c.data[part + 17],
                                  flags=c.read('<H', part + 18)[0]))
                faces.extend(triangles)
            if not raw_parts:
                faces = self.triangles(values, ifmt, restart)
            sections.append(dict(index=si, vertices=vertices, uv=uvs, normals=normals, triangles=faces,
                                 parts=parts, rigid_node=node, vertex_format=fmt))
        regions = []
        for at in c.block(b + 12, 16):
            regions.append(dict(name=c.sid(c.u32(at)), permutations=[
                dict(name=c.sid(c.u32(p)), first=c.read('<h', p + 4)[0], count=c.read('<h', p + 6)[0])
                for p in c.block(at + 4, 24)]))
        nodes = [dict(name=c.sid(c.u32(a)), parent=c.read('<h', a + 4)[0],
                      position=c.read('<3f', a + 12), rotation=c.read('<4f', a + 24), scale=c.read('<f', a + 40)[0])
                 for a in c.block(b + 48, 96)]
        markers = [dict(name=c.sid(c.u32(a)), instances=[
            dict(region=c.data[p], permutation=c.data[p + 1], node=c.read('<b', p + 2)[0],
                 position=c.read('<3f', p + 4), rotation=c.read('<4f', p + 16), scale=c.read('<f', p + 32)[0])
            for p in c.block(a + 4, 48)]) for a in c.block(b + 60, 16)]
        materials = [c.reference(a) for a in c.block(b + 72, 44)]
        return dict(schema_version=3, tag=tag, sections=sections, regions=regions, nodes=nodes, markers=markers, materials=materials,
                    resource_id=c.u32(b + 248), resource_bytes=len(resource),
                    compression_flags=compression, position_bounds=position_bounds,
                    source_schema='ReachMCC mode.xml; permutation stride 24; float MCC streams with flagged position/UV decompression')


def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('names', nargs='*')
    parser.add_argument('--missing', action='store_true')
    args = parser.parse_args()
    assets = NativeAssets()
    audit = json.loads((HERE / 'research/native_palette_audit.json').read_text())
    assert hashlib.sha256(assets.c.data).hexdigest() == audit['cache']['sha256'], 'Cache changed since its audit'
    output = HERE / 'assets/models'
    output.mkdir(parents=True, exist_ok=True)
    names = list(args.names)
    if args.missing:
        previous = json.loads((FORGE / 'object-catalog/catalog-textured.json').read_text())
        names.extend(row['name'] for row in previous if not row['image'])
    if not names:
        parser.error('Supply object names or --missing')
    completed, errors, seen = [], [], set()
    for name in names:
        row = next(r for r in audit['objects'] if r['name'] == name)
        tag = row['native']['render_model']
        if tag['index'] in seen:
            continue
        seen.add(tag['index'])
        try:
            data = assets.model(tag['index'])
        except Exception as error:
            errors.append(dict(name=name, tag=tag, error=repr(error)))
            print('ASSET_ERROR', name, repr(error), flush=True)
            continue
        path = output / (str(tag['index']) + '.json.gz')
        packed = gzip.compress(json.dumps(data, separators=(',', ':')).encode(), mtime=0)
        path.write_bytes(packed)
        vertices = [v for section in data['sections'] for v in section['vertices']]
        summary = dict(name=name, tag_index=tag['index'], output=str(path), sha256=hashlib.sha256(packed).hexdigest(),
                       sections=len(data['sections']), vertices=len(vertices),
                       triangles=sum(len(s['triangles']) for s in data['sections']),
                       minimum=[min(v[k] for v in vertices) for k in range(3)] if vertices else None,
                       maximum=[max(v[k] for v in vertices) for k in range(3)] if vertices else None)
        completed.append(summary)
        if not args.missing or len(completed) % 10 == 0:
            print('ASSET_PROGRESS', len(completed), json.dumps(summary), flush=True)
    report = dict(cache_sha256=audit['cache']['sha256'], decoder_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                  completed=completed, errors=errors, requested_models=len(seen))
    (HERE / 'research/native-model-extraction.json').write_text(json.dumps(report, indent=2) + '\n')
    print('ASSET_COMPLETE', len(completed), 'models;', len(errors), 'errors', flush=True)
    if errors:
        sys.exit(1)


if __name__ == '__main__':
    main()
