/* ev_db4a03b3025ddcdba9ede1960ab7d8c665bc5ed31c50f1c6dadb5d6c969fc6d8 */

void FUN_1800706e8(longlong param_1,undefined8 param_2,undefined8 param_3,float *param_4)

{
  uint uVar1;
  int iVar2;
  ulonglong uVar3;
  float fVar4;
  undefined8 local_18;
  undefined4 local_10;
  
  if (ABS(*param_4 - 0.0) < 0.0001) {
    if (ABS(param_4[1] - 0.0) < 0.0001) {
      if (ABS(param_4[2] - 1.0) < 0.0001) {
        if (*(uint *)(param_1 + 0x30) < 0x40) {
          *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + 1;
          *(uint *)(param_1 + 0x30) = *(uint *)(param_1 + 0x30) + 1;
          *(ulonglong *)(param_1 + 0x28) = *(longlong *)(param_1 + 0x28) * 2 | 1;
        }
        else {
          FUN_1800dcfc4(param_4[2] - 1.0,1,1);
        }
        local_18 = 0;
        local_10 = 0x3f800000;
        goto LAB_18007082c;
      }
    }
  }
  uVar1 = FUN_180070bd8(param_4);
  uVar3 = (ulonglong)uVar1;
  if (*(uint *)(param_1 + 0x30) < 0x40) {
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + 1;
    iVar2 = *(uint *)(param_1 + 0x30) + 1;
    *(longlong *)(param_1 + 0x28) = *(longlong *)(param_1 + 0x28) << 1;
    *(int *)(param_1 + 0x30) = iVar2;
  }
  else {
    FUN_1800dcfc4(param_1,0,1);
    iVar2 = *(int *)(param_1 + 0x30);
  }
  if (0x40 - iVar2 < 0x14) {
    FUN_1800dcfc4(param_1,uVar3,0x14);
  }
  else {
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + 0x14;
    *(int *)(param_1 + 0x30) = iVar2 + 0x14;
    *(ulonglong *)(param_1 + 0x28) = *(longlong *)(param_1 + 0x28) << 0x14 | uVar3;
  }
  FUN_18017b5e4(uVar3 & 0xffffffff,&local_18,0x14);
LAB_18007082c:
  fVar4 = (float)FUN_1800dc120(param_3,&local_18);
  uVar1 = (uint)((fVar4 - -3.1415927) / 0.0003834952);
  if ((int)uVar1 < 1) {
    uVar1 = 0;
  }
  if (0x3fff < (int)uVar1) {
    uVar1 = 0x3fff;
  }
  if (0x40 - *(int *)(param_1 + 0x30) < 0xe) {
    FUN_1800dcfc4(param_1);
  }
  else {
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + 0xe;
    *(int *)(param_1 + 0x30) = *(int *)(param_1 + 0x30) + 0xe;
    *(ulonglong *)(param_1 + 0x28) = *(longlong *)(param_1 + 0x28) << 0xe | (ulonglong)uVar1;
  }
  return;
}

