/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x1800692cc; PE exception range ends: 0x180069462.
 * Inferred types, callees, and function extents remain provisional.
 */


undefined8 FUN_1800692cc(longlong param_1,undefined8 *param_2,undefined4 *param_3,char param_4)

{
  undefined8 *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined8 *puVar7;
  undefined8 *puVar8;
  undefined8 *puVar9;
  longlong lVar10;
  
  *(undefined4 *)(param_1 + 0xd9c4) = 0x666c625f;
  *(undefined4 *)(param_1 + 0xd9c8) = 0x30000000;
  *(undefined4 *)(param_1 + 0xd9cc) = 0x2000100;
  *(undefined2 *)(param_1 + 0xd9d0) = 0xfeff;
  func_0x00018078932a(param_1 + 0xd9d2,0,0x22);
  puVar1 = (undefined8 *)(param_1 + 8);
  lVar10 = 5;
  if (param_4 == '\0') {
    puVar6 = (undefined8 *)(param_1 + 0xda04);
    puVar7 = puVar1;
    do {
      puVar9 = puVar7;
      puVar8 = puVar6;
      uVar5 = puVar9[1];
      *puVar8 = *puVar9;
      puVar8[1] = uVar5;
      uVar5 = puVar9[3];
      puVar8[2] = puVar9[2];
      puVar8[3] = uVar5;
      uVar5 = puVar9[5];
      puVar8[4] = puVar9[4];
      puVar8[5] = uVar5;
      uVar5 = puVar9[7];
      puVar8[6] = puVar9[6];
      puVar8[7] = uVar5;
      uVar5 = puVar9[9];
      puVar8[8] = puVar9[8];
      puVar8[9] = uVar5;
      uVar5 = puVar9[0xb];
      puVar8[10] = puVar9[10];
      puVar8[0xb] = uVar5;
      uVar5 = puVar9[0xd];
      puVar8[0xc] = puVar9[0xc];
      puVar8[0xd] = uVar5;
      uVar5 = puVar9[0xf];
      puVar8[0xe] = puVar9[0xe];
      puVar8[0xf] = uVar5;
      lVar10 = lVar10 + -1;
      puVar6 = puVar8 + 0x10;
      puVar7 = puVar9 + 0x10;
    } while (lVar10 != 0);
    uVar5 = puVar9[0x11];
    puVar8[0x10] = puVar9[0x10];
    puVar8[0x11] = uVar5;
    uVar5 = puVar9[0x13];
    puVar8[0x12] = puVar9[0x12];
    puVar8[0x13] = uVar5;
    uVar2 = *(undefined4 *)((longlong)puVar9 + 0xa4);
    uVar3 = *(undefined4 *)(puVar9 + 0x15);
    uVar4 = *(undefined4 *)((longlong)puVar9 + 0xac);
    *(undefined4 *)(puVar8 + 0x14) = *(undefined4 *)(puVar9 + 0x14);
    *(undefined4 *)((longlong)puVar8 + 0xa4) = uVar2;
    *(undefined4 *)(puVar8 + 0x15) = uVar3;
    *(undefined4 *)((longlong)puVar8 + 0xac) = uVar4;
  }
  else {
    puVar6 = (undefined8 *)(param_1 + 0xda04);
    puVar7 = puVar1;
    do {
      puVar9 = puVar7;
      puVar8 = puVar6;
      uVar5 = puVar9[1];
      *puVar8 = *puVar9;
      puVar8[1] = uVar5;
      uVar5 = puVar9[3];
      puVar8[2] = puVar9[2];
      puVar8[3] = uVar5;
      uVar5 = puVar9[5];
      puVar8[4] = puVar9[4];
      puVar8[5] = uVar5;
      uVar5 = puVar9[7];
      puVar8[6] = puVar9[6];
      puVar8[7] = uVar5;
      uVar5 = puVar9[9];
      puVar8[8] = puVar9[8];
      puVar8[9] = uVar5;
      uVar5 = puVar9[0xb];
      puVar8[10] = puVar9[10];
      puVar8[0xb] = uVar5;
      uVar5 = puVar9[0xd];
      puVar8[0xc] = puVar9[0xc];
      puVar8[0xd] = uVar5;
      uVar5 = puVar9[0xf];
      puVar8[0xe] = puVar9[0xe];
      puVar8[0xf] = uVar5;
      lVar10 = lVar10 + -1;
      puVar6 = puVar8 + 0x10;
      puVar7 = puVar9 + 0x10;
    } while (lVar10 != 0);
    uVar5 = puVar9[0x11];
    puVar8[0x10] = puVar9[0x10];
    puVar8[0x11] = uVar5;
    uVar2 = *(undefined4 *)((longlong)puVar9 + 0x94);
    uVar3 = *(undefined4 *)(puVar9 + 0x13);
    uVar4 = *(undefined4 *)((longlong)puVar9 + 0x9c);
    *(undefined4 *)(puVar8 + 0x12) = *(undefined4 *)(puVar9 + 0x12);
    *(undefined4 *)((longlong)puVar8 + 0x94) = uVar2;
    *(undefined4 *)(puVar8 + 0x13) = uVar3;
    *(undefined4 *)((longlong)puVar8 + 0x9c) = uVar4;
    uVar2 = *(undefined4 *)((longlong)puVar9 + 0xa4);
    uVar3 = *(undefined4 *)(puVar9 + 0x15);
    uVar4 = *(undefined4 *)((longlong)puVar9 + 0xac);
    *(undefined4 *)(puVar8 + 0x14) = *(undefined4 *)(puVar9 + 0x14);
    *(undefined4 *)((longlong)puVar8 + 0xa4) = uVar2;
    *(undefined4 *)(puVar8 + 0x15) = uVar3;
    *(undefined4 *)((longlong)puVar8 + 0xac) = uVar4;
    FUN_18006c754(puVar1);
  }
  FUN_18017ac38(param_1 + 0xdcb4,puVar1);
  *(undefined4 *)(param_1 + 0x14ce8) = 0x18730000;
  if (*(short *)(param_1 + 0xda02) == -1) {
    *(undefined2 *)(param_1 + 0xda02) = 0;
  }
  *param_2 = (undefined4 *)(param_1 + 0xd9c4);
  *param_3 = 0x7329;
  return 1;
}

