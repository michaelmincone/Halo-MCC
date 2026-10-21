/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006c848; PE exception range ends: 0x18006c948.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1 FUN_18006c848(longlong param_1,undefined8 *param_2)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  undefined1 uVar6;
  int *piVar7;
  int *piVar8;
  longlong lVar9;
  
  uVar6 = 0;
  if (param_2 != (undefined8 *)0x0) {
    *param_2 = 0;
  }
  lVar9 = _DAT_180c1a230;
  if (_DAT_180c1a230 == 0) {
    return 0;
  }
  if (*(int *)(_DAT_180c1a230 + 0x10) != *(int *)(param_1 + 0x2b4)) {
    return 0;
  }
  iVar3 = FUN_18006bd5c(_DAT_180c1a230);
  if (*(int *)(lVar9 + 0x234) < 1) {
    piVar7 = (int *)0x0;
  }
  else {
    uVar1 = *(uint *)(lVar9 + 0x238);
    piVar7 = (int *)(*(longlong *)((ulonglong)(uVar1 >> 0x1c) * 8 + 0x184e39f20) +
                    (ulonglong)uVar1 * 4);
  }
  iVar2 = *(int *)(param_1 + 0x2f0);
  piVar4 = (int *)0x0;
  piVar5 = piVar4;
  if (iVar2 != 0) {
    if (piVar7 != (int *)0x0) {
      if (0 < *piVar7) {
        lVar9 = 0;
        piVar8 = (int *)(*(longlong *)((ulonglong)((uint)piVar7[1] >> 0x1c) * 8 + 0x184e39f20) +
                        (ulonglong)(uint)piVar7[1] * 4);
        do {
          piVar5 = piVar8;
          if (*piVar5 == iVar2) break;
          lVar9 = lVar9 + 1;
          piVar8 = piVar5 + 0xc;
          piVar5 = piVar4;
        } while (lVar9 < *piVar7);
      }
      if (piVar5 != (int *)0x0) goto LAB_18006c91f;
    }
    if (iVar3 != iVar2) {
      uVar6 = 1;
    }
  }
LAB_18006c91f:
  if ((param_2 != (undefined8 *)0x0) && (piVar5 != (int *)0x0)) {
    *param_2 = piVar5;
  }
  return uVar6;
}

