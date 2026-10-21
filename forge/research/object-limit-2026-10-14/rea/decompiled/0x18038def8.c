/* REA evidence: ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5; source: loophole-batch.json */

undefined8
FUN_18038def8(uint *param_1,uint param_2,undefined8 param_3,uint param_4,ushort param_5,
             uint *param_6,longlong *param_7,int *param_8,ushort *param_9,undefined1 *param_10)

{
  uint uVar1;
  ushort uVar2;
  ushort uVar3;
  uint uVar4;
  
  *param_6 = 0;
  if (param_7 != (longlong *)0x0) {
    *param_7 = 0;
  }
  if (param_8 != (int *)0x0) {
    *param_8 = 0;
  }
  if (param_9 != (ushort *)0x0) {
    *param_9 = 0;
  }
  if (param_10 != (undefined1 *)0x0) {
    *param_10 = 0;
  }
  if (param_2 < 0xc) {
    return 0;
  }
  uVar1 = param_1[1];
  uVar4 = *param_1;
  uVar2 = (ushort)param_1[2] >> 8 | (ushort)param_1[2] << 8;
  uVar3 = *(ushort *)((longlong)param_1 + 10) >> 8 | *(ushort *)((longlong)param_1 + 10) << 8;
  uVar1 = uVar1 >> 0x18 | (uVar1 & 0xff0000) >> 8 | (uVar1 & 0xff00) << 8 | uVar1 << 0x18;
  uVar4 = uVar4 >> 0x18 | (uVar4 & 0xff0000) >> 8 | (uVar4 & 0xff00) << 8 | uVar4 << 0x18;
  if (uVar1 < 0xc) {
    return 0;
  }
  if ((int)param_2 < (int)uVar1) {
    return 0;
  }
  if ((short)uVar2 < 0) {
    return 0;
  }
  if ((short)uVar3 < 0) {
    return 0;
  }
  *param_6 = uVar1;
  if ((uVar4 == param_4) && (uVar2 == param_5)) {
    if (param_9 != (ushort *)0x0) {
      *param_9 = uVar3;
    }
    if (param_7 != (longlong *)0x0) {
      *param_7 = (longlong)(param_1 + 3);
    }
    if (param_8 != (int *)0x0) {
      *param_8 = uVar1 - 0xc;
    }
    if (uVar4 != 0x5f656f66) {
      return 1;
    }
    if (uVar1 < 0x11) {
      return 1;
    }
    if (param_2 < 0x11) {
      return 1;
    }
  }
  else {
    if (uVar4 != 0x5f656f66) {
      return 1;
    }
    if (uVar1 < 0x11) {
      return 0;
    }
    if (param_2 < 0x11) {
      return 0;
    }
  }
  if (param_10 != (undefined1 *)0x0) {
    *param_10 = 1;
  }
  return 1;
}

