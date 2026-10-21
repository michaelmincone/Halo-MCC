/* REA/Ghidra ev_537fb1f10b74f207b94e680ed04855491a4c64368f7f7c2130e80dbbd5ec0483 */

void FUN_18006f7f0(longlong param_1,longlong param_2)

{
  byte bVar1;
  ulonglong uVar2;
  int iVar3;
  uint uVar4;
  ulonglong uVar5;
  undefined8 uVar6;
  char cVar7;
  
  FUN_1804ec7d0();
  bVar1 = *(byte *)(param_1 + 0x11);
  if (0x40 - *(int *)(param_2 + 0x30) < 8) {
    FUN_1800dcfc4(param_2,(ulonglong)bVar1,8);
    iVar3 = *(int *)(param_2 + 0x30);
  }
  else {
    iVar3 = *(int *)(param_2 + 0x30) + 8;
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 8;
    *(int *)(param_2 + 0x30) = iVar3;
    *(ulonglong *)(param_2 + 0x28) = *(longlong *)(param_2 + 0x28) << 8 | (ulonglong)bVar1;
  }
  bVar1 = *(byte *)(param_1 + 0x12);
  if (0x40 - iVar3 < 8) {
    FUN_1800dcfc4(param_2,(ulonglong)bVar1,8);
    iVar3 = *(int *)(param_2 + 0x30);
  }
  else {
    iVar3 = iVar3 + 8;
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 8;
    *(int *)(param_2 + 0x30) = iVar3;
    *(ulonglong *)(param_2 + 0x28) = *(longlong *)(param_2 + 0x28) << 8 | (ulonglong)bVar1;
  }
  cVar7 = *(char *)(param_1 + 0x13);
  if (0x40 - iVar3 < 5) {
    FUN_1800dcfc4(param_2,(ulonglong)(uint)(int)cVar7,5);
  }
  else {
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 5;
    *(int *)(param_2 + 0x30) = iVar3 + 5;
    *(ulonglong *)(param_2 + 0x28) =
         *(longlong *)(param_2 + 0x28) << 5 | (ulonglong)(uint)(int)cVar7;
  }
  FUN_18007064c(param_2);
  bVar1 = *(byte *)(param_1 + 0x16);
  if (0x40 - *(int *)(param_2 + 0x30) < 8) {
    FUN_1800dcfc4(param_2,(ulonglong)bVar1,8);
    iVar3 = *(int *)(param_2 + 0x30);
  }
  else {
    iVar3 = *(int *)(param_2 + 0x30) + 8;
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 8;
    *(int *)(param_2 + 0x30) = iVar3;
    *(ulonglong *)(param_2 + 0x28) = *(longlong *)(param_2 + 0x28) << 8 | (ulonglong)bVar1;
  }
  cVar7 = *(char *)(param_1 + 0x17);
  if (0x40 - iVar3 < 4) {
    FUN_1800dcfc4(param_2);
    uVar4 = *(uint *)(param_2 + 0x30);
  }
  else {
    uVar4 = iVar3 + 4;
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 4;
    *(uint *)(param_2 + 0x30) = uVar4;
    *(ulonglong *)(param_2 + 0x28) =
         *(longlong *)(param_2 + 0x28) << 4 | (ulonglong)((int)cVar7 + 1);
  }
  cVar7 = *(char *)(param_1 + 0x1a);
  if (uVar4 < 0x40) {
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 1;
    *(uint *)(param_2 + 0x30) = uVar4 + 1;
    *(ulonglong *)(param_2 + 0x28) = *(longlong *)(param_2 + 0x28) * 2 | (ulonglong)(cVar7 == -1);
  }
  else {
    FUN_1800dcfc4(param_2,(ulonglong)(cVar7 == -1),1);
  }
  if (cVar7 != -1) {
    if (0x40 - *(int *)(param_2 + 0x30) < 3) {
      FUN_1800dcfc4(param_2);
    }
    else {
      *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 3;
      *(int *)(param_2 + 0x30) = *(int *)(param_2 + 0x30) + 3;
      *(ulonglong *)(param_2 + 0x28) =
           *(longlong *)(param_2 + 0x28) << 3 | (ulonglong)(uint)(int)cVar7;
    }
  }
  cVar7 = *(char *)(param_1 + 0x13);
  if (cVar7 == '\x01') {
    iVar3 = *(int *)(param_2 + 0x30);
    bVar1 = *(byte *)(param_1 + 0x18);
  }
  else {
    if (cVar7 < '\f') {
      return;
    }
    if (cVar7 < '\x0f') {
      bVar1 = *(byte *)(param_1 + 0x18);
      if (0x40 - *(int *)(param_2 + 0x30) < 5) {
        FUN_1800dcfc4(param_2,(ulonglong)bVar1,5);
        iVar3 = *(int *)(param_2 + 0x30);
      }
      else {
        iVar3 = *(int *)(param_2 + 0x30) + 5;
        *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 5;
        *(int *)(param_2 + 0x30) = iVar3;
        *(ulonglong *)(param_2 + 0x28) = *(longlong *)(param_2 + 0x28) << 5 | (ulonglong)bVar1;
      }
      uVar5 = (ulonglong)*(byte *)(param_1 + 0x19);
      if (0x40 - iVar3 < 5) {
        uVar6 = 5;
        goto LAB_18006fa76;
      }
      *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 5;
      *(int *)(param_2 + 0x30) = iVar3 + 5;
      uVar2 = *(longlong *)(param_2 + 0x28) << 5;
      goto LAB_18006fa6a;
    }
    if (cVar7 != '\x13') {
      return;
    }
    iVar3 = *(int *)(param_2 + 0x30);
    bVar1 = *(char *)(param_1 + 0x18) + 1;
  }
  uVar5 = (ulonglong)bVar1;
  if (0x40 - iVar3 < 8) {
    uVar6 = 8;
LAB_18006fa76:
    FUN_1800dcfc4(param_2,uVar5,uVar6);
    return;
  }
  *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 8;
  *(int *)(param_2 + 0x30) = iVar3 + 8;
  uVar2 = *(longlong *)(param_2 + 0x28) << 8;
LAB_18006fa6a:
  *(ulonglong *)(param_2 + 0x28) = uVar2 | uVar5;
  return;
}

