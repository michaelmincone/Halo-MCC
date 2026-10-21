"""Read native shader texture bindings and decode bounded local preview textures."""
import io
from pathlib import Path
import struct

from PIL import Image


class AssetMaterials:
    def __init__(self, assets, output, max_texture_size=1024):
        self.assets, self.c = assets, assets.c
        self.output = Path(output)
        self.output.mkdir(parents=True, exist_ok=True)
        self.max_texture_size = max_texture_size
        self.shaders, self.textures = {}, {}

    def bitmap(self, tag_index, image_index=0):
        key = (tag_index, image_index)
        if key in self.textures:
            return self.textures[key]
        c = self.c
        tag = c.tags[tag_index]
        assert tag['group'] == 'bitm'
        images = c.block(tag['offset'] + 0x7C, 0x38)
        resources = c.block(tag['offset'] + 0xA8, 8)
        requested_image_index = image_index
        assert images, ('Bitmap has no native frames', tag['name'])
        if not 0 <= image_index < len(images):
            image_index = 0
        at = images[image_index]
        width, height = c.read('<HH', at)
        fmt = c.read('<h', at + 8)[0]
        interleaved = c.read('<b', at + 18)[0]
        interleaved_resources = c.block(tag['offset'] + 0xB4, 8)
        assert not (0 <= interleaved < len(interleaved_resources)), ('Interleaved bitmap requires its own layout', tag['name'], interleaved)
        assert 0 < width <= 16384 and 0 < height <= 16384
        assert image_index < len(resources)
        resource_id = c.u32(resources[image_index])
        _, data = self.assets.resource(resource_id)
        if fmt in (14, 15, 16):
            block = 8 if fmt == 14 else 16
            size = ((width + 3) // 4) * ((height + 3) // 4) * block
            assert size <= len(data), (tag['name'], size, len(data))
            fourcc = {14: b'DXT1', 15: b'DXT3', 16: b'DXT5'}[fmt]
            header = (b'DDS ' + struct.pack('<7I', 124, 0x81007, height, width, size, 0, 1)
                      + bytes(44) + struct.pack('<II4sIIIII', 32, 4, fourcc, 0, 0, 0, 0, 0)
                      + struct.pack('<5I', 0x1000, 0, 0, 0, 0))
            image = Image.open(io.BytesIO(header + data[:size])).convert('RGBA')
        elif fmt in (10, 11):
            size = width * height * 4
            assert size <= len(data)
            image = Image.frombytes('RGBA', (width, height), bytes(data[:size]), 'raw', 'BGRA')
            if fmt == 10:
                image.putalpha(255)
        elif fmt in (0, 1):
            size = width * height
            assert size <= len(data)
            channel = Image.frombytes('L', (width, height), bytes(data[:size]))
            if fmt == 0:
                image = Image.new('RGBA', (width, height), (255, 255, 255, 255))
                image.putalpha(channel)
            else:
                image = channel.convert('RGBA')
        elif fmt in (36, 38):
            block = 8 if fmt == 36 else 16
            size = ((width + 3) // 4) * ((height + 3) // 4) * block
            assert size <= len(data)
            header = (b'DDS ' + struct.pack('<7I', 124, 0x81007, height, width, size, 0, 1)
                      + bytes(44) + struct.pack('<II4sIIIII', 32, 4, b'DX10', 0, 0, 0, 0, 0)
                      + struct.pack('<5I', 0x1000, 0, 0, 0, 0)
                      + struct.pack('<5I', 80 if fmt == 36 else 83, 3, 0, 1, 0))
            image = Image.open(io.BytesIO(header + data[:size])).convert('RGBA')
        else:
            raise ValueError(('Unsupported native bitmap format', tag['name'], fmt))
        image.thumbnail((self.max_texture_size, self.max_texture_size), Image.Resampling.LANCZOS)
        path = self.output / f'{tag_index}_{image_index}.png'
        image.save(path)
        row = dict(tag=tag, image_index=image_index, requested_image_index=requested_image_index,
                   frame_selection=('explicit native frame' if image_index == requested_image_index else
                                    'first native frame for static preview; sampler index exceeds frame table'),
                   format=fmt, original_size=[width, height],
                   preview_size=list(image.size), path=str(path.resolve()), resource_id=resource_id)
        self.textures[key] = row
        return row

    def shader(self, tag_index):
        if tag_index in self.shaders:
            return self.shaders[tag_index]
        row = self._read_shader(tag_index)
        self.shaders[tag_index] = row
        return row

    def _read_shader(self, tag_index):
        c = self.c
        tag = c.tags[tag_index]
        row = dict(tag=tag, samplers=[], floats={}, diffuse=None, uv_transform=[1, 1, 0, 0])
        if not tag['group'].startswith('rm'):
            return row
        definition = c.reference(tag['offset'])
        row['definition'] = definition
        row['options'] = {}
        if definition and definition['group'] == 'rmdf':
            methods = c.block(definition['offset'] + 0x10, 24)
            indices = [c.read('<h', at)[0] for at in c.block(tag['offset'] + 0x20, 2)]
            for i, method in enumerate(methods):
                choices = c.block(method + 4, 28)
                index = indices[i] if i < len(indices) else 0
                if 0 <= index < len(choices):
                    row['options'][c.sid(c.u32(method))] = c.sid(c.u32(choices[index]))
        props = c.block(tag['offset'] + 0x38, 0xB4)
        if not props:
            return row
        prop = props[0]
        template = c.reference(prop)
        if template is None:
            return row
        row['template'] = template
        usages = [c.sid(c.u32(a)) for a in c.block(template['offset'] + 0x6C, 4)]
        float_usages = [c.sid(c.u32(a)) for a in c.block(template['offset'] + 0x48, 4)]
        constants = [list(c.read('<4f', a)) for a in c.block(prop + 0x1C, 16)]
        row['floats'] = dict(zip(float_usages, constants))
        maps = c.block(prop + 0x10, 24)
        assert len(usages) == len(maps), (tag['name'], len(usages), len(maps))
        for usage, at in zip(usages, maps):
            bitmap = c.reference(at)
            image_index = c.read('<h', at + 16)[0]
            transform_index = c.read('<b', at + 21)[0]
            sample = dict(usage=usage, bitmap=bitmap, image_index=image_index,
                          transform=constants[transform_index] if 0 <= transform_index < len(constants) else [1, 1, 0, 0])
            row['samplers'].append(sample)
        ranked = sorted(enumerate(row['samplers']), key=lambda pair: (
            0 if pair[1]['usage'] == 'base_map' else
            1 if pair[1]['usage'].startswith('base_map_m_') else
            2 if pair[1]['usage'] in ('diffuse_map', 'albedo_map', 'color_map') else
            3 if pair[1]['usage'] in ('self_illum_map', 'self_illum_map2') else
            4 if pair[1]['usage'] in ('alpha_mask_map', 'foam_texture') else 99, pair[0]))
        for _i, sample in ranked:
            if sample['bitmap'] is None:
                continue
            if not sample['usage'].startswith(('base_map', 'diffuse_map', 'albedo_map', 'color_map', 'self_illum_map', 'alpha_mask_map', 'foam_texture')):
                continue
            row['diffuse'] = self.bitmap(sample['bitmap']['index'], max(0, sample['image_index']))
            row['diffuse_usage'] = sample['usage']
            row['uv_transform'] = sample['transform']
            break
        return row
