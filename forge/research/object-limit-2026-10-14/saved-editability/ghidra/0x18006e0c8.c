/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006e0c8; PE exception range ends: 0x18006e1b1.
 * Inferred types, callees, and function extents remain provisional.
 */


int FUN_18006e0c8(longlong param_1)

{
  int iVar1;
  ulonglong uVar2;
  byte *pbVar3;
  longlong lVar4;
  ushort *puVar5;
  ulonglong uVar6;
  
  pbVar3 = (byte *)(param_1 + 0x14fc);
  uVar2 = 0;
  uVar6 = uVar2;
  do {
    iVar1 = (int)uVar2;
    if ((*pbVar3 & 1) == 0) {
      if (iVar1 == -1) {
        return -1;
      }
      lVar4 = (longlong)iVar1 * 0x4c;
      puVar5 = (ushort *)(param_1 + 0x14fc + lVar4);
      func_0x00018078932a(puVar5,0,0x4c);
      puVar5[1] = 0xffff;
      puVar5[2] = 0xffff;
      puVar5[3] = 0xffff;
      puVar5[0x16] = 0xffff;
      *(undefined8 *)(lVar4 + 0x153d + param_1) = 0;
      *(undefined2 *)(lVar4 + 0x1545 + param_1) = 0;
      *(undefined1 *)(lVar4 + 0x1547 + param_1) = 0;
      puVar5[0x18] = 0;
      puVar5[0x19] = 0;
      puVar5[0x1a] = 0;
      puVar5[0x1b] = 0;
      puVar5[0x1c] = 0;
      puVar5[0x1d] = 0;
      puVar5[0x1e] = 0;
      puVar5[0x1f] = 0;
      *(undefined1 *)(puVar5 + 0x20) = 0;
      *(undefined1 *)((longlong)puVar5 + 0x43) = 0;
      *(undefined1 *)(puVar5 + 0x25) = 0xff;
      puVar5[0x22] = 0xffff;
      *(undefined1 *)((longlong)puVar5 + 0x47) = 8;
      *puVar5 = *puVar5 | 1;
      *(byte *)(puVar5 + 0x23) = (byte)puVar5[0x23] | 0xc;
      return iVar1;
    }
    uVar2 = (ulonglong)(iVar1 + 1);
    uVar6 = uVar6 + 1;
    pbVar3 = pbVar3 + 0x4c;
  } while ((longlong)uVar6 < 0x28b);
  return -1;
}

