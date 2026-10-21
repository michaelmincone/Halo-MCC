/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

uint FUN_18006ed04(longlong param_1,int param_2,char param_3)

{
  char cVar1;
  uint uVar2;
  longlong lVar3;
  uint uVar4;
  undefined1 auStack_1f8 [32];
  uint local_1d8 [6];
  uint local_1c0;
  undefined8 local_1b0;
  undefined4 local_1a8;
  undefined8 local_1a4;
  undefined4 local_19c;
  undefined2 local_174;
  undefined2 local_168;
  undefined1 local_164;
  undefined2 local_ac;
  ulonglong local_30;
  
  local_30 = DAT_180afa010 ^ (ulonglong)auStack_1f8;
  local_174 = 0xffff;
  local_168 = 0xffff;
  local_1c0 = 0;
  uVar4 = 0xffffffff;
  local_164 = 0;
  local_ac = 0;
  lVar3 = FUN_18006cf60(param_1,(int)*(short *)((longlong)param_2 * 0x4c + 0x14fe + param_1));
  FUN_18049cc24(local_1d8,
                *(undefined4 *)
                 ((&DAT_184e39f20)[*(uint *)(lVar3 + 8) >> 0x1c] + 0x10 +
                 ((ulonglong)*(uint *)(lVar3 + 8) +
                 (ulonglong)*(byte *)((longlong)param_2 * 0x4c + 0x152a + param_1) * 6) * 4),
                0xffffffff,0);
  uVar2 = 0xffffffff;
  if (local_1d8[0] != 0xffffffff) {
    FUN_18006efa0(param_1,param_2,local_1d8);
    cVar1 = FUN_180070ce8(&local_1b0,&local_1a4);
    if (cVar1 == '\0') {
      local_1b0 = 0x3f800000;
      local_1a8 = 0;
      local_1a4 = 0;
      local_19c = 0x3f800000;
    }
    cVar1 = FUN_18049c8b4(local_1d8);
    uVar2 = uVar4;
    if (cVar1 != '\0') {
      local_1d8[0] = FUN_18049c7d0(local_1d8[0]);
      if ((local_1d8[0] != 0xffffffff) &&
         (uVar4 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)(local_1d8[0] & 0xffff) * 8),
         *(int *)((&DAT_184e39f20)[uVar4 >> 0x1c] + 0x70 + (ulonglong)uVar4 * 4) != -1)) {
        if (param_3 == '\0') {
          local_1c0 = local_1c0 & 0xfffffdff;
        }
        else {
          local_1c0 = local_1c0 | 0x200;
        }
        uVar2 = FUN_18046d6e0(local_1d8);
        if (uVar2 != 0xffffffff) {
          *(short *)(*(longlong *)
                      (*(longlong *)
                        (*(longlong *)
                          (*(longlong *)
                            ((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8) + 0x10
                          ) + 0x50) + 0x10 + (ulonglong)(uVar2 & 0xffff) * 0x18) + 0x1c) =
               (short)param_2;
          FUN_18006f240(param_1,uVar2);
          FUN_18017b8d0(uVar2);
          FUN_1803a645c(uVar2);
          FUN_1803a6054(param_2,7);
        }
      }
    }
  }
  return uVar2;
}

