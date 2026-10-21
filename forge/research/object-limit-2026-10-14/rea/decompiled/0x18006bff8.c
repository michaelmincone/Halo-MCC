/* REA evidence: ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5; source: loophole-batch.json */

longlong FUN_18006bff8(longlong param_1)

{
  longlong lVar1;
  longlong lVar2;
  
  lVar2 = param_1 + 0x14fc;
  *(undefined8 *)(param_1 + 0x2b8) = 0;
  *(undefined8 *)(param_1 + 0x2c0) = 0;
  lVar1 = 0x28b;
  do {
    FUN_18006bb20(lVar2);
    lVar2 = lVar2 + 0x4c;
    lVar1 = lVar1 + -1;
  } while (lVar1 != 0);
  lVar2 = param_1 + 0xd640;
  lVar1 = 0x100;
  do {
    FUN_18006bb64(lVar2);
    lVar2 = lVar2 + 3;
    lVar1 = lVar1 + -1;
  } while (lVar1 != 0);
  FUN_18006c080(param_1,0xffffffff);
  return param_1;
}

