"""Tile inspect_render.py's driver's-eye views six to a page, labelled with section and distance.
Usage: python contact_sheets.py out_dir   (needs Pillow; writes sheet_NN.png into out_dir)"""
import json, os, sys
from PIL import Image, ImageDraw, ImageFont
D = sys.argv[1]
idx = json.load(open(os.path.join(D, 'index.json')))['drive']
try:
    F = ImageFont.truetype('/System/Library/Fonts/HelveticaNeue.ttc', 20, index=1)
except OSError:
    F = ImageFont.load_default()
W, H = 800, 500
for page in range(0, len(idx), 6):
    sheet = Image.new('RGB', (W * 3, H * 2), (20, 20, 20)); dr = ImageDraw.Draw(sheet)
    for k, item in enumerate(idx[page:page + 6]):
        im = Image.open(os.path.join(D, item['file'])).convert('RGB').resize((W, H))
        x, y = (k % 3) * W, (k // 3) * H; sheet.paste(im, (x, y))
        label = '#%d  %s  @%.0f WU' % (page + k, item['section'], item['distance_wu'])
        dr.rectangle([x, y, x + dr.textlength(label, font=F) + 16, y + 30], fill=(0, 0, 0)); dr.text((x + 8, y + 4), label, fill=(255, 255, 255), font=F)
    sheet.save(os.path.join(D, 'sheet_%02d.png' % (page // 6)))
print('sheets', (len(idx) + 5) // 6)
