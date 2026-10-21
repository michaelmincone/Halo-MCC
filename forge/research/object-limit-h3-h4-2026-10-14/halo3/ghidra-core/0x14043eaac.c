/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x14043eaac; PE exception range ends: 0x14043ecaf.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14043eaac(longlong *param_1,undefined8 param_2,undefined4 param_3,ulonglong *param_4,
                  undefined8 *param_5)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 *puVar13;
  char cVar14;
  undefined8 *puVar15;
  ulonglong uVar16;
  longlong lVar17;
  undefined8 *puVar18;
  longlong lVar19;
  undefined1 auStack_268 [32];
  undefined8 *puStack_248;
  undefined4 uStack_240;
  undefined1 auStack_238 [8];
  undefined8 uStack_230;
  undefined8 *puStack_228;
  undefined8 auStack_218 [58];
  ulonglong uStack_48;
  
  uStack_48 = _DAT_143c7cd58 ^ (ulonglong)auStack_268;
  *param_4 = 0;
  puStack_228 = param_5;
  func_0x000142654c20(auStack_218,0,0x1d0);
  lVar19 = 3;
  puVar13 = auStack_218;
  do {
    puVar18 = puVar13;
    puVar15 = param_5;
    uVar9 = puVar18[1];
    uVar10 = puVar18[2];
    uVar11 = puVar18[3];
    *puVar15 = *puVar18;
    puVar15[1] = uVar9;
    uVar9 = puVar18[4];
    uVar12 = puVar18[5];
    puVar15[2] = uVar10;
    puVar15[3] = uVar11;
    uVar10 = puVar18[6];
    uVar11 = puVar18[7];
    puVar15[4] = uVar9;
    puVar15[5] = uVar12;
    uVar9 = puVar18[8];
    uVar12 = puVar18[9];
    puVar15[6] = uVar10;
    puVar15[7] = uVar11;
    uVar10 = puVar18[10];
    uVar11 = puVar18[0xb];
    puVar15[8] = uVar9;
    puVar15[9] = uVar12;
    uVar9 = puVar18[0xc];
    uVar12 = puVar18[0xd];
    puVar15[10] = uVar10;
    puVar15[0xb] = uVar11;
    uVar10 = puVar18[0xe];
    uVar11 = puVar18[0xf];
    puVar15[0xc] = uVar9;
    puVar15[0xd] = uVar12;
    puVar15[0xe] = uVar10;
    puVar15[0xf] = uVar11;
    lVar19 = lVar19 + -1;
    param_5 = puVar15 + 0x10;
    puVar13 = puVar18 + 0x10;
  } while (lVar19 != 0);
  uVar9 = puVar18[0x11];
  uVar10 = puVar18[0x12];
  uVar11 = puVar18[0x13];
  puVar15[0x10] = puVar18[0x10];
  puVar15[0x11] = uVar9;
  uVar9 = puVar18[0x14];
  uVar12 = puVar18[0x15];
  puVar15[0x12] = uVar10;
  puVar15[0x13] = uVar11;
  uVar1 = *(undefined4 *)(puVar18 + 0x16);
  uVar2 = *(undefined4 *)((longlong)puVar18 + 0xb4);
  uVar3 = *(undefined4 *)(puVar18 + 0x17);
  uVar4 = *(undefined4 *)((longlong)puVar18 + 0xbc);
  puVar15[0x14] = uVar9;
  puVar15[0x15] = uVar12;
  uVar5 = *(undefined4 *)(puVar18 + 0x18);
  uVar6 = *(undefined4 *)((longlong)puVar18 + 0xc4);
  uVar7 = *(undefined4 *)(puVar18 + 0x19);
  uVar8 = *(undefined4 *)((longlong)puVar18 + 0xcc);
  *(undefined4 *)(puVar15 + 0x16) = uVar1;
  *(undefined4 *)((longlong)puVar15 + 0xb4) = uVar2;
  *(undefined4 *)(puVar15 + 0x17) = uVar3;
  *(undefined4 *)((longlong)puVar15 + 0xbc) = uVar4;
  *(undefined4 *)(puVar15 + 0x18) = uVar5;
  *(undefined4 *)((longlong)puVar15 + 0xc4) = uVar6;
  *(undefined4 *)(puVar15 + 0x19) = uVar7;
  *(undefined4 *)((longlong)puVar15 + 0xcc) = uVar8;
  if (param_1 != (longlong *)0x0) {
    lVar19 = FUN_1408b2954(param_2,1);
    if (lVar19 != 0) {
      uVar16 = FUN_1408b2cf8(lVar19);
      lVar17 = FUN_14088e010(uVar16,&UNK_1432abf30,0);
      puStack_248 = (undefined8 *)CONCAT44(puStack_248._4_4_,1);
      FUN_1408b2dac(lVar19,lVar17,uVar16,0);
      FUN_1408b2bb0(lVar19);
      cVar14 = FUN_14022c83c(0x73);
      if (cVar14 != '\0') {
        lVar19 = FUN_14043e80c(param_3);
        auStack_238[0] = 1;
        uStack_230 = 0;
        if (lVar19 != 0) {
          puStack_248 = (undefined8 *)auStack_238;
          uStack_240 = (int)uVar16;
          FUN_14038696c(lVar17,lVar19,1,&uStack_230);
        }
        puStack_248 = puStack_228;
        FUN_1403b6d20(lVar17,uVar16,uStack_230,auStack_238[0]);
      }
      if ((lVar17 != 0) && (uVar16 != 0)) {
        (**(code **)(*param_1 + 8))(param_1,lVar17,uVar16 & 0xffffffff);
      }
      *param_4 = uVar16;
      if (lVar17 != 0) {
        FUN_14088dde0(_DAT_144001bf8,lVar17);
      }
    }
  }
  FUN_1426534d0(uStack_48 ^ (ulonglong)auStack_268);
  return;
}

