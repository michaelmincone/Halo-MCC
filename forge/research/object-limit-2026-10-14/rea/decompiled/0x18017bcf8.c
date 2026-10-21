/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_18017bcf8(byte *param_1)

{
  char cVar1;
  short sVar2;
  undefined2 uVar3;
  int iVar4;
  uint uVar5;
  undefined8 uVar6;
  ulonglong uVar7;
  longlong lVar8;
  ulonglong uVar9;
  longlong lVar10;
  undefined1 auStack_d8 [32];
  undefined8 local_b8;
  ushort *local_b0;
  undefined4 local_a8;
  undefined1 local_98 [8];
  float local_90;
  float local_8c;
  float local_88;
  ushort local_78 [32];
  ulonglong local_38;
  
  local_38 = DAT_180afa010 ^ (ulonglong)auStack_d8;
  lVar10 = 0;
  uVar6 = FUN_18006bcec();
  uVar7 = FUN_18006e6c8(uVar6,*(undefined4 *)(param_1 + 4),0);
  if ((int)uVar7 != -1) {
    uVar9 = (ulonglong)_tls_index;
    uVar5 = *(uint *)(DAT_180c1a600 + 4 + (uVar7 & 0xffff) * 8);
    uVar7 = (ulonglong)uVar5;
    lVar8 = (&DAT_184e39f20)[uVar5 >> 0x1c];
    if (*(short *)(lVar8 + uVar7 * 4) == 1) {
      uVar6 = FUN_18006bcec();
      local_b8 = 0;
      FUN_18006e264(uVar6,*(undefined4 *)(param_1 + 4),&local_90,0);
      local_90 = local_90 + *(float *)(lVar8 + 0x10 + uVar7 * 4);
      local_8c = local_8c + *(float *)(lVar8 + 0x14 + uVar7 * 4);
      local_88 = local_88 + *(float *)(lVar8 + 0x18 + uVar7 * 4);
      FUN_1800145c8(local_98,&local_90);
      local_b0 = local_78;
      local_a8 = 0x10;
      local_b8 = CONCAT44(local_b8._4_4_,*(undefined4 *)(lVar8 + 0xc + uVar7 * 4));
      iVar4 = FUN_180473ed0(1,1,local_98,&local_90);
      if (0 < iVar4) {
        lVar8 = lVar10;
        do {
          if (*(int *)(*(longlong *)
                        (*(longlong *)
                          (*(longlong *)
                            (*(longlong *)((longlong)ThreadLocalStoragePointer + uVar9 * 8) + 0x10)
                          + 0x50) + 0x10 + (ulonglong)local_78[lVar8 * 2] * 0x18) + 800) == -1)
          goto LAB_18017bef7;
          lVar8 = lVar8 + 1;
        } while (lVar8 < iVar4);
      }
    }
    uVar6 = FUN_18006bcec();
    uVar5 = FUN_18006ed04(uVar6,*(undefined4 *)(param_1 + 4),1);
    if (uVar5 == 0xffffffff) {
LAB_18017bef7:
      uVar3 = 10;
    }
    else {
      lVar10 = *(longlong *)((longlong)ThreadLocalStoragePointer + uVar9 * 8);
      uVar7 = (ulonglong)uVar5 & 0xffff;
      lVar8 = *(longlong *)
               (*(longlong *)(*(longlong *)(lVar10 + 0x10) + 0x50) + 0x10 + uVar7 * 0x18);
      FUN_1804715f8((ulonglong)uVar5,0);
      if (*(char *)(*(longlong *)(*(longlong *)(lVar10 + 0x10) + 0x50) + 4 + uVar7 * 0x18) == '\x02'
         ) {
        FUN_1804ed93c(uVar5);
      }
      sVar2 = *(short *)(lVar8 + 0x192);
      *param_1 = 1;
      cVar1 = *(char *)((longlong)sVar2 + 0x1e + lVar8);
      if (cVar1 == '\0') {
        *param_1 = *param_1 | 8;
      }
      else if (cVar1 == '\x01') {
        *param_1 = *param_1 | 4;
      }
      *(uint *)(param_1 + 8) = uVar5;
      lVar10 = 1;
      *(byte *)(lVar8 + 0x100) = *(byte *)(lVar8 + 0x100) | 2;
      uVar3 = 0x7fff;
    }
    *(undefined2 *)(param_1 + 0xc) = uVar3;
  }
  return lVar10;
}

