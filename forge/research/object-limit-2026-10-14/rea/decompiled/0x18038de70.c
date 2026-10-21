/* REA evidence: ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5; source: loophole-batch.json */

undefined8 FUN_18038de70(uint *param_1,uint param_2,undefined1 *param_3,uint *param_4)

{
  uint uVar1;
  undefined8 uVar2;
  uint uVar3;
  uint uVar4;
  ushort uVar5;
  
  uVar2 = 0;
  if (param_4 != (uint *)0x0) {
    *param_4 = 0;
  }
  if (0x2f < param_2) {
    uVar5 = (ushort)param_1[3];
    if (uVar5 == 0xfffe) {
      uVar3 = *param_1;
      uVar1 = param_1[1];
      uVar5 = (ushort)param_1[2] << 8 | (ushort)param_1[2] >> 8;
      uVar4 = uVar3 >> 0x18 | (uVar3 & 0xff0000) >> 8 | (uVar3 & 0xff00) << 8 | uVar3 << 0x18;
      uVar3 = uVar1 >> 0x18 | (uVar1 & 0xff0000) >> 8 | (uVar1 & 0xff00) << 8 | uVar1 << 0x18;
      if (param_3 != (undefined1 *)0x0) {
        *param_3 = 0;
      }
    }
    else {
      if ((ushort)(uVar5 << 8 | uVar5 >> 8) != 0xfffe) {
        return 0;
      }
      uVar3 = *param_1;
      uVar1 = param_1[1];
      uVar5 = (ushort)param_1[2] << 8 | (ushort)param_1[2] >> 8;
      uVar4 = uVar3 >> 0x18 | (uVar3 & 0xff0000) >> 8 | (uVar3 & 0xff00) << 8 | uVar3 << 0x18;
      uVar3 = uVar1 >> 0x18 | (uVar1 & 0xff0000) >> 8 | (uVar1 & 0xff00) << 8 | uVar1 << 0x18;
      if (param_3 != (undefined1 *)0x0) {
        *param_3 = 1;
      }
    }
    if (((uVar4 == 0x5f626c66) && (uVar5 == 1)) && (uVar2 = 0, 0x2f < uVar3)) {
      if (param_4 != (uint *)0x0) {
        *param_4 = uVar3;
      }
      uVar2 = 1;
    }
  }
  return uVar2;
}

