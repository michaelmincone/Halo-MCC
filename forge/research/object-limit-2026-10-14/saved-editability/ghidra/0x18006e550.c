/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006e550; PE exception range ends: 0x18006e637.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_18006e550(longlong param_1,uint param_2,undefined8 *param_3)

{
  undefined8 *puVar1;
  uint uVar2;
  undefined8 uVar3;
  ulonglong uVar4;
  longlong lVar5;
  undefined1 uVar6;
  longlong unaff_GS_OFFSET;
  
  uVar6 = 0;
  uVar4 = *(ulonglong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8);
  if (*(char *)(*(longlong *)(uVar4 + 0x48) + 0x11) == '\x04') {
    if (0x28a < param_2) goto LAB_18006e629;
    lVar5 = (longlong)(int)param_2 * 0x4c;
  }
  else {
    lVar5 = (longlong)(int)param_2 * 0x4c;
    if ((*(byte *)(lVar5 + 0x14fc + param_1) & 1) == 0) {
      func_0x00018078932a(param_3,0,0x4c);
      uVar4 = 0xffffffff;
      *(undefined2 *)((longlong)param_3 + 2) = 0xffff;
      *(undefined4 *)((longlong)param_3 + 4) = 0xffffffff;
      *(undefined2 *)((longlong)param_3 + 0x2c) = 0xffff;
      *(undefined1 *)(param_3 + 8) = 0;
      *(undefined1 *)((longlong)param_3 + 0x43) = 0;
      *(undefined1 *)((longlong)param_3 + 0x4a) = 0xff;
      *(undefined2 *)((longlong)param_3 + 0x44) = 0xffff;
      *(undefined1 *)((longlong)param_3 + 0x47) = 8;
      goto LAB_18006e629;
    }
  }
  puVar1 = (undefined8 *)(lVar5 + 0x14fc + param_1);
  uVar3 = puVar1[1];
  uVar6 = 1;
  *param_3 = *puVar1;
  param_3[1] = uVar3;
  puVar1 = (undefined8 *)(lVar5 + 0x150c + param_1);
  uVar3 = puVar1[1];
  param_3[2] = *puVar1;
  param_3[3] = uVar3;
  puVar1 = (undefined8 *)(lVar5 + 0x151c + param_1);
  uVar3 = puVar1[1];
  param_3[4] = *puVar1;
  param_3[5] = uVar3;
  puVar1 = (undefined8 *)(lVar5 + 0x152c + param_1);
  uVar3 = puVar1[1];
  param_3[6] = *puVar1;
  param_3[7] = uVar3;
  param_3[8] = *(undefined8 *)(lVar5 + 0x153c + param_1);
  uVar2 = *(uint *)(lVar5 + 0x1544 + param_1);
  uVar4 = (ulonglong)uVar2;
  *(uint *)(param_3 + 9) = uVar2;
LAB_18006e629:
  return CONCAT71((int7)(uVar4 >> 8),uVar6);
}

