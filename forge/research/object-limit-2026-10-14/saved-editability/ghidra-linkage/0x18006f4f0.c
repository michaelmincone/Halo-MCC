/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006f4f0; PE exception range ends: 0x18006f56f.
 * Inferred types, callees, and function extents remain provisional.
 */


void FUN_18006f4f0(longlong param_1,int param_2)

{
  char cVar1;
  longlong lStack_28;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  int iStack_10;
  undefined4 uStack_c;
  
  lStack_28 = 0;
  uStack_1c = 0;
  uStack_18 = 0;
  uStack_14 = 0;
  iStack_10 = -1;
  uStack_c = 0x86868686;
  uStack_20 = 0x5ce;
  while( true ) {
    cVar1 = FUN_180473a78(&lStack_28);
    if (cVar1 == '\0') break;
    if ((*(short *)(lStack_28 + 0x1c) == param_2) &&
       (iStack_10 != *(int *)((longlong)param_2 * 0x4c + 0x1500 + param_1))) {
      FUN_18006f240(param_1);
    }
  }
  return;
}

