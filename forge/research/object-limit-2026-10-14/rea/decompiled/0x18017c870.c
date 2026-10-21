/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

ulonglong FUN_18017c870(undefined4 param_1)

{
  uint uVar1;
  longlong lVar2;
  undefined8 uVar3;
  ulonglong uVar4;
  byte local_58 [2];
  undefined2 local_56;
  undefined4 local_54;
  undefined2 local_2c;
  undefined8 local_28;
  undefined8 local_20;
  undefined1 local_18;
  ulonglong local_17;
  undefined2 local_f;
  undefined1 local_d;
  
  uVar4 = 0;
  lVar2 = FUN_18006bcec();
  if (lVar2 != 0) {
    uVar3 = FUN_18006bcec();
    memset(local_58,0,0x4c);
    local_28 = 0;
    local_20 = 0;
    local_56 = 0xffff;
    local_54 = 0xffffffff;
    local_2c = 0xffff;
    local_d = 0;
    local_18 = 0;
    local_f = 0xff00;
    local_17 = 0x800ffff000000;
    FUN_18006e550(uVar3,param_1,local_58);
    uVar1 = FUN_18017c4c8(param_1);
    if (uVar1 != 0xffffffff) {
      uVar1 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)(uVar1 & 0xffff) * 8);
      uVar4 = (&DAT_184e39f20)[uVar1 >> 0x1c] + (ulonglong)uVar1 * 4;
    }
    uVar1 = 0xffffffff;
    if ((uVar4 != 0) && (uVar1 = 0xffffffff, 0 < *(int *)(uVar4 + 0x140))) {
      uVar1 = (uint)*(short *)((&DAT_184e39f20)[*(uint *)(uVar4 + 0x144) >> 0x1c] + 0x16 +
                              (ulonglong)*(uint *)(uVar4 + 0x144) * 4);
    }
    if ((local_58[0] & 3) == 0) {
      uVar4 = 0;
      if (0 < (int)uVar1) {
        uVar4 = (ulonglong)uVar1;
      }
    }
    else {
      uVar4 = local_17 >> 8 & 0xff;
    }
  }
  return uVar4;
}

