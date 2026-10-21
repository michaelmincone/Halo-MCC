"""Resolve Forge object variants, child attachments and native texture bindings."""
import argparse
import gzip
import hashlib
import json
from pathlib import Path

from native_assets import NativeAssets, HERE, FORGE
from asset_materials import AssetMaterials


class PrefabExtractor:
    def __init__(self):
        self.assets = NativeAssets()
        self.c = self.assets.c
        self.models = {}
        self.materials = AssetMaterials(self.assets, HERE / 'assets/textures')
        self.prefab_cache = {}

    def model(self, index):
        if index not in self.models:
            path = HERE / f'assets/models/{index}.json.gz'
            data = json.loads(gzip.decompress(path.read_bytes())) if path.exists() else None
            if data is None or data.get('schema_version') != 3:
                data = self.assets.model(index)
                path.parent.mkdir(exist_ok=True, parents=True)
                path.write_bytes(gzip.compress(json.dumps(data, separators=(',', ':')).encode(), mtime=0))
            assert data['tag']['name'] == self.c.tags[index]['name']
            self.models[index] = data
        return self.models[index]

    def marker(self, model, name, chosen, allow_missing=False):
        if not name:
            return None
        matches = [group for group in model['markers'] if group['name'] == name]
        if not matches:
            if allow_missing:
                return None
            raise ValueError(('Missing attachment marker', model['tag']['name'], name))
        for marker in matches[0]['instances']:
            if marker['region'] == 255 or chosen.get(marker['region']) == marker['permutation']:
                return marker
        raise ValueError(('No attachment marker in selected permutation', model['tag']['name'], name, chosen))

    def prefab(self, object_index, requested_variant='', depth=0):
        assert depth < 8, 'Attachment graph exceeds bounded depth'
        key = (object_index, requested_variant)
        if key in self.prefab_cache:
            return self.prefab_cache[key]
        c = self.c
        obj = c.tags[object_index]
        hlmt = c.reference(obj['offset'] + 0x64)
        if hlmt is None:
            return dict(object=obj, model=None, children=[], sections=[], no_render_model=True)
        assert hlmt['group'] == 'hlmt'
        render = c.reference(hlmt['offset'])
        if render is None:
            return dict(object=obj, model=None, children=[], sections=[], no_render_model=True)
        assert render['group'] == 'mode'
        model = self.model(render['index'])
        default = c.sid(c.u32(obj['offset'] + 0x60))
        variants = c.block(hlmt['offset'] + 0x84, 0x38)
        requested = requested_variant or default
        selected = None
        if variants:
            selected = next((at for at in variants if c.sid(c.u32(at)) == requested), None)
            if selected is None and not requested:
                selected = next((at for at in variants if c.sid(c.u32(at)) == 'default'), variants[0])
            if selected is None:
                raise ValueError(('Missing model variant', obj['name'], requested,
                                  [c.sid(c.u32(at)) for at in variants]))
        chosen = {}
        explicit = c.block(selected + 0x14, 0x18) if selected is not None else []
        if explicit:
            for region in explicit:
                ri = c.read('<b', region + 4)[0]
                if ri < 0:
                    continue
                assert ri < len(model['regions']), (obj['name'], ri, len(model['regions']))
                options = c.block(region + 8, 0x24)
                if not options:
                    continue
                winner = max(options, key=lambda at: c.read('<f', at + 8)[0])
                pi = c.read('<b', winner + 4)[0]
                if pi >= 0:
                    assert pi < len(model['regions'][ri]['permutations'])
                    chosen[ri] = pi
        else:
            for ri, region in enumerate(model['regions']):
                permutations = region['permutations']
                pi = next((i for i, p in enumerate(permutations) if p['name'] == 'default'),
                          next((i for i, p in enumerate(permutations) if p['first'] >= 0 and p['count'] > 0), -1))
                if pi >= 0:
                    chosen[ri] = pi
        sections = set()
        for ri, pi in chosen.items():
            permutation = model['regions'][ri]['permutations'][pi]
            if permutation['first'] >= 0 and permutation['count'] > 0:
                for index in range(permutation['first'], permutation['first'] + permutation['count']):
                    assert 0 <= index < len(model['sections'])
                    sections.add(index)
        if not model['regions']:
            sections.update(range(len(model['sections'])))
        material_indices = {part['material'] for si in sections for part in model['sections'][si]['parts']}
        for index in material_indices:
            if 0 <= index < len(model['materials']) and model['materials'][index]:
                self.materials.shader(model['materials'][index]['index'])
        row = dict(object=obj, hlmt=hlmt, model=render['index'],
                   requested_variant=requested_variant, object_default_variant=default,
                   selected_variant=c.sid(c.u32(selected)) if selected is not None else '',
                   sections=sorted(sections), chosen_permutations=chosen, children=[])
        if selected is not None:
            for at in c.block(selected + 0x20, 0x20):
                child = c.reference(at + 12)
                if child is None:
                    continue
                parent_marker, child_marker = c.sid(c.u32(at)), c.sid(c.u32(at + 4))
                child_variant = c.sid(c.u32(at + 8))
                nested = self.prefab(child['index'], child_variant, depth + 1)
                parent_pose = self.marker(model, parent_marker, chosen)
                child_pose = (self.marker(self.model(nested['model']), child_marker,
                                          {int(k): v for k, v in nested['chosen_permutations'].items()}, allow_missing=True)
                              if nested['model'] is not None else None)
                row['children'].append(dict(prefab=nested, parent_marker=parent_pose, child_marker=child_pose,
                                            parent_marker_name=parent_marker, child_marker_name=child_marker,
                                            child_marker_resolution=('native marker' if child_pose is not None else
                                                                     'model origin' if not child_marker else
                                                                     'model origin: requested marker absent in native model')))
        self.prefab_cache[key] = row
        return row


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('names', nargs='*')
    parser.add_argument('--missing', action='store_true')
    args = parser.parse_args()
    extractor = PrefabExtractor()
    audit = json.loads((HERE / 'research/native_palette_audit.json').read_text())
    assert hashlib.sha256(extractor.c.data).hexdigest() == audit['cache']['sha256']
    names = list(args.names)
    if args.missing:
        names.extend(row['name'] for row in json.loads((FORGE / 'object-catalog/catalog-textured.json').read_text()) if not row['image'])
    if not names:
        parser.error('Supply names or --missing')
    prefabs, errors = {}, []
    for name in dict.fromkeys(names):
        row = next(item for item in audit['objects'] if item['name'] == name)
        native = row['native']
        try:
            prefab = extractor.prefab(native['object']['index'], native['model_variant_name'])
            prefabs[name] = prefab
        except Exception as error:
            errors.append(dict(name=name, error=repr(error)))
            print('PREFAB_ERROR', name, repr(error), flush=True)
        if len(prefabs) % 20 == 0:
            print('PREFAB_PROGRESS', len(prefabs), 'objects;', len(extractor.materials.textures), 'textures', flush=True)
    output = HERE / 'assets'
    (output / 'prefabs.json').write_text(json.dumps(prefabs, separators=(',', ':')))
    (output / 'materials.json').write_text(json.dumps(extractor.materials.shaders, separators=(',', ':')))
    (output / 'textures.json').write_text(json.dumps(list(extractor.materials.textures.values()), indent=2))
    report = dict(cache_sha256=audit['cache']['sha256'], objects=len(prefabs),
                  models=len(extractor.models), shaders=len(extractor.materials.shaders),
                  textures=len(extractor.materials.textures), errors=errors)
    def limitations(node, root):
        for child in node.get('children', []):
            if child['child_marker_name'] and child['child_marker'] is None:
                yield dict(object=root, child=child['prefab']['object']['name'],
                           resolution=child['child_marker_resolution'], marker=child['child_marker_name'])
            yield from limitations(child['prefab'], root)
    report['attachment_origin_fallbacks'] = [issue for name, row in prefabs.items() for issue in limitations(row, name)]
    report['static_texture_frames'] = [dict(tag=row['tag']['name'], requested=row['requested_image_index'], actual=row['image_index'])
                                       for row in extractor.materials.textures.values()
                                       if row['requested_image_index'] != row['image_index']]
    (HERE / 'research/native-prefab-extraction.json').write_text(json.dumps(report, indent=2) + '\n')
    print('PREFAB_COMPLETE', json.dumps(report), flush=True)
    if errors:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
