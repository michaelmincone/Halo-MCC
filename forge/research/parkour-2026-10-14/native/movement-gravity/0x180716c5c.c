/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x180716c5c; PE exception range ends: 0x180716dad.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_180716c5c(uint param_1,undefined1 *param_2)

{
  uint uVar1;
  longlong lVar2;
  ushort *puVar3;
  char cVar4;
  short sVar5;
  short sVar6;
  longlong unaff_GS_OFFSET;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar7;
  undefined1 auStack_f8 [32];
  undefined1 auStack_d8 [50];
  short sStack_a6;
  char cStack_34;
  ulonglong uStack_28;
  
  uStack_28 = _DAT_180afa010 ^ (ulonglong)auStack_f8;
  lVar2 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8);
  cStack_34 = '\0';
  puVar3 = *(ushort **)
            (*(longlong *)(*(longlong *)(lVar2 + 0x10) + 0x50) + 0x10 +
            (ulonglong)
            *(ushort *)
             (((ulonglong)param_1 & 0xffff) * 0xd00 + *(longlong *)(*(longlong *)(lVar2 + 8) + 0x50)
             + 0x1c) * 0x18);
  FUN_1806af9c8((ulonglong)param_1,auStack_d8);
  uVar7 = _DAT_180a8afdc;
  if (param_2 != (undefined1 *)0x0) {
    *param_2 = 0;
  }
  cVar4 = func_0x000180485b3c(uVar7);
  if (cVar4 == '\0') {
    if ((cStack_34 == '\0') || (sStack_a6 < 1)) {
      uVar7 = extraout_XMM0_Da;
      if ((char)puVar3[0x47] == '\0') {
        uVar1 = *(uint *)(_DAT_180c1a600 + 4 + (ulonglong)*puVar3 * 8);
        uVar7 = *(undefined4 *)
                 (*(longlong *)((ulonglong)(uVar1 >> 0x1c) * 8 + 0x184e39f20) + 0x4f0 +
                 (ulonglong)uVar1 * 4);
      }
    }
    else {
      sVar6 = sStack_a6 + -1;
      if (6 < sStack_a6) {
        sVar6 = 5;
      }
      sVar5 = 5;
      if (sVar6 < 5) {
        sVar5 = sVar6;
      }
      uVar7 = func_0x000180732dc4(sVar5);
      if (param_2 != (undefined1 *)0x0) {
        *param_2 = 6 < sStack_a6;
      }
    }
  }
  else {
    uVar7 = func_0x000180732dc4(5);
    if (param_2 != (undefined1 *)0x0) {
      *param_2 = 1;
    }
  }
  FUN_180787e00(uVar7);
  return;
}

