/* REA/Ghidra ev_537fb1f10b74f207b94e680ed04855491a4c64368f7f7c2130e80dbbd5ec0483 */

void FUN_18006fa9c(undefined8 *param_1,undefined8 param_2)

{
  undefined1 uVar1;
  char cVar2;
  undefined1 uVar3;
  undefined2 uVar4;
  
  uVar3 = 0xff;
  *param_1 = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  *(undefined4 *)(param_1 + 3) = 0;
  *(undefined1 *)((longlong)param_1 + 0x17) = 8;
  *(undefined1 *)((longlong)param_1 + 0x1a) = 0xff;
  *(undefined2 *)((longlong)param_1 + 0x14) = 0xffff;
  FUN_1804ec888();
  uVar1 = FUN_1800dd10c(param_2,8);
  *(undefined1 *)((longlong)param_1 + 0x11) = uVar1;
  uVar1 = FUN_1800dd10c(param_2,8);
  *(undefined1 *)((longlong)param_1 + 0x12) = uVar1;
  uVar1 = FUN_1800dd10c(param_2,5);
  *(undefined1 *)((longlong)param_1 + 0x13) = uVar1;
  cVar2 = FUN_180054214(param_2);
  if (cVar2 == '\0') {
    uVar4 = FUN_1800dd10c(param_2,8);
  }
  else {
    uVar4 = 0xffff;
  }
  *(undefined2 *)((longlong)param_1 + 0x14) = uVar4;
  uVar1 = FUN_1800dd10c(param_2,8);
  *(undefined1 *)((longlong)param_1 + 0x16) = uVar1;
  cVar2 = FUN_1800dd10c(param_2,4);
  *(char *)((longlong)param_1 + 0x17) = cVar2 + -1;
  cVar2 = FUN_180054214(param_2);
  if (cVar2 == '\0') {
    uVar3 = FUN_1800dd10c(param_2,3);
  }
  cVar2 = *(char *)((longlong)param_1 + 0x13);
  *(undefined1 *)((longlong)param_1 + 0x1a) = uVar3;
  if (cVar2 == '\x01') {
    cVar2 = FUN_1800dd10c(param_2,8);
  }
  else {
    if (cVar2 < '\f') {
      return;
    }
    if (cVar2 < '\x0f') {
      uVar1 = FUN_1800dd10c(param_2,5);
      *(undefined1 *)(param_1 + 3) = uVar1;
      uVar1 = FUN_1800dd10c(param_2,5);
      *(undefined1 *)((longlong)param_1 + 0x19) = uVar1;
      return;
    }
    if (cVar2 != '\x13') {
      return;
    }
    cVar2 = FUN_1800dd10c(param_2,8);
    cVar2 = cVar2 + -1;
  }
  *(char *)(param_1 + 3) = cVar2;
  return;
}

