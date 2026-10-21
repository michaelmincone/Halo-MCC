/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x180532658; PE exception range ends: 0x180532905.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1
FUN_180532658(uint param_1,float *param_2,float *param_3,undefined8 param_4,undefined8 *param_5,
             undefined4 *param_6)

{
  float fVar1;
  uint uVar2;
  longlong lVar3;
  ushort *puVar4;
  longlong lVar5;
  char cVar6;
  ushort uVar7;
  ulonglong uVar8;
  longlong lVar9;
  longlong unaff_GS_OFFSET;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined8 uVar12;
  undefined4 uVar13;
  undefined4 auStackX_8 [2];
  float *pfStackX_10;
  undefined1 auStackX_18 [8];
  undefined8 uStackX_20;
  float fStack_a8;
  float fStack_a4;
  float fStack_a0;
  float fStack_98;
  float fStack_94;
  float fStack_90;
  undefined8 uStack_88;
  undefined4 uStack_80;
  
  lVar3 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8);
  lVar9 = *(longlong *)(lVar3 + 0x10);
  puVar4 = *(ushort **)(*(longlong *)(lVar9 + 0x50) + 0x10 + ((ulonglong)param_1 & 0xffff) * 0x18);
  uVar2 = *(uint *)(_DAT_180c1a600 + 4 + (ulonglong)*puVar4 * 8);
  uVar8 = (ulonglong)uVar2;
  lVar5 = *(longlong *)((ulonglong)(uVar2 >> 0x1c) * 8 + 0x184e39f20);
  fVar1 = *(float *)(lVar5 + 0x5f4 + uVar8 * 4);
  pfStackX_10 = param_2;
  uStackX_20 = param_4;
  uVar10 = func_0x0001804a5484((ulonglong)param_1);
  if (*(int *)(puVar4 + 0xde) == -1) {
    uVar11 = *(undefined4 *)(lVar5 + 0x4f0 + uVar8 * 4);
    uVar13 = 0;
  }
  else {
    uVar12 = FUN_180716c5c(*(int *)(puVar4 + 0xde),0);
    uVar11 = (undefined4)uVar12;
    uVar13 = (undefined4)((ulonglong)uVar12 >> 0x20);
    lVar9 = *(longlong *)(lVar3 + 0x10);
  }
  FUN_180471d38(param_1,&fStack_a8);
  fStack_a8 = fStack_a8 + fVar1 * *(float *)(puVar4 + 0x2e);
  fStack_a4 = fStack_a4 + fVar1 * *(float *)(puVar4 + 0x30);
  fStack_a0 = fStack_a0 + fVar1 * *(float *)(puVar4 + 0x32);
  fStack_98 = fVar1 * *param_3 + *pfStackX_10;
  fStack_94 = fVar1 * param_3[1] + pfStackX_10[1];
  fStack_90 = param_3[2] * fVar1 + pfStackX_10[2];
  auStackX_8[0] = *(undefined4 *)(lVar5 + 0x70c + uVar8 * 4);
  if (param_3[2] <= _DAT_180a8b81c && _DAT_180a8b81c != param_3[2]) {
    auStackX_8[0] = 0;
  }
  uVar7 = func_0x000180473dc0(param_1);
  uVar12 = 0;
  cVar6 = FUN_1804f1e44(CONCAT44(uVar13,uVar11),uVar10,
                        *(undefined2 *)
                         (*(longlong *)
                           (*(longlong *)(lVar9 + 0x50) + 0x10 + (ulonglong)uVar7 * 0x18) + 8),
                        &fStack_a8,&fStack_98,&uStackX_20,auStackX_8);
  if (cVar6 == '\0') {
    cVar6 = FUN_1804f1ee8((float)uStackX_20 + _DAT_180a8abec,uVar10,&fStack_a8,&fStack_98,0,0,0,0,
                          &uStack_88,&pfStackX_10,auStackX_18,0,0,0,uVar12);
    if (cVar6 == '\0') {
      return 0;
    }
  }
  if (param_5 != (undefined8 *)0x0) {
    *param_5 = uStack_88;
    *(undefined4 *)(param_5 + 1) = uStack_80;
  }
  if (param_6 != (undefined4 *)0x0) {
    *param_6 = pfStackX_10._0_4_;
  }
  return 1;
}

