/* REA evidence: ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3; source: respawn-eligibility-batch.json */

void FUN_18006e264(longlong param_1,int param_2,undefined8 *param_3,undefined8 *param_4,
                  undefined8 *param_5)

{
  short sVar1;
  longlong lVar2;
  undefined8 local_78;
  undefined4 local_70;
  undefined8 local_68;
  undefined4 local_60;
  undefined8 local_58;
  undefined4 local_50;
  undefined4 local_48;
  float local_44;
  float local_40;
  float local_3c;
  float local_38;
  float local_34;
  float local_30;
  float local_2c;
  float local_28;
  float local_24;
  undefined1 local_20 [24];
  
  lVar2 = (longlong)param_2 * 0x4c;
  if ((*(byte *)(lVar2 + 0x14fc + param_1) & 1) != 0) {
    local_78 = *(undefined8 *)(lVar2 + 0x1504 + param_1);
    local_70 = *(undefined4 *)(lVar2 + 0x150c + param_1);
    local_68 = *(undefined8 *)(lVar2 + 0x1510 + param_1);
    local_60 = *(undefined4 *)(lVar2 + 0x1518 + param_1);
    local_58 = *(undefined8 *)(lVar2 + 0x151c + param_1);
    local_50 = *(undefined4 *)(lVar2 + 0x1524 + param_1);
    sVar1 = *(short *)(lVar2 + 0x1528 + param_1);
    if (sVar1 != -1) {
      local_48 = 0x3f800000;
      FUN_18006e264(0x3f800000,(int)sVar1,local_20,&local_44,&local_2c);
      local_38 = local_3c * local_28 - local_24 * local_40;
      local_34 = local_24 * local_44 - local_3c * local_2c;
      local_30 = local_2c * local_40 - local_44 * local_28;
      FUN_1800a8c78(&local_48,&local_78,&local_78);
      FUN_1800a8d1c(&local_48,&local_68,&local_68);
      FUN_1800a8d1c(&local_48,&local_58,&local_58);
    }
    if (param_3 != (undefined8 *)0x0) {
      *param_3 = local_78;
      *(undefined4 *)(param_3 + 1) = local_70;
    }
    if (param_4 != (undefined8 *)0x0) {
      *param_4 = local_68;
      *(undefined4 *)(param_4 + 1) = local_60;
    }
    if (param_5 != (undefined8 *)0x0) {
      *param_5 = local_58;
      *(undefined4 *)(param_5 + 1) = local_50;
    }
  }
  return;
}

