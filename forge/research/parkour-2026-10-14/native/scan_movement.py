#!/usr/bin/env python3
"""Read-only PE movement-string candidates; validate references in Ghidra/assembly."""
import bisect
import hashlib
import json
import re
import struct
from pathlib import Path
import pefile

ROOT = Path(__file__).resolve().parent
SOURCE = Path('/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection/haloreach/haloreach.dll')
raw = SOURCE.read_bytes()
pe = pefile.PE(data=raw, fast_load=True)
base = pe.OPTIONAL_HEADER.ImageBase
names = {'physics_set_gravity', 'biped_ground_jump', 'biped_ground_animated_jump',
         'biped_airborne_default', 'biped_ground_default', 'biped_ground',
         'biped_update', 'biped_force_airborne', 'biped_movement', 'biped_physics',
         'biped_soft_landing_recovery_scale', 'biped_hard_landing_recovery_scale'}
targets = {}
for match in re.finditer(rb'[\x20-\x7e]{7,}', raw):
    name = match.group().decode()
    if name in names:
        rva = pe.get_rva_from_offset(match.start())
        targets[rva] = {'name': name, 'file_offset': hex(match.start()), 'va': hex(base + rva)}
directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[pefile.DIRECTORY_ENTRY['IMAGE_DIRECTORY_ENTRY_EXCEPTION']]
bounds = [(a, b) for a, b, _ in struct.iter_unpack('<III', pe.get_data(directory.VirtualAddress, directory.Size)) if a and b]
starts = [a for a, b in bounds]
rows = []
for section in pe.sections:
    if not section.Characteristics & 0x20000000:
        continue
    data = section.get_data()
    for match in re.finditer(rb'[\x48-\x4f][\x8d\x8b\x89][\x05\x0d\x15\x1d\x25\x2d\x35\x3d]', data):
        at = match.start()
        rva = section.VirtualAddress + at
        target = rva + 7 + struct.unpack_from('<i', data, at + 3)[0]
        if target not in targets:
            continue
        i = bisect.bisect_right(starts, rva) - 1
        entry = bounds[i] if i >= 0 and rva < bounds[i][1] else None
        rows.append({'name': targets[target]['name'], 'target_va': hex(base + target),
                     'candidate_xref_va': hex(base + rva),
                     'entry_va': hex(base + entry[0]) if entry else None,
                     'end_va': hex(base + entry[1]) if entry else None})
out = {'source': str(SOURCE), 'sha256': hashlib.sha256(raw).hexdigest(),
       'limitations': ['Byte-scan candidates may match non-instructions.',
                       'PE unwind ranges are not guaranteed complete logical functions.',
                       'Names alone do not establish semantics or execution.'],
       'strings': list(targets.values()), 'references': rows}
(ROOT / 'movement-candidates.json').write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps({'sha256': out['sha256'], 'references': rows}, indent=2))
