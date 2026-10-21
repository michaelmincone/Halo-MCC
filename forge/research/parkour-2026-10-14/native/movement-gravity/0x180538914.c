/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x180538914; PE exception range ends: 0x180538d8a.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

char FUN_180538914(uint param_1)

{
  ushort uVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  ushort *puVar5;
  float fVar6;
  char cVar7;
  undefined1 uVar8;
  char cVar9;
  longlong lVar10;
  undefined1 uVar11;
  longlong unaff_GS_OFFSET;
  float fVar12;
  float fVar13;
  undefined4 uVar14;
  undefined4 extraout_XMM0_Da;
  float fVar15;
  float fVar16;
  undefined4 auStackX_8 [2];
  longlong lStackX_10;
  longlong lStackX_18;
  longlong lStackX_20;
  undefined8 in_stack_ffffffffffffff28;
  undefined8 *puVar17;
  undefined8 uStack_b8;
  float fStack_b0;
  float fStack_a0;
  float fStack_98;
  float fStack_94;
  float fStack_90;
  float fStack_88;
  float fStack_84;
  float fStack_80;
  
  uVar14 = (undefined4)((ulonglong)in_stack_ffffffffffffff28 >> 0x20);
  cVar9 = '\0';
  lStackX_18 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8);
  puVar5 = *(ushort **)
            (*(longlong *)(*(longlong *)(lStackX_18 + 0x10) + 0x50) + 0x10 +
            (ulonglong)(param_1 & 0xffff) * 0x18);
  uVar1 = puVar5[0xdb];
  lStackX_10 = (longlong)(short)puVar5[0xd9] + (longlong)puVar5;
  uVar2 = *(uint *)(_DAT_180c1a600 + 4 + (ulonglong)*puVar5 * 8);
  lVar10 = *(longlong *)((ulonglong)(uVar2 >> 0x1c) * 8 + 0x184e39f20);
  lStackX_20 = (longlong)(short)puVar5[199] + (longlong)puVar5;
  cVar7 = FUN_1804abee8(param_1);
  if ((((cVar7 == '\0') && (cVar7 = FUN_1804ac088(param_1), cVar7 == '\0')) &&
      (uVar11 = 1, *(short *)(lStackX_10 + 0x20) != 1)) && ((char)puVar5[0x537] != '\x06')) {
    fVar16 = *(float *)(lVar10 + 0x4f0 + (ulonglong)uVar2 * 4);
    uVar8 = FUN_1804b0bf4(param_1,&fStack_98,&fStack_88,0,1);
    fVar6 = _DAT_180a8af18;
    auStackX_8[0] = CONCAT31(auStackX_8[0]._1_3_,uVar8);
    fVar16 = fVar16 * (_DAT_180a8af18 -
                      *(float *)(puVar5 + 0x26a) * *(float *)(lVar10 + 0x308 + (ulonglong)uVar2 * 4)
                      );
    cVar9 = '\x01';
    if (*(uint *)(puVar5 + 0xe6) != 0xffffffff) {
      fVar12 = (float)*(int *)((*(longlong *)(*(longlong *)(lStackX_18 + 0x18) + 0x50) + 0x32b +
                                (ulonglong)(*(uint *)(puVar5 + 0xe6) & 0xffff) * 0x490 &
                               0xfffffffffffffffc) + 0x1c) / _DAT_180a8b450;
      if (fVar12 == _DAT_180a7a434) {
        cVar9 = '\0';
      }
      else {
        cVar9 = '\x01';
        if (fVar12 != _DAT_180a8b7e8) {
          fVar16 = fVar16 * fVar12;
        }
      }
    }
    FUN_18047244c(param_1,&fStack_88,0);
    uStack_b8 = CONCAT44(fStack_84,fStack_88);
    cVar7 = (char)auStackX_8[0];
    fStack_a0 = fStack_80;
    fVar13 = fStack_88;
    fVar15 = fStack_80;
    fVar12 = fStack_84;
    if ((char)auStackX_8[0] != '\0') {
      fVar13 = fStack_88 - fStack_98;
      fVar15 = fStack_80 - fStack_90;
      fVar12 = fStack_84 - fStack_94;
    }
    fVar15 = *(float *)(puVar5 + 0x30) * fVar12 + *(float *)(puVar5 + 0x2e) * fVar13 +
             *(float *)(puVar5 + 0x32) * fVar15;
    fStack_b0 = fStack_80;
    fVar12 = fStack_88;
    fVar13 = fStack_84;
    if (fVar15 < fVar16) {
      fVar16 = fVar16 - fVar15;
      fVar12 = *(float *)(puVar5 + 0x2e) * fVar16 + fStack_88;
      fVar13 = fStack_84 + *(float *)(puVar5 + 0x30) * fVar16;
      uStack_b8 = CONCAT44(fVar13,fVar12);
      fStack_b0 = fStack_80 + *(float *)(puVar5 + 0x32) * fVar16;
    }
    iVar3 = *(int *)(puVar5 + 0xde);
    if (iVar3 != -1) {
      iVar4 = *(int *)(lStackX_20 + 0x204);
      uVar14 = func_0x00018091a19e(fVar13 * fVar13 + fVar12 * fVar12 + fStack_b0 * fStack_b0);
      lVar10 = 0;
      if (*(int *)((longlong)puVar5 + (longlong)(short)uVar1 + 0x70) != 0) {
        uVar14 = *(undefined4 *)((longlong)puVar5 + (longlong)(short)uVar1 + 0x80);
        lVar10 = (longlong)puVar5 + (longlong)(short)uVar1 + 0x74;
        uVar11 = *(undefined1 *)((longlong)puVar5 + (longlong)(short)uVar1 + 0x90);
      }
      auStackX_8[0] = 0;
      puVar17 = &uStack_b8;
      cVar9 = FUN_1807160c0(iVar3,iVar4 == 0x4f || iVar4 == 0x50,uVar11,uVar14,lVar10,auStackX_8,
                            puVar17);
      uVar14 = (undefined4)((ulonglong)puVar17 >> 0x20);
      if (*(int *)((longlong)puVar5 + (longlong)(short)uVar1 + 0x70) != 0) {
        *(undefined4 *)((longlong)puVar5 + (longlong)(short)uVar1 + 0x84) = auStackX_8[0];
        func_0x00018005c3d8();
        *(undefined4 *)((longlong)puVar5 + (longlong)(short)uVar1 + 0x8c) = 0;
        *(undefined4 *)((longlong)puVar5 + (longlong)(short)uVar1 + 0x88) = extraout_XMM0_Da;
      }
      if (cVar9 == '\0') {
        return '\0';
      }
      if (cVar7 != '\0') {
        fStack_b0 = fStack_b0 + fStack_90;
        uStack_b8 = CONCAT44(uStack_b8._4_4_ + fStack_94,(float)uStack_b8 + fStack_98);
      }
    }
    if (cVar9 != '\0') {
      uVar2 = *(uint *)(_DAT_180c1a238 + 0x484);
      lVar10 = *(longlong *)((ulonglong)(uVar2 >> 0x1c) * 8 + 0x184e39f20);
      FUN_1804a66a4(param_1,4,2,fVar6);
      *(undefined1 *)(lStackX_10 + 0x1e) = 0;
      FUN_18046cd64(param_1,&uStack_b8,0);
      *(undefined4 *)(puVar5 + 0x51e) = *(undefined4 *)(*(longlong *)(lStackX_18 + 0xa0) + 0xc);
      if (*(int *)(lVar10 + 0x1c + (ulonglong)uVar2 * 4) != -1) {
        fStack_88 = (float)(*(uint *)(puVar5 + 0x10a) ^ _DAT_1809da3f0);
        fStack_80 = (float)(*(uint *)(puVar5 + 0x10e) ^ _DAT_1809da3f0);
        fStack_84 = (float)(*(uint *)(puVar5 + 0x10c) ^ _DAT_1809da3f0);
        FUN_18048a020(param_1,&fStack_98);
        FUN_180162654(param_1,0xffffffff,*(undefined4 *)(lVar10 + 0x1c + (ulonglong)uVar2 * 4),
                      0x180c12168,&fStack_88,&fStack_98,CONCAT44(uVar14,fVar6),fVar6,0);
      }
      FUN_1804c4e68(param_1,3);
    }
  }
  return cVar9;
}

