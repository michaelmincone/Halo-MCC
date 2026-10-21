/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006e6c8; PE exception range ends: 0x18006e740.
 * Inferred types, callees, and function extents remain provisional.
 */


undefined4 FUN_18006e6c8(longlong param_1,int param_2,undefined4 *param_3)

{
  longlong lVar1;
  longlong lVar2;
  undefined4 uVar3;
  
  uVar3 = 0xffffffff;
  if (*(short *)((longlong)param_2 * 0x4c + 0x14fe + param_1) != -1) {
    lVar2 = FUN_18006cf60();
    lVar1 = (ulonglong)*(uint *)(lVar2 + 8) +
            (ulonglong)*(byte *)((longlong)param_2 * 0x4c + 0x152a + param_1) * 6;
    lVar2 = *(longlong *)((ulonglong)(*(uint *)(lVar2 + 8) >> 0x1c) * 8 + 0x184e39f20);
    if (param_3 != (undefined4 *)0x0) {
      *param_3 = *(undefined4 *)(lVar2 + 0x14 + lVar1 * 4);
    }
    uVar3 = *(undefined4 *)(lVar2 + 0x10 + lVar1 * 4);
  }
  return uVar3;
}

