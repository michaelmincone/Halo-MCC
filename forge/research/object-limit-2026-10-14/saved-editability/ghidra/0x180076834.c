/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x180076834; PE exception range ends: 0x180076981.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1 FUN_180076834(int param_1,ulonglong param_2,int *param_3,int *param_4,uint *param_5)

{
  byte bVar1;
  uint uVar2;
  longlong lVar3;
  undefined1 uVar4;
  longlong lVar5;
  longlong lVar6;
  ushort uVar7;
  longlong unaff_GS_OFFSET;
  int aiStackX_8 [2];
  int aiStack_28 [4];
  
  uVar4 = 0;
  lVar3 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8);
  if (*(int *)(*(longlong *)(lVar3 + 0x20) + 0x2c14) < 0x20) {
    uVar7 = *(ushort *)
             (*(longlong *)
               (*(longlong *)(*(longlong *)(lVar3 + 0x10) + 0x50) + 0x10 + (param_2 & 0xffff) * 0x18
               ) + 0x1c);
    if (uVar7 < 0x28b) {
      aiStackX_8[0] = param_1;
      lVar5 = func_0x00018006bcec();
      lVar5 = lVar5 + (longlong)(short)uVar7 * 0x4c;
      FUN_18006cfd0((longlong)(short)uVar7 * 0x4c,(int)*(short *)(lVar5 + 0x14fe),aiStackX_8,
                    aiStack_28);
      bVar1 = *(byte *)(lVar5 + 0x152a);
      uVar2 = *(uint *)(*(longlong *)
                         ((ulonglong)(*(uint *)(_DAT_180c1a230 + 0x22c) >> 0x1c) * 8 + 0x184e39f20)
                        + 0xc + ((ulonglong)*(uint *)(_DAT_180c1a230 + 0x22c) +
                                (longlong)aiStackX_8[0] * 5) * 4);
      lVar6 = (longlong)aiStack_28[0] * 7 + (ulonglong)uVar2;
      lVar3 = *(longlong *)((ulonglong)(uVar2 >> 0x1c) * 8 + 0x184e39f20);
      if ((longlong)(ulonglong)bVar1 < (longlong)*(int *)(lVar3 + 4 + lVar6 * 4)) {
        uVar2 = *(uint *)(lVar3 + 8 + lVar6 * 4);
        lVar3 = *(longlong *)((ulonglong)(uVar2 >> 0x1c) * 8 + 0x184e39f20);
        if (param_3 != (int *)0x0) {
          *param_3 = aiStackX_8[0];
        }
        if (param_4 != (int *)0x0) {
          *param_4 = aiStack_28[0];
        }
        if (param_5 != (uint *)0x0) {
          *param_5 = (uint)*(byte *)(lVar5 + 0x152a);
        }
        uVar4 = FUN_1800751f4(*(undefined4 *)
                               (lVar3 + 0x10 + ((ulonglong)uVar2 + (ulonglong)bVar1 * 6) * 4),0);
      }
    }
  }
  return uVar4;
}

