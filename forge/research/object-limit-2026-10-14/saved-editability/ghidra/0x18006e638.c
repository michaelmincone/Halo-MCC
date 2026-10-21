/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006e638; PE exception range ends: 0x18006e6c7.
 * Inferred types, callees, and function extents remain provisional.
 */


void FUN_18006e638(longlong param_1,int param_2,undefined8 *param_3)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  undefined8 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  longlong lVar7;
  
  if (param_2 < 0x28b) {
    uVar3 = param_3[1];
    lVar7 = (longlong)param_2 * 0x4c;
    puVar1 = (undefined8 *)(lVar7 + 0x14fc + param_1);
    *puVar1 = *param_3;
    puVar1[1] = uVar3;
    uVar3 = param_3[3];
    puVar1 = (undefined8 *)(lVar7 + 0x150c + param_1);
    *puVar1 = param_3[2];
    puVar1[1] = uVar3;
    uVar3 = param_3[5];
    puVar1 = (undefined8 *)(lVar7 + 0x151c + param_1);
    *puVar1 = param_3[4];
    puVar1[1] = uVar3;
    uVar4 = *(undefined4 *)((longlong)param_3 + 0x34);
    uVar5 = *(undefined4 *)(param_3 + 7);
    uVar6 = *(undefined4 *)((longlong)param_3 + 0x3c);
    puVar2 = (undefined4 *)(lVar7 + 0x152c + param_1);
    *puVar2 = *(undefined4 *)(param_3 + 6);
    puVar2[1] = uVar4;
    puVar2[2] = uVar5;
    puVar2[3] = uVar6;
    uVar3 = param_3[8];
    *(undefined8 *)(lVar7 + 0x153c + param_1) = uVar3;
    *(undefined4 *)(lVar7 + 0x1544 + param_1) = *(undefined4 *)(param_3 + 9);
    if ((*(byte *)(lVar7 + 0x14fc + param_1) & 1) != 0) {
      *(undefined2 *)(param_1 + 0x2e9) = 0;
    }
    FUN_18006f4f0((int)uVar3,param_2);
    FUN_18006e1b4(param_2);
  }
  return;
}

