#!/usr/bin/env python3
"""Reproduce selected native constants and bounded leaf disassembly, read-only."""
import hashlib
import json
from pathlib import Path
import struct
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP

ROOT = Path(__file__).resolve().parent
SOURCE = Path('/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection/haloreach/haloreach.dll')
EXPECTED = '738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894'
raw = SOURCE.read_bytes()
digest = hashlib.sha256(raw).hexdigest()
if digest != EXPECTED:
    raise ValueError('Native target changed; re-analyze addresses before extracting')
pe = pefile.PE(data=raw, fast_load=True)
base = pe.OPTIONAL_HEADER.ImageBase
if pe.FILE_HEADER.Machine != 0x8664 or base != 0x180000000:
    raise ValueError('Unexpected PE architecture/image base')
constants = {}
for name, va in [('base_gravity', 0x180a8b29c), ('default_scale', 0x180a8af18),
                 ('jump_percent_divisor', 0x180a8b450), ('jump_default_sentinel_after_division', 0x180a8b7e8)]:
    data = pe.get_data(va - base, 4)
    constants[name] = {'va': hex(va), 'file_offset': hex(pe.get_offset_from_rva(va-base)),
                       'bytes_le': data.hex(), 'float32': struct.unpack('<f', data)[0]}
md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True
leaves = []
for va in [0x1804a5484, 0x18014fe2c]:
    instructions = []
    for instruction in md.disasm(pe.get_data(va-base, 256), va):
        instructions.append(instruction)
        if instruction.mnemonic == 'ret':
            break
    if not instructions or instructions[-1].mnemonic != 'ret':
        raise ValueError('Leaf did not terminate within declared bounded view')
    starts = {i.address for i in instructions}
    for instruction in instructions:
        if instruction.mnemonic.startswith('j'):
            targets = [o.imm for o in instruction.operands if o.type == X86_OP_IMM]
            if any(t not in starts for t in targets):
                raise ValueError('Branch leaves the bounded leaf view')
    lines = [f'; SHA256 {digest}', '; Bounded leaf view through first RET; no PE unwind entry.',
             '; Direct branches remain within decoded view; no execution observed.']
    for instruction in instructions:
        refs = [hex(instruction.address + instruction.size + o.mem.disp)
                for o in instruction.operands if o.type == X86_OP_MEM and o.mem.base == X86_REG_RIP]
        lines.append(f'{instruction.address:016x} {instruction.bytes.hex():<26} '
                     f'{instruction.mnemonic} {instruction.op_str}' + (' ; '+', '.join(refs) if refs else ''))
    destination = ROOT / 'disassembly' / (hex(va) + '-leaf.asm')
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text('\n'.join(lines)+'\n')
    leaves.append({'entry_va': hex(va), 'ret_va': hex(instructions[-1].address),
                   'instruction_count': len(instructions), 'branch_targets_in_view': True,
                   'listing': str(destination.relative_to(ROOT))})
out = {'source_path': str(SOURCE), 'sha256': digest, 'image_base': hex(base),
       'constants': constants, 'bounded_leaves': leaves,
       'interpretation': {
           'gravity': 'Initializer/reset store 0x40857af5 in TLS+0x330[0]; physics_set_gravity multiplies its argument by the same base constant.',
           'entity_scale': '0x1804a5484 starts at 1.0, accepts bipd+0x668 only if positive, then applies positive object+0xdb4 multiplier.',
           'bsp_scale': '0x18014fe2c returns 1.0 for invalid BSP, else the selected scenario BSP+0xa8 value; stock Forge World entries are 1.0.',
           'jump_traits': '0x180538914 reads bipd+0x4f0, applies stun penalty from bipd+0x308, and multiplies by the runtime jump trait divided by 100, with default/zero handling.'},
       'limitations': ['Static PC evidence, not Xbox execution.', 'Full Havok integration and all player movement states were not reconstructed.',
                       'These inputs do not establish a calibrated edge-to-edge gap or trait inheritance precedence.']}
(ROOT / 'native-values.json').write_text(json.dumps(out, indent=2)+'\n')
print(json.dumps({'sha256': digest, 'constants': constants, 'bounded_leaves': leaves}, indent=2))
