/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x1804f1ee8; PE exception range ends: 0x1804f22db.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1
FUN_1804f1ee8(float param_1,float param_2,float *param_3,float *param_4,float *param_5,
             float *param_6,float *param_7,byte param_8,undefined8 *param_9,float *param_10,
             float *param_11,float *param_12,float *param_13,undefined4 *param_14)

{
  float *pfVar1;
  undefined1 uVar2;
  longlong unaff_GS_OFFSET;
  float fVar3;
  float fVar4;
  float fVar5;
  undefined4 uVar6;
  float fVar7;
  undefined8 uVar8;
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar9 [16];
  undefined1 auVar10 [16];
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  undefined8 uStack_c8;
  float fStack_c0;
  float fStack_b8;
  float fStack_b4;
  float fStack_b0;
  
  fVar12 = param_4[2] - param_3[2];
  fVar15 = param_4[1] - param_3[1];
  fVar17 = *param_4 - *param_3;
  fStack_b8 = fVar17;
  fStack_b4 = fVar15;
  fStack_b0 = fVar12;
  fVar3 = (float)func_0x00018091a19e();
  pfVar1 = *(float **)
            (*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
            0x330);
  param_2 = *pfVar1 * param_2;
  fVar7 = 0.0;
  if (0.0 <= param_2) {
    fVar7 = param_2;
  }
  if ((fVar7 <= 0.0) || ((fVar3 <= _DAT_180a8a9b8 && (fVar12 <= _DAT_180a8a9b8)))) {
    uVar2 = FUN_1804f22dc(pfVar1,param_3,param_4,param_9,param_10,param_11,param_12);
  }
  else {
    uVar2 = 0;
    fVar16 = fVar7 * fVar7 * _DAT_180a8ac90;
    fVar14 = fVar12 * fVar12 + fVar15 * fVar15 + fVar17 * fVar17;
    fVar3 = fVar16 * _DAT_180a8b280;
    uVar8 = func_0x00018091a19e();
    fVar11 = (float)((uint)uVar8 ^ _DAT_1809da3f0);
    auVar9._4_4_ = (uint)((ulonglong)uVar8 >> 0x20) ^ _UNK_1809da3f4;
    auVar9._0_4_ = fVar11;
    auVar9._8_4_ = (uint)extraout_XMM0_Qb ^ _UNK_1809da3f8;
    auVar9._12_4_ = (uint)((ulonglong)extraout_XMM0_Qb >> 0x20) ^ _UNK_1809da3fc;
    auVar10._4_12_ = auVar9._4_12_;
    auVar10._0_4_ = fVar11 / (fVar16 * _DAT_180a8b834);
    fVar4 = (float)func_0x00018091a19e(auVar10._0_8_);
    fVar13 = fVar12 * fVar7;
    if (0.0 <= fVar13 - fVar11) {
      fVar11 = (float)func_0x00018091a19e();
    }
    else {
      fVar11 = 0.0;
    }
    if (param_5 != (float *)0x0) {
      *param_5 = fVar11;
    }
    if (param_7 == (float *)0x0) {
      fVar5 = param_1;
      if ((param_6 != (float *)0x0) && (0.0 < *param_6)) {
        fVar5 = *param_6 * fVar4;
        if (fVar5 <= _DAT_180a8a9fc) {
          fVar5 = _DAT_180a8a9fc;
        }
        if (fVar4 <= fVar5) {
          fVar5 = fVar4;
        }
        fVar5 = (float)func_0x00018091a19e(fVar13 - (float)((uint)(fVar14 / (fVar5 * fVar5) +
                                                                  fVar5 * fVar5 * fVar16) ^
                                                           _DAT_1809da3f0));
        if (param_1 <= fVar5) {
          fVar5 = param_1;
        }
      }
    }
    else {
      fVar5 = *param_7;
    }
    if (fVar11 <= fVar5) {
      fVar13 = fVar13 - fVar5 * fVar5;
      if (((fVar13 < 0.0) && (0.0 <= fVar13 * fVar13 - fVar3 * fVar14)) &&
         (fVar3 = (float)func_0x00018091a19e(),
         0.0 < (fVar3 * (float)(int)((uint)param_8 * 2 + -1) - fVar13) / (fVar16 + fVar16))) {
        fVar4 = (float)func_0x00018091a19e();
        uVar2 = 1;
        fVar11 = fVar5;
      }
    }
    uStack_c8 = CONCAT44(fVar15 / fVar4,fVar17 / fVar4);
    fVar3 = fVar7 * _DAT_180a8ad74 * fVar4 + fVar12 / fVar4;
    fStack_c0 = fVar3;
    uVar6 = func_0x00018091a19e();
    fVar7 = (float)FUN_18001fcfc(&uStack_c8);
    if (fVar7 == 0.0) {
      uStack_c8 = CONCAT44(fStack_b4,fStack_b8);
      uVar2 = 0;
      fStack_c0 = fStack_b0;
      fVar7 = (float)FUN_18001fcfc(&uStack_c8);
      if (fVar7 == 0.0) {
        fStack_c0 = _DAT_18098fa94;
        uStack_c8 = _DAT_18098fa8c;
        uVar2 = 0;
      }
    }
    *param_9 = uStack_c8;
    *(float *)(param_9 + 1) = fStack_c0;
    if (param_12 != (float *)0x0) {
      *param_12 = fVar4 * fVar11;
    }
    if (param_10 != (float *)0x0) {
      *param_10 = fVar11;
    }
    if (param_13 != (float *)0x0) {
      *param_13 = fVar3;
    }
    if (param_14 != (undefined4 *)0x0) {
      *param_14 = uVar6;
    }
    if (param_11 != (float *)0x0) {
      *param_11 = fVar4;
    }
  }
  return uVar2;
}

