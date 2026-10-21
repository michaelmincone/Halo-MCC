/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006e7bc; PE exception range ends: 0x18006e91d.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulonglong FUN_18006e7bc(longlong param_1,int param_2,int param_3,int param_4,undefined8 *param_5,
                       undefined8 *param_6,undefined8 *param_7)

{
  uint uVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  ulonglong uVar6;
  longlong lVar7;
  longlong lVar8;
  
  uVar1 = *(uint *)(*(longlong *)
                     ((ulonglong)(*(uint *)(_DAT_180c1a230 + 0x22c) >> 0x1c) * 8 + 0x184e39f20) +
                    0xc + ((ulonglong)*(uint *)(_DAT_180c1a230 + 0x22c) + (longlong)param_2 * 5) * 4
                   );
  lVar8 = (longlong)param_3 * 7 + (ulonglong)uVar1;
  lVar7 = *(longlong *)((ulonglong)(uVar1 >> 0x1c) * 8 + 0x184e39f20);
  iVar4 = func_0x00018006cf1c();
  uVar1 = *(uint *)(lVar7 + 8 + lVar8 * 4);
  iVar2 = *(int *)(*(longlong *)((ulonglong)(uVar1 >> 0x1c) * 8 + 0x184e39f20) + 0x10 +
                  ((ulonglong)uVar1 + (longlong)param_4 * 6) * 4);
  uVar6 = 0xffffffff;
  if (iVar2 != -1) {
    iVar5 = *(int *)(lVar7 + 0x10 + lVar8 * 4);
    if ((iVar5 < 1) ||
       (uVar6 = 0xffffffff, (int)(uint)*(byte *)((longlong)iVar4 * 3 + 0xd642 + param_1) < iVar5)) {
      iVar5 = FUN_18006e0c8(param_1);
      uVar6 = (ulonglong)iVar5;
      if (iVar5 != -1) {
        lVar7 = uVar6 * 0x4c;
        uVar3 = *(undefined4 *)(param_5 + 1);
        *(undefined8 *)(lVar7 + 0x1504 + param_1) = *param_5;
        *(undefined4 *)(lVar7 + 0x150c + param_1) = uVar3;
        *(short *)(lVar7 + 0x14fe + param_1) = (short)iVar4;
        *(char *)(lVar7 + 0x152a + param_1) = (char)param_4;
        *(undefined8 *)(lVar7 + 0x1510 + param_1) = *param_6;
        *(undefined4 *)(lVar7 + 0x1518 + param_1) = *(undefined4 *)(param_6 + 1);
        *(undefined8 *)(lVar7 + 0x151c + param_1) = *param_7;
        *(undefined4 *)(lVar7 + 0x1524 + param_1) = *(undefined4 *)(param_7 + 1);
        func_0x00018006f72c(param_1 + 0x152c + lVar7,iVar2);
        FUN_18006de38(param_1,iVar4);
      }
    }
  }
  return uVar6 & 0xffffffff;
}

