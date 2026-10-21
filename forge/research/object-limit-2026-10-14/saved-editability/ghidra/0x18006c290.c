/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006c290; PE exception range ends: 0x18006c70d.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_18006c290(undefined8 *param_1,undefined8 *param_2,undefined8 param_3,undefined8 param_4)

{
  char *pcVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  bool bVar5;
  bool bVar6;
  longlong lVar7;
  undefined8 *puVar8;
  undefined2 uVar9;
  short sVar10;
  undefined4 uVar11;
  undefined8 *puVar12;
  longlong lVar13;
  byte bVar14;
  byte bVar15;
  undefined8 *puVar16;
  longlong lVar17;
  uint uVar18;
  int iVar19;
  short *psVar21;
  ulonglong uVar22;
  byte *pbVar23;
  undefined8 *puVar24;
  undefined4 extraout_XMM0_Da;
  undefined8 uStackX_8;
  undefined8 uStackX_10;
  ulonglong uVar20;
  
  lVar7 = _DAT_180c1a230;
  uStackX_10 = _DAT_184e2fcc0;
  uStackX_8 = _DAT_184e2fcc0;
  uVar22 = 0;
  bVar6 = false;
  if ((_DAT_180c1a230 == 0) ||
     (bVar5 = true, *(int *)(_DAT_180c1a230 + 0x10) != *(int *)((longlong)param_2 + 0x2b4))) {
    bVar5 = bVar6;
  }
  _DAT_184e2fcc0 = param_1;
  FUN_18006c244(param_1,param_2 + 0x57,param_3,param_4,0xfffffffffffffffe);
  lVar17 = 5;
  puVar24 = param_1;
  puVar8 = param_2;
  do {
    puVar16 = puVar8;
    puVar12 = puVar24;
    uVar4 = puVar16[1];
    *puVar12 = *puVar16;
    puVar12[1] = uVar4;
    uVar4 = puVar16[3];
    puVar12[2] = puVar16[2];
    puVar12[3] = uVar4;
    uVar4 = puVar16[5];
    puVar12[4] = puVar16[4];
    puVar12[5] = uVar4;
    uVar4 = puVar16[7];
    puVar12[6] = puVar16[6];
    puVar12[7] = uVar4;
    uVar4 = puVar16[9];
    puVar12[8] = puVar16[8];
    puVar12[9] = uVar4;
    uVar4 = puVar16[0xb];
    puVar12[10] = puVar16[10];
    puVar12[0xb] = uVar4;
    uVar4 = puVar16[0xd];
    puVar12[0xc] = puVar16[0xc];
    puVar12[0xd] = uVar4;
    uVar4 = puVar16[0xf];
    puVar12[0xe] = puVar16[0xe];
    puVar12[0xf] = uVar4;
    lVar17 = lVar17 + -1;
    puVar24 = puVar12 + 0x10;
    puVar8 = puVar16 + 0x10;
  } while (lVar17 != 0);
  uVar4 = puVar16[0x11];
  puVar12[0x10] = puVar16[0x10];
  puVar12[0x11] = uVar4;
  uVar4 = puVar16[0x13];
  puVar12[0x12] = puVar16[0x12];
  puVar12[0x13] = uVar4;
  uVar4 = puVar16[0x15];
  puVar12[0x14] = puVar16[0x14];
  puVar12[0x15] = uVar4;
  *(undefined1 *)((longlong)param_1 + 0x2e9) = *(undefined1 *)((longlong)param_2 + 0x2e9);
  *(undefined1 *)((longlong)param_1 + 0x2ea) = *(undefined1 *)((longlong)param_2 + 0x2ea);
  *(undefined4 *)(param_1 + 0x5e) = *(undefined4 *)(param_2 + 0x5e);
  lVar17 = _DAT_180c1a230;
  uVar3 = uRam0000000180bfeb9c;
  uVar2 = uRam0000000180bfeb98;
  uVar11 = uRam0000000180bfeb94;
  if (bVar5) {
    *(undefined4 *)(param_1 + 0x59) = _DAT_180bfeb90;
    *(undefined4 *)((longlong)param_1 + 0x2cc) = uVar11;
    *(undefined4 *)(param_1 + 0x5a) = uVar2;
    *(undefined4 *)((longlong)param_1 + 0x2d4) = uVar3;
    param_1[0x5b] = _DAT_180bfeba0;
    uVar11 = FUN_18006bd5c(lVar17);
    *(undefined4 *)(param_1 + 0x5e) = uVar11;
    *(int *)(param_1 + 0x5c) = (int)*(float *)(lVar17 + 0x38);
    uVar9 = func_0x00018006c710();
    *(undefined2 *)((longlong)param_1 + 0x2b2) = uVar9;
    if ((*(char *)((longlong)param_2 + 0x2e9) != '\0') || (*(int *)(param_2 + 0x5c) == 0)) {
      *(uint *)(param_1 + 0x5c) =
           *(uint *)(param_1 + 0x5c) & -(uint)(*(char *)((longlong)param_2 + 0x2ea) != '\0');
    }
    if ((char)param_3 != '\0') {
      uVar11 = *(undefined4 *)((longlong)param_2 + 0x2cc);
      uVar2 = *(undefined4 *)(param_2 + 0x5a);
      uVar3 = *(undefined4 *)((longlong)param_2 + 0x2d4);
      *(undefined4 *)(param_1 + 0x59) = *(undefined4 *)(param_2 + 0x59);
      *(undefined4 *)((longlong)param_1 + 0x2cc) = uVar11;
      *(undefined4 *)(param_1 + 0x5a) = uVar2;
      *(undefined4 *)((longlong)param_1 + 0x2d4) = uVar3;
      param_1[0x5b] = param_2[0x5b];
      func_0x00018086c321(param_1 + 0x1b28,param_2 + 0x1b28);
    }
  }
  else {
    uVar11 = *(undefined4 *)((longlong)param_2 + 0x2cc);
    uVar2 = *(undefined4 *)(param_2 + 0x5a);
    uVar3 = *(undefined4 *)((longlong)param_2 + 0x2d4);
    *(undefined4 *)(param_1 + 0x59) = *(undefined4 *)(param_2 + 0x59);
    *(undefined4 *)((longlong)param_1 + 0x2cc) = uVar11;
    *(undefined4 *)(param_1 + 0x5a) = uVar2;
    *(undefined4 *)((longlong)param_1 + 0x2d4) = uVar3;
    param_1[0x5b] = param_2[0x5b];
    *(undefined4 *)(param_1 + 0x5c) = *(undefined4 *)(param_2 + 0x5c);
    *(undefined4 *)((longlong)param_1 + 0x2e4) = *(undefined4 *)((longlong)param_2 + 0x2e4);
  }
  if ((lVar17 == 0) || (*(int *)(lVar17 + 0x10) != *(int *)((longlong)param_2 + 0x2b4))) {
    sVar10 = *(short *)((longlong)param_2 + 0x2b2);
  }
  else {
    bVar6 = true;
    sVar10 = func_0x00018006c710(lVar17);
  }
  *(short *)((longlong)param_1 + 0x2b2) = sVar10;
  if (0 < sVar10) {
    pbVar23 = (byte *)((longlong)param_1 + 0xd641);
    uVar20 = uVar22;
    do {
      if ((int)uVar20 < (int)*(short *)((longlong)param_2 + 0x2b2)) {
        *(undefined2 *)(pbVar23 + -1) =
             *(undefined2 *)(((longlong)pbVar23 - (longlong)param_1) + -1 + (longlong)param_2);
        pbVar23[1] = 0;
        if (bVar6) {
          lVar17 = FUN_18006cf60((longlong)pbVar23 - (longlong)param_1,uVar20);
          bVar14 = (byte)*(int *)(lVar17 + 0x10);
          if ((int)(uint)*pbVar23 <= *(int *)(lVar17 + 0x10)) {
            bVar14 = *pbVar23;
          }
          *pbVar23 = bVar14;
        }
        else {
          bVar14 = *pbVar23;
        }
        if (pbVar23[-1] <= bVar14) {
          bVar14 = pbVar23[-1];
        }
        pbVar23[-1] = bVar14;
      }
      else {
        pbVar23[-1] = 0;
        pbVar23[0] = 0;
        pbVar23[1] = 0;
      }
      uVar18 = (int)uVar20 + 1;
      uVar20 = (ulonglong)uVar18;
      pbVar23 = pbVar23 + 3;
    } while ((int)uVar18 < (int)*(short *)((longlong)param_1 + 0x2b2));
  }
  psVar21 = (short *)(param_2 + 0x2a5);
  lVar17 = 0x28b;
  iVar19 = 0;
  do {
    if (((((*(byte *)(psVar21 + -0x16) & 1) != 0) && (-1 < psVar21[-0x15])) &&
        (psVar21[-0x15] < *(short *)((longlong)param_1 + 0x2b2))) && (*psVar21 == -1)) {
      puVar24 = (undefined8 *)((longlong)param_1 + uVar22 + 0x14fc);
      uVar22 = uVar22 + 0x4c;
      uVar4 = *(undefined8 *)(psVar21 + -0x12);
      *puVar24 = *(undefined8 *)(psVar21 + -0x16);
      puVar24[1] = uVar4;
      uVar4 = *(undefined8 *)(psVar21 + -10);
      puVar24[2] = *(undefined8 *)(psVar21 + -0xe);
      puVar24[3] = uVar4;
      uVar4 = *(undefined8 *)(psVar21 + -2);
      puVar24[4] = *(undefined8 *)(psVar21 + -6);
      puVar24[5] = uVar4;
      uVar11 = *(undefined4 *)(psVar21 + 4);
      uVar2 = *(undefined4 *)(psVar21 + 6);
      uVar3 = *(undefined4 *)(psVar21 + 8);
      *(undefined4 *)(puVar24 + 6) = *(undefined4 *)(psVar21 + 2);
      *(undefined4 *)((longlong)puVar24 + 0x34) = uVar11;
      *(undefined4 *)(puVar24 + 7) = uVar2;
      *(undefined4 *)((longlong)puVar24 + 0x3c) = uVar3;
      uVar11 = (undefined4)*(undefined8 *)(psVar21 + 10);
      puVar24[8] = *(undefined8 *)(psVar21 + 10);
      *(undefined4 *)(puVar24 + 9) = *(undefined4 *)(psVar21 + 0xe);
      pcVar1 = (char *)((longlong)*(short *)((longlong)puVar24 + 2) * 3 + 0xd642 + (longlong)param_1
                       );
      *pcVar1 = *pcVar1 + '\x01';
      if (psVar21[0xc] != -1) {
        sVar10 = *(short *)((longlong)param_2 + (longlong)psVar21[0xc] * 2 + 0x12f8);
        if ((sVar10 != -1) && ((longlong)param_2 + (longlong)sVar10 + 0x2f4 != 0)) {
          uVar9 = FUN_18006bb70(param_1);
          *(undefined2 *)((longlong)puVar24 + 0x44) = uVar9;
          uVar11 = extraout_XMM0_Da;
        }
      }
      *(undefined4 *)((longlong)puVar24 + 4) = 0xffffffff;
      if (bVar5) {
        lVar13 = FUN_18006cf60(uVar11,(int)*(short *)((longlong)puVar24 + 2));
        bVar14 = *(byte *)((longlong)puVar24 + 0x2e);
        if (bVar14 == 0) {
          bVar14 = 0;
        }
        bVar15 = *(byte *)(lVar13 + 4);
        if (bVar14 <= *(byte *)(lVar13 + 4)) {
          bVar15 = bVar14;
        }
        *(byte *)((longlong)puVar24 + 0x2e) = bVar15;
      }
    }
    uVar4 = uStackX_10;
    psVar21 = psVar21 + 0x26;
    lVar17 = lVar17 + -1;
  } while (lVar17 != 0);
  if (0 < *(short *)((longlong)param_1 + 0x2b2)) {
    pbVar23 = (byte *)((longlong)param_1 + 0xd642);
    do {
      bVar14 = pbVar23[-1];
      if (pbVar23[-1] <= *pbVar23) {
        bVar14 = *pbVar23;
      }
      pbVar23[-1] = bVar14;
      if (bVar5) {
        FUN_18006cfd0(bVar14,iVar19,&uStackX_8,&uStackX_10);
        lVar13 = (longlong)(int)uStackX_8 * 5 + (ulonglong)*(uint *)(lVar7 + 0x22c);
        lVar17 = *(longlong *)((ulonglong)(*(uint *)(lVar7 + 0x22c) >> 0x1c) * 8 + 0x184e39f20);
        *(int *)((longlong)param_1 + 0x2e4) =
             *(int *)((longlong)param_1 + 0x2e4) +
             *(int *)(*(longlong *)
                       ((ulonglong)(*(uint *)(lVar17 + 0xc + lVar13 * 4) >> 0x1c) * 8 + 0x184e39f20)
                      + 0x14 + ((longlong)(int)uStackX_10 * 7 +
                               (ulonglong)*(uint *)(lVar17 + 0xc + lVar13 * 4)) * 4) *
             (uint)*pbVar23;
      }
      iVar19 = iVar19 + 1;
      pbVar23 = pbVar23 + 3;
    } while (iVar19 < *(short *)((longlong)param_1 + 0x2b2));
  }
  _DAT_184e2fcc0 = (undefined8 *)uVar4;
  return;
}

