/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x14043ce28; PE exception range ends: 0x14043da36.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14043ce28(longlong *param_1,ulonglong param_2,char param_3)

{
  short *psVar1;
  undefined8 *puVar2;
  undefined8 *puVar3;
  longlong lVar4;
  undefined8 ***pppuVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  longlong lVar8;
  uint *puVar9;
  longlong **pplVar10;
  ulonglong uVar11;
  int *piVar12;
  undefined4 uVar13;
  short *psVar14;
  uint *puVar15;
  longlong **pplVar16;
  char cVar17;
  short sVar18;
  undefined4 uVar19;
  uint uVar20;
  undefined4 uVar21;
  longlong *plVar22;
  longlong lVar23;
  longlong *plVar24;
  longlong *plVar25;
  uint uVar26;
  short *psVar27;
  ulonglong uVar28;
  longlong *plVar29;
  undefined8 ****ppppuVar30;
  longlong *plVar31;
  longlong *plVar32;
  int iVar33;
  int iVar34;
  int iVar35;
  longlong *plVar36;
  bool bVar37;
  undefined1 auStack_218 [32];
  undefined8 uStack_1f8;
  undefined **ppuStack_1f0;
  int iStack_1e8;
  longlong lStack_1e0;
  longlong *plStack_1d8;
  undefined8 uStack_1d0;
  undefined *puStack_1c8;
  undefined8 *puStack_1c0;
  undefined8 *puStack_1b8;
  uint uStack_1b0;
  undefined4 uStack_1ac;
  longlong **pplStack_1a8;
  undefined8 uStack_1a0;
  undefined **ppuStack_190;
  undefined *puStack_188;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  undefined8 uStack_178;
  undefined **ppuStack_150;
  undefined *puStack_148;
  undefined8 uStack_140;
  undefined8 uStack_138;
  undefined **ppuStack_110;
  undefined *puStack_108;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  uint *puStack_f8;
  undefined **ppuStack_d0;
  longlong *plStack_c8;
  longlong *plStack_c0;
  undefined8 uStack_b8;
  uint auStack_b0 [2];
  undefined8 uStack_a8;
  undefined8 uStack_a0;
  longlong lStack_98;
  undefined8 ***pppuStack_90;
  undefined8 ***pppuStack_88;
  undefined8 *puStack_80;
  short *psStack_78;
  undefined8 uStack_70;
  longlong **pplStack_68;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined8 uStack_58;
  ulonglong uStack_50;
  
  uStack_1d0 = 0xfffffffffffffffe;
  uStack_50 = _DAT_143c7cd58 ^ (ulonglong)auStack_218;
  auStack_b0[0] = (uint)param_2;
  uVar28 = param_2 & 0xffffffff;
  plStack_1d8 = param_1;
  uVar19 = func_0x000140210c88(param_2 & 0xffffffff);
  pplVar16 = uStack_a8;
  piVar12 = _DAT_143f66910;
  iVar34 = 1;
  plVar29 = (longlong *)0x0;
  uStack_a8._0_4_ = SUB84(param_1,0);
  uVar21 = (undefined4)uStack_a8;
  uStack_a8._4_4_ = (undefined4)((ulonglong)param_1 >> 0x20);
  uVar13 = uStack_a8._4_4_;
  uStack_a8 = pplVar16;
  if (param_3 == '\0') {
    puStack_80._0_2_ = (ushort)(byte)(((*(byte *)(param_1 + 0x30) & 4) != 0) + 1);
    psStack_78 = (short *)0x0;
    uStack_70 = (short *)0x0;
    FUN_140210a50(_DAT_144000c40,uVar19,&puStack_80);
    psVar14 = uStack_70;
    psVar27 = psStack_78;
    if (((psStack_78 != (short *)0x0) && (uStack_70 != (short *)0x0)) &&
       (func_0x000140c2de0c(*(undefined8 *)(_DAT_143f66780 + 0x20)), psVar27 != psVar14)) {
      psVar27 = psVar27 + 2;
      do {
        plVar24 = param_1 + (longlong)(int)auStack_b0[0] * 2 + 0x21;
        lStack_98 = func_0x0001409300f4(0x410);
        plVar22 = plVar29;
        if (lStack_98 != 0) {
          plVar22 = (longlong *)FUN_14043c200(lStack_98);
        }
        lVar23 = *plVar24;
        *(longlong **)(lVar23 + 8) = plVar22;
        *plVar22 = lVar23;
        plVar22[1] = (longlong)plVar24;
        *plVar24 = (longlong)plVar22;
        FUN_14043c324(plVar22,auStack_b0[0],(int)*psVar27,psVar27[1]);
        psVar1 = psVar27 + 6;
        psVar27 = psVar27 + 8;
      } while (psVar1 != psVar14);
    }
    puVar15 = (uint *)CONCAT44(uStack_178._4_4_,(undefined4)uStack_178);
    pplVar16 = (longlong **)CONCAT44(uStack_140._4_4_,(undefined4)uStack_140);
    plVar22 = (longlong *)CONCAT44(uStack_138._4_4_,(undefined4)uStack_138);
    if ((*(byte *)(param_1 + 0x30) & 4) == 0) {
      if (auStack_b0[0] == 0) {
        plVar22 = (longlong *)&UNK_1432ac010;
      }
      else if (auStack_b0[0] == 1) {
        plVar22 = (longlong *)&UNK_1432abff8;
      }
      else if (auStack_b0[0] == 2) {
        plVar22 = (longlong *)&UNK_1432ac040;
      }
      else if (auStack_b0[0] == 3) {
        plVar22 = (longlong *)&UNK_1432ac028;
      }
      else if (auStack_b0[0] == 4) {
        plVar22 = (longlong *)&UNK_1432abf98;
      }
      else if (auStack_b0[0] == 5) {
        plVar22 = (longlong *)&UNK_1432abfb0;
      }
      else {
        plVar22 = plVar29;
        if (auStack_b0[0] == 6) {
          plVar22 = (longlong *)&UNK_1432abfe0;
        }
      }
      FUN_1404430a0(param_1 + (longlong)(int)auStack_b0[0] * 2 + 0x21,plVar22,&UNK_1432b59c0);
      uStack_a0 = auStack_b0;
      puStack_188 = &UNK_1432ac708;
      uStack_180 = uVar21;
      uStack_17c = uVar13;
      ppuStack_150 = &puStack_188;
      ppuStack_1f0 = &puStack_188;
      uStack_1f8 = 0;
      uStack_a8 = (longlong **)param_1;
      uStack_178 = uStack_a0;
      FUN_14047e03c(_DAT_1440016c0,3,auStack_b0[0],1);
      plStack_c8 = (longlong *)0x0;
      lStack_98 = 0;
      uStack_a8 = &plStack_c8;
      uStack_a0 = (uint *)&lStack_98;
      puStack_148 = &UNK_1432ac738;
      ppuStack_110 = &puStack_148;
      ppuStack_1f0 = &puStack_148;
      uStack_1f8 = 0;
      uStack_140 = uStack_a8;
      uStack_138 = (longlong *)uStack_a0;
      FUN_14047e03c(_DAT_1440016c0,0,auStack_b0[0],1);
      if ((plStack_c8 != (longlong *)0x0) && (plStack_c8[2] != 0)) {
        plVar24 = param_1 + (longlong)(int)auStack_b0[0] * 2 + 0x21;
        lStack_1e0 = func_0x0001409300f4(0x410);
        plVar22 = plVar29;
        if (lStack_1e0 != 0) {
          plVar22 = (longlong *)FUN_14043c200(lStack_1e0);
        }
        lVar23 = *plVar24;
        *(longlong **)(lVar23 + 8) = plVar22;
        *plVar22 = lVar23;
        plVar22[1] = (longlong)plVar24;
        *plVar24 = (longlong)plVar22;
        lVar23 = plStack_c8[2];
        *(uint *)(plVar22 + 3) = auStack_b0[0];
        uVar19 = *(undefined4 *)(lVar23 + 0x28);
        uVar6 = *(undefined4 *)(lVar23 + 0x2c);
        uVar7 = *(undefined4 *)(lVar23 + 0x30);
        *(undefined4 *)(plVar22 + 0x7b) = *(undefined4 *)(lVar23 + 0x24);
        *(undefined4 *)((longlong)plVar22 + 0x3dc) = uVar19;
        *(undefined4 *)(plVar22 + 0x7c) = uVar6;
        *(undefined4 *)((longlong)plVar22 + 0x3e4) = uVar7;
        *(undefined4 *)((longlong)plVar22 + 0x14) = 4;
        *(undefined4 *)(plVar22 + 2) = 1;
      }
      uVar28 = (ulonglong)auStack_b0[0];
      if (1 < auStack_b0[0]) goto LAB_14043d300;
      lVar23 = FUN_140390cd4(_DAT_144001580);
      puVar15 = uStack_178;
      pplVar16 = uStack_140;
      plVar22 = uStack_138;
      if (lVar23 != 0) {
        cVar17 = func_0x0001401c9480((undefined4 *)(lVar23 + 0x2a0));
        if (cVar17 == '\0') {
          lStack_1e0 = CONCAT44(lStack_1e0._4_4_,0xffff);
          sVar18 = -1;
        }
        else {
          sVar18 = (short)*(undefined4 *)(lVar23 + 0x2a0);
          iStack_1e8 = CONCAT22(*(undefined2 *)(lVar23 + 0x2a4),sVar18);
        }
        iVar33 = (int)sVar18;
        puVar15 = uStack_178;
        pplVar16 = uStack_140;
        plVar22 = uStack_138;
        if (iVar33 != -1) {
          uVar19 = func_0x000140210c50(iVar33);
          uVar20 = func_0x000140210cdc(uVar19);
          uVar28 = (ulonglong)(int)auStack_b0[0];
          if (uVar20 != auStack_b0[0]) goto LAB_14043d300;
          plVar24 = param_1 + uVar28 * 2 + 0x21;
          lStack_1e0 = func_0x0001409300f4(0x410);
          plVar22 = plVar29;
          if (lStack_1e0 != 0) {
            plVar22 = (longlong *)FUN_14043c200(lStack_1e0);
          }
          lVar23 = *plVar24;
          *(longlong **)(lVar23 + 8) = plVar22;
          *plVar22 = lVar23;
          plVar22[1] = (longlong)plVar24;
          *plVar24 = (longlong)plVar22;
          FUN_14043c3bc(plVar22,auStack_b0[0],iVar33);
          puVar15 = uStack_178;
          pplVar16 = uStack_140;
          plVar22 = uStack_138;
        }
      }
    }
LAB_14043d2fd:
    uStack_138 = plVar22;
    uStack_140 = pplVar16;
    uStack_178 = puVar15;
    uVar28 = (ulonglong)auStack_b0[0];
  }
  else if (_DAT_143f66910 != (int *)0x0) {
    puVar15 = uStack_178;
    pplVar16 = uStack_140;
    plVar22 = uStack_138;
    if (*_DAT_143f66910 == 2) {
      uVar20 = FUN_140210d84(uVar19);
      puVar15 = (uint *)CONCAT44(uStack_178._4_4_,(undefined4)uStack_178);
      pplVar16 = (longlong **)CONCAT44(uStack_140._4_4_,(undefined4)uStack_140);
      plVar22 = (longlong *)CONCAT44(uStack_138._4_4_,(undefined4)uStack_138);
      if ((uVar20 < 7) &&
         (puVar15 = (uint *)CONCAT44(uStack_178._4_4_,(undefined4)uStack_178),
         pplVar16 = (longlong **)CONCAT44(uStack_140._4_4_,(undefined4)uStack_140),
         plVar22 = (longlong *)CONCAT44(uStack_138._4_4_,(undefined4)uStack_138),
         (*(byte *)((longlong)piVar12 + 0x16) & '\x01' << ((byte)uVar20 & 0x1f)) != 0)) {
        lVar23 = func_0x00014208b564(piVar12,uVar20);
        plVar24 = (longlong *)CONCAT44(uStack_138._4_4_,(undefined4)uStack_138);
        pplVar10 = (longlong **)CONCAT44(uStack_140._4_4_,(undefined4)uStack_140);
        puVar9 = (uint *)CONCAT44(uStack_178._4_4_,(undefined4)uStack_178);
        puVar15 = (uint *)CONCAT44(uStack_178._4_4_,(undefined4)uStack_178);
        pplVar16 = (longlong **)CONCAT44(uStack_140._4_4_,(undefined4)uStack_140);
        plVar22 = (longlong *)CONCAT44(uStack_138._4_4_,(undefined4)uStack_138);
        if (lVar23 != 0) {
          puVar2 = *(undefined8 **)(lVar23 + 0x18);
          for (puVar3 = (undefined8 *)*puVar2; puVar15 = puVar9, pplVar16 = pplVar10,
              plVar22 = plVar24, puVar3 != puVar2; puVar3 = (undefined8 *)*puVar3) {
            if ((*(byte *)(param_1 + 0x30) & 4) == 0) {
              bVar37 = *(char *)(puVar3[4] + 0x31) == '\x01';
            }
            else {
              bVar37 = *(char *)(puVar3[4] + 0x31) == '\x02';
            }
            if (bVar37) {
              lVar23 = puVar3[2];
              lVar8 = puVar3[3];
              plVar24 = param_1 + (longlong)(int)auStack_b0[0] * 2 + 0x21;
              lStack_1e0 = func_0x0001409300f4(0x410);
              plVar22 = plVar29;
              if (lStack_1e0 != 0) {
                plVar22 = (longlong *)FUN_14043c200(lStack_1e0);
              }
              lVar4 = *plVar24;
              *(longlong **)(lVar4 + 8) = plVar22;
              *plVar22 = lVar4;
              plVar22[1] = (longlong)plVar24;
              *plVar24 = (longlong)plVar22;
              *(uint *)(plVar22 + 3) = auStack_b0[0];
              *(undefined4 *)((longlong)plVar22 + 0x14) = 5;
              plVar22[0x7d] = lVar23;
              plVar22[0x7e] = lVar8;
              *(undefined4 *)(plVar22 + 0x7f) = 0xfffffffd;
              *(undefined4 *)(plVar22 + 2) = 1;
            }
            plVar24 = (longlong *)CONCAT44(uStack_138._4_4_,(undefined4)uStack_138);
            pplVar10 = (longlong **)CONCAT44(uStack_140._4_4_,(undefined4)uStack_140);
            puVar9 = (uint *)CONCAT44(uStack_178._4_4_,(undefined4)uStack_178);
          }
        }
      }
    }
    goto LAB_14043d2fd;
  }
LAB_14043d300:
  uVar11 = (longlong)(int)uVar28;
  for (plVar22 = (longlong *)param_1[((longlong)(int)uVar28 + 0x11U) * 2]; uVar20 = (uint)uVar28,
      plVar22 != param_1 + uVar11 * 2 + 0x21; plVar22 = (longlong *)plVar22[1]) {
    FUN_14043c454(plVar22);
    uVar28 = (ulonglong)(int)auStack_b0[0];
    uVar11 = uVar28;
  }
  if (uVar20 == 0) {
    plVar22 = (longlong *)&UNK_1432abfc8;
  }
  else if (uVar20 == 1) {
    plVar22 = (longlong *)&UNK_1432ac0e0;
  }
  else if (uVar20 == 2) {
    plVar22 = (longlong *)&UNK_1432ac0c8;
  }
  else if (uVar20 == 3) {
    plVar22 = (longlong *)&UNK_1432ac110;
  }
  else if (uVar20 == 4) {
    plVar22 = (longlong *)&UNK_1432ac070;
  }
  else if (uVar20 == 5) {
    plVar22 = (longlong *)&UNK_1432ac0f8;
  }
  else {
    plVar22 = plVar29;
    if (uVar20 == 6) {
      plVar22 = (longlong *)&UNK_1432ac058;
    }
  }
  plVar24 = param_1 + (longlong)(int)uVar20 * 2 + 5;
  uVar26 = uVar20;
  if (plVar22 != (longlong *)0x0) {
    cVar17 = FUN_1408b2fe8(plVar22);
    uVar26 = auStack_b0[0];
    if (cVar17 != '\0') {
      pppuStack_90 = &pppuStack_90;
      pppuStack_88 = &pppuStack_90;
      FUN_1408b3258(&pppuStack_90,plVar22,0,&UNK_1432b59d8);
      for (ppppuVar30 = (undefined8 ****)pppuStack_88; ppppuVar30 != &pppuStack_90;
          ppppuVar30 = (undefined8 ****)ppppuVar30[1]) {
        uStack_a8 = (longlong **)0x0;
        uStack_a0 = (uint *)0x0;
        if (ppppuVar30[3] != (undefined8 ***)0x0) {
          FUN_14043ecb0(ppppuVar30[3],&uStack_a8);
        }
        lStack_1e0 = func_0x0001409300f4(0x458);
        plVar22 = plVar29;
        if (lStack_1e0 != 0) {
          plVar22 = (longlong *)FUN_14043ad74(lStack_1e0);
        }
        lVar23 = *plVar24;
        *(longlong **)(lVar23 + 8) = plVar22;
        *plVar22 = lVar23;
        plVar22[1] = (longlong)plVar24;
        *plVar24 = (longlong)plVar22;
        pppuVar5 = ppppuVar30[3];
        *(uint *)(plVar22 + 3) = uVar20;
        *(undefined4 *)(plVar22 + 0x7b) = (undefined4)uStack_a8;
        *(undefined4 *)((longlong)plVar22 + 0x3dc) = uStack_a8._4_4_;
        *(undefined4 *)(plVar22 + 0x7c) = (undefined4)uStack_a0;
        *(undefined4 *)((longlong)plVar22 + 0x3e4) = uStack_a0._4_4_;
        *(undefined4 *)((longlong)plVar22 + 0x14) = 2;
        FUN_1405a2960(plVar22 + 5,pppuVar5);
        *(undefined4 *)(plVar22 + 2) = 1;
      }
      FUN_140209d60(&pppuStack_90);
      uVar26 = auStack_b0[0];
    }
  }
  uStack_a0 = auStack_b0;
  puStack_108 = &UNK_1432ac6a8;
  uStack_100 = uVar21;
  uStack_fc = uVar13;
  ppuStack_d0 = &puStack_108;
  ppuStack_1f0 = &puStack_108;
  uStack_1f8 = 0;
  uStack_a8 = (longlong **)param_1;
  puStack_f8 = uStack_a0;
  FUN_14047e03c(_DAT_1440016c0,3,uVar26);
  plStack_c0 = (longlong *)0x0;
  uStack_b8 = 0;
  uStack_58 = 0;
  puStack_1c0 = &uStack_b8;
  puStack_1b8 = &uStack_58;
  uStack_70 = (short *)CONCAT44(uStack_70._4_4_,auStack_b0[0]);
  pplStack_68 = &plStack_c0;
  uStack_60 = (undefined4)param_1[0x30];
  puStack_1c8 = &UNK_1432ac6d8;
  uStack_1b0 = auStack_b0[0];
  uStack_1ac = uStack_70._4_4_;
  uStack_1a0 = CONCAT44(uStack_5c,uStack_60);
  ppuStack_190 = &puStack_1c8;
  ppuStack_1f0 = &puStack_1c8;
  uStack_1f8 = 0;
  puStack_80 = puStack_1c0;
  psStack_78 = (short *)puStack_1b8;
  pplStack_1a8 = pplStack_68;
  FUN_14047e03c(_DAT_1440016c0,0,auStack_b0[0],0);
  uVar28 = (ulonglong)(int)auStack_b0[0];
  for (plVar29 = (longlong *)param_1[(uVar28 + 3) * 2]; plVar29 != param_1 + uVar28 * 2 + 5;
      plVar29 = (longlong *)plVar29[1]) {
    FUN_14043afa8(plVar29,(int)param_1[0x30],0);
    uVar28 = (ulonglong)(int)auStack_b0[0];
  }
  if (plStack_c0 != (longlong *)0x0) {
    plVar29 = param_1 + (longlong)(int)uVar28 * 2 + 5;
    lVar23 = *plVar29;
    *(longlong **)(lVar23 + 8) = plStack_c0;
    *plStack_c0 = lVar23;
    plStack_c0[1] = (longlong)plVar29;
    *plVar29 = (longlong)plStack_c0;
    uVar28 = (ulonglong)auStack_b0[0];
  }
  plVar29 = param_1 + (longlong)(int)uVar28 * 2 + 5;
  if (((*(byte *)(param_1 + 0x30) & 2) == 0) &&
     (plVar22 = (longlong *)plVar29[1], plVar22 != plVar29)) {
    do {
      plVar24 = plVar29;
      plVar36 = plVar29;
      iVar33 = 0;
      iStack_1e8 = iVar34;
      plStack_c8 = plVar29;
      if (plVar22 != plVar29) {
LAB_14043d65c:
        lStack_1e0 = CONCAT44(lStack_1e0._4_4_,iVar33 + 1);
        iVar35 = 0;
        iVar33 = 0;
        plVar31 = plVar22;
        iVar34 = iStack_1e8;
        if (0 < iStack_1e8) {
          do {
            iVar35 = iVar35 + 1;
            plVar22 = (longlong *)plVar22[1];
            if (plVar22 == plVar29) break;
            iVar33 = iVar33 + 1;
          } while (iVar33 < iStack_1e8);
        }
        do {
          plVar25 = plVar24;
          if (iVar35 < 1) {
            if ((iVar34 < 1) || (plVar22 == plVar29)) goto LAB_14043d6ea;
            if (iVar35 != 0) goto LAB_14043d6a6;
LAB_14043d69a:
            iVar34 = iVar34 + -1;
            plVar24 = plVar22;
            plVar32 = plVar31;
            plVar22 = (longlong *)plVar22[1];
          }
          else {
LAB_14043d6a6:
            if ((iVar34 != 0) && (plVar22 != plVar29)) {
              cVar17 = func_0x00014043cd78(plVar31,plVar22);
              plVar25 = plStack_c8;
              if (cVar17 == '\0') goto LAB_14043d69a;
            }
            iVar35 = iVar35 + -1;
            plVar32 = (longlong *)plVar31[1];
            plVar24 = plVar31;
          }
          plVar31 = plVar32;
          plStack_c8 = plVar24;
          if (plVar25 == plVar29) {
            *plVar24 = (longlong)plVar29;
            plVar36 = plVar24;
          }
          else {
            plVar25[1] = (longlong)plVar24;
            *plVar24 = (longlong)plVar25;
          }
        } while( true );
      }
LAB_14043d705:
      plVar24[1] = (longlong)plVar29;
      if (iVar33 < 2) goto LAB_14043d715;
      iVar34 = iStack_1e8 * 2;
      plVar22 = plVar36;
    } while( true );
  }
LAB_14043d73f:
  plVar22 = (longlong *)param_1[((longlong)(int)uVar28 + 3) * 2];
  plVar29 = param_1 + (longlong)(int)uVar28 * 2;
  if (plVar22 != plVar29 + 5) {
    do {
      if (1 < (int)plVar22[2]) {
        uVar20 = *(uint *)(plVar22 + 0x8a);
        lVar23 = func_0x00014043dcd0(param_1,uVar28,uVar20);
        if (lVar23 == 0) {
          plVar29 = plVar29 + 0x13;
          plStack_1d8 = (longlong *)func_0x0001409300f4(0x148);
          uVar26 = auStack_b0[0];
          plVar24 = (longlong *)0x0;
          if (plStack_1d8 != (longlong *)0x0) {
            *plStack_1d8 = (longlong)plStack_1d8;
            plStack_1d8[1] = (longlong)plStack_1d8;
            *(undefined4 *)(plStack_1d8 + 2) = 0xffffffff;
            *(undefined4 *)((longlong)plStack_1d8 + 0x14) = 0xffffffff;
            plVar24 = plStack_1d8 + 3;
            *plVar24 = (longlong)plVar24;
            plStack_1d8[4] = (longlong)plVar24;
            plStack_1d8[5] = 0x1020304;
            plStack_1d8[6] = (longlong)&UNK_14327c2e0;
            plStack_1d8[7] = 0;
            *(undefined4 *)(plStack_1d8 + 8) = 0xffffffff;
            *(undefined4 *)((longlong)plStack_1d8 + 0x44) = 0xffffffff;
            plVar24 = plStack_1d8 + 9;
            *plVar24 = (longlong)plVar24;
            plStack_1d8[10] = (longlong)plVar24;
            plStack_1d8[0xb] = 0x1020304;
            plStack_1d8[0xc] = (longlong)&UNK_14327c2e0;
            plStack_1d8[0xd] = 0;
            *(undefined4 *)(plStack_1d8 + 0xe) = 0xffffffff;
            *(undefined4 *)((longlong)plStack_1d8 + 0x74) = 0xffffffff;
            plVar24 = plStack_1d8 + 0xf;
            *plVar24 = (longlong)plVar24;
            plStack_1d8[0x10] = (longlong)plVar24;
            plStack_1d8[0x11] = 0x1020304;
            plStack_1d8[0x12] = (longlong)&UNK_14327c2e0;
            plStack_1d8[0x13] = 0;
            *(undefined4 *)(plStack_1d8 + 0x14) = 0xffffffff;
            *(undefined4 *)((longlong)plStack_1d8 + 0xa4) = 0xffffffff;
            plVar24 = plStack_1d8 + 0x15;
            *plVar24 = (longlong)plVar24;
            plStack_1d8[0x16] = (longlong)plVar24;
            plStack_1d8[0x17] = 0x1020304;
            plStack_1d8[0x18] = (longlong)&UNK_14327c2e0;
            plStack_1d8[0x19] = 0;
            *(undefined4 *)(plStack_1d8 + 0x1a) = 0xffffffff;
            *(undefined4 *)((longlong)plStack_1d8 + 0xd4) = 0xffffffff;
            plVar24 = plStack_1d8 + 0x1b;
            *plVar24 = (longlong)plVar24;
            plStack_1d8[0x1c] = (longlong)plVar24;
            plStack_1d8[0x1d] = 0x1020304;
            plStack_1d8[0x1e] = (longlong)&UNK_14327c2e0;
            plStack_1d8[0x1f] = 0;
            *(undefined4 *)(plStack_1d8 + 0x20) = 0xffffffff;
            *(undefined4 *)((longlong)plStack_1d8 + 0x104) = 0xffffffff;
            plVar24 = plStack_1d8 + 0x21;
            *plVar24 = (longlong)plVar24;
            plStack_1d8[0x22] = (longlong)plVar24;
            plStack_1d8[0x23] = 0x1020304;
            plStack_1d8[0x24] = (longlong)&UNK_14327c2e0;
            plStack_1d8[0x25] = 0;
            *(undefined4 *)(plStack_1d8 + 0x26) = 0xffffffff;
            *(undefined4 *)((longlong)plStack_1d8 + 0x134) = 0xffffffff;
            plStack_1d8[0x28] = 0;
            plStack_1d8[0x27] = 0;
            plVar24 = plStack_1d8;
          }
          lVar23 = *plVar29;
          *(longlong **)(lVar23 + 8) = plVar24;
          *plVar24 = lVar23;
          plVar24[1] = (longlong)plVar29;
          *plVar29 = (longlong)plVar24;
          if (uVar20 < 0x1c) {
            uVar21 = func_0x000140210c88(auStack_b0[0]);
            uVar21 = FUN_140210d84(uVar21);
            lVar23 = FUN_140210718(_DAT_144000c40,uVar20,uVar21,0);
            if (lVar23 != 0) {
              FUN_1405a2960(plVar24 + 3,*(undefined8 *)(lVar23 + 0x20));
              FUN_1405a2960(plVar24 + 9,*(undefined8 *)(lVar23 + 0x50));
              FUN_1405a2960(plVar24 + 0xf,*(undefined8 *)(lVar23 + 0xe0));
              FUN_1405a2960(plVar24 + 0x15,*(undefined8 *)(lVar23 + 0xb0));
              FUN_1405a2960(plVar24 + 0x1b,*(undefined8 *)(lVar23 + 0x80));
              FUN_1405a2960(plVar24 + 0x21,*(undefined8 *)(lVar23 + 0x110));
            }
          }
          *(uint *)((longlong)plVar24 + 0x14) = uVar20;
          *(uint *)(plVar24 + 2) = uVar26;
          if (uVar20 != 0xffffffff) {
            uVar21 = *(undefined4 *)((longlong)plVar22 + 0x1c);
            uVar20 = *(uint *)(plVar24 + 0x27);
            FUN_140443fd8(plVar24 + 0x27);
            lVar23 = plVar24[0x28];
            goto LAB_14043d9d5;
          }
          plVar29 = (longlong *)param_1[(longlong)(int)auStack_b0[0] * 2 + 0x13];
          lVar23 = *plVar29;
          plVar24 = (longlong *)plVar29[1];
          *(longlong **)(lVar23 + 8) = plVar24;
          *plVar24 = lVar23;
          *plVar29 = (longlong)plVar29;
          plVar29[1] = (longlong)plVar29;
          FUN_14043da38();
        }
        else {
          uVar21 = *(undefined4 *)((longlong)plVar22 + 0x1c);
          uVar20 = *(uint *)(lVar23 + 0x138);
          FUN_140443fd8((uint *)(lVar23 + 0x138));
          lVar23 = *(longlong *)(lVar23 + 0x140);
LAB_14043d9d5:
          *(undefined4 *)(lVar23 + (ulonglong)uVar20 * 4) = uVar21;
        }
        uVar28 = (ulonglong)auStack_b0[0];
      }
      plVar22 = (longlong *)plVar22[1];
      plVar29 = param_1 + (longlong)(int)uVar28 * 2;
    } while (plVar22 != plVar29 + 5);
  }
  *(undefined1 *)((longlong)(int)uVar28 + 0x178 + (longlong)param_1) = 1;
  FUN_1426534d0(uStack_50 ^ (ulonglong)auStack_218);
  return;
LAB_14043d6ea:
  iVar33 = (int)lStack_1e0;
  if (plVar22 == plVar29) goto LAB_14043d705;
  goto LAB_14043d65c;
LAB_14043d715:
  plVar22 = (longlong *)plVar36[1];
  plVar24 = plVar36;
  while (plVar31 = plVar22, plVar31 != plVar29) {
    plVar24 = plVar31;
    plVar22 = (longlong *)plVar31[1];
  }
  *plVar29 = (longlong)plVar24;
  *plVar36 = (longlong)plVar29;
  plVar29[1] = (longlong)plVar36;
  uVar28 = (ulonglong)auStack_b0[0];
  param_1 = plStack_1d8;
  goto LAB_14043d73f;
}

