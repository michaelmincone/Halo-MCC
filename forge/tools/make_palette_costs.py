"""Write palette_costs.json (stock price and shared maximum per Forge World palette entry), replacing the lost
wrong-way/research/palette_costs.json. Source: forge_world_objects.md, which was generated from that file
(itself read from the installed forge_halo.map). Same row keys the old builders read:
quota_index, category, price_per_instance, maximum_allowed.
Usage: python3 make_palette_costs.py palette_costs.json"""
import json, re, sys
from pathlib import Path
DOC = Path(__file__).resolve().parents[1] / 'forge_world_objects.md'
rows = {}; last = None
for line in DOC.read_text().splitlines():
    c = [x.strip() for x in line.strip().strip('|').split('|')]
    if len(c) < 7 or not c[0].isdigit():
        continue
    entry, smax, price = c[3], c[4], c[5]
    if entry != '″':
        m = re.match(r'(\d+) `([^`]+)`', entry)
        last = dict(quota_index=int(m.group(1)), category=m.group(2), maximum_allowed=int(smax), price_per_instance=int(price), objects=[])
        rows[last['quota_index']] = last
    last['objects'].append(dict(type_id=int(c[0]), name=c[1], internal=c[2].strip('`')))
json.dump(dict(source=str(DOC.name), note='prices and shared maxima from the installed forge_halo.map (build Jun 21 2023), via forge_world_objects.md',
               rows=[rows[k] for k in sorted(rows)]), open(sys.argv[1], 'w'), indent=1)
print('ROWS', len(rows))
