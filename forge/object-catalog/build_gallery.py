"""Build labeled picture sheets and a self-contained-data HTML gallery."""
import json
import argparse
import math
import re
from collections import defaultdict
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

HERE = Path(__file__).resolve().parent
parser = argparse.ArgumentParser()
parser.add_argument('--full', action='store_true')
args = parser.parse_args()
data = json.loads((HERE / ('catalog-full.json' if args.full else 'catalog-textured.json')).read_text())
assert len(data) == 348, 'Finish rendering all objects before building the gallery.'
assert sum(bool(row['image']) for row in data) == (348 if args.full else 190)
for row in data:
    if row['image']:
        assert (HERE / row['image']).is_file(), row['name']

tree = json.loads((HERE.parent / 'Mjolnir-Forge-Editor/Addon/mvarlib/data/palette_tree.json').read_text())
if args.full:
    import sys
    sys.path.insert(0, str(HERE.parent / 'Mjolnir-Forge-Editor/Addon'))
    from mvarlib import catalog
    tree = catalog.browser_tree(tree)
ordered_names = []


def ordered(groups):
    for group in groups:
        ordered_names.extend(group.get('leaves', []))
        ordered(group.get('groups', []))


ordered(tree['groups'])
rank = {name: i for i, name in enumerate(ordered_names)}
data.sort(key=lambda row: (rank.get(row['name'], 10000), row['id']))

groups = defaultdict(list)
for row in data:
    if not row['menu']:
        continue
    parts = row['menu'].split(' > ')
    group = parts[1] if parts[0] == 'Structure' and len(parts) > 1 else parts[0]
    if group in ('Spawning', 'Objectives'):
        group = 'Spawns And Objectives'
    groups[group].append(row)

sheet_dir = HERE / 'sheets'
sheet_dir.mkdir(exist_ok=True)
font = ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial.ttf', 19)
small = ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial.ttf', 15)
title = ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial Bold.ttf', 32)


def wrap(text, draw, max_width=266):
    lines = ['']
    for word in text.split():
        trial = (lines[-1] + ' ' + word).strip()
        if draw.textlength(trial, font=font) > max_width and lines[-1]:
            lines.append(word)
        else:
            lines[-1] = trial
    return lines


sheets = []
paged = []
for name, rows in groups.items():
    pages = math.ceil(len(rows) / 30)
    for page in range(pages):
        title_name = name if pages == 1 else f'{name} {page+1} of {pages}'
        paged.append((title_name, rows[page*30:(page+1)*30]))
for name, rows in paged:
    cols = min(5, len(rows))
    cellw, cellh, pad, header = 300, 289, 22, 105
    image = Image.new('RGB', (cols * cellw + pad * 2, math.ceil(len(rows) / cols) * cellh + header + pad), '#10151d')
    draw = ImageDraw.Draw(image)
    heading = 'HALO REACH  /  ' + name.upper()
    heading_font = title
    heading_size = 32
    while draw.textlength(heading, font=heading_font) > image.width - 2 * pad:
        heading_size -= 1
        heading_font = ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial Bold.ttf', heading_size)
    draw.text((pad, 17), heading, font=heading_font, fill='#e9edf4')
    caption = (f'{len(rows)} Blender menu entries · actual plugin models · each fitted to frame'
               if cols > 2 else f'{len(rows)} Blender menu entries · fitted previews')
    draw.text((pad, 61), caption, font=small, fill='#b7c9d8')
    for i, row in enumerate(rows):
        x, y = pad + (i % cols) * cellw, header + (i // cols) * cellh
        if row['image']:
            with Image.open(HERE / row['image']) as original:
                preview = original.convert('RGB').resize((284, 213), Image.Resampling.LANCZOS)
                image.paste(preview, (x, y))
        else:
            draw.rectangle((x, y, x + 284, y + 213), fill='#222c39')
            draw.text((x + 28, y + 84), 'No bundled mesh', font=font, fill='#bbc7d4')
        for j, line in enumerate(wrap(row['name'], draw)):
            draw.text((x + 5, y + 219 + j * 22), line, font=font, fill='#e9edf4')
        draw.text((x + 5, y + 266), '#' + str(row['id']), font=small, fill='#9db4c7')
    slug = re.sub('[^a-z0-9]+', '-', name.lower()).strip('-')
    dest = sheet_dir / f'{slug}.jpg'
    image.save(dest, quality=94, subsampling=0)
    sheets.append(dict(name=name, count=len(rows), path=f'sheets/{dest.name}'))

template = (HERE / 'gallery.template.html').read_text()
serialize = lambda value: json.dumps(value, separators=(',', ':')).replace('<', '\\u003c')
(HERE / 'index.html').write_text(template.replace('__CATALOG_DATA__', serialize(data)).replace('__SHEETS_DATA__', serialize(sheets)))
(HERE / 'sheets.json').write_text(json.dumps(sheets, indent=2))
print('Built gallery:', len(data), 'entries;', len(sheets), 'sheets;', sum(x['count'] for x in sheets), 'menu entries covered')
