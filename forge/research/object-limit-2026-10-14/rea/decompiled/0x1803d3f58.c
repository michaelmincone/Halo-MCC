/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

uint FUN_1803d3f58(undefined8 param_1,short *param_2,longlong param_3,undefined8 param_4,
                  longlong param_5)

{
  byte *pbVar1;
  short sVar2;
  short sVar3;
  uint uVar4;
  undefined8 uVar5;
  longlong lVar6;
  longlong lVar7;
  
  uVar4 = 0xffffffff;
  if (param_2[1] != -1) {
    uVar5 = FUN_18006bcec();
    FUN_18006e920(uVar5,(int)param_2[1],param_5);
  }
  FUN_18047b76c();
  if (*(int *)(param_2 + 6) != -1) {
    lVar6 = FUN_180031ae8(0x6f626a65);
    if (lVar6 != 0) {
      sVar2 = *param_2;
      if (sVar2 == -1) {
        uVar4 = FUN_18046d6e0(param_5);
      }
      else {
        uVar4 = FUN_1803d89fc(param_2);
      }
      if (uVar4 != 0xffffffff) {
        lVar6 = *(longlong *)
                 (*(longlong *)
                   (*(longlong *)
                     (*(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8)
                     + 0x10) + 0x50) + 0x10 + (ulonglong)(uVar4 & 0xffff) * 0x18);
        sVar3 = param_2[1];
        *(short *)(lVar6 + 0x1c) = sVar3;
        if (sVar3 != -1) {
          uVar5 = FUN_18006bcec();
          FUN_18006f240(uVar5,uVar4);
        }
        if (((*(int *)(param_3 + 0x120) != -1) && (*(char *)(param_3 + 0x126) != '\0')) &&
           (*(char *)((longlong)param_2 + 5) != -1)) {
          FUN_1803d8bac();
        }
        if (sVar2 == -1) {
          FUN_18046cd64(uVar4,param_5 + 0x40,param_5 + 0x4c);
        }
        if ((*(byte *)(param_2 + 2) & 2) != 0) {
          lVar7 = FUN_1804739cc(uVar4,0xffffffff);
          if (lVar7 != 0) {
            *(byte *)(lVar7 + 0x143) = *(byte *)(lVar7 + 0x143) | 1;
          }
        }
        if ((sVar2 != -1) && ((*(byte *)(param_2 + 2) & 4) != 0)) {
          FUN_1801223d0(uVar4);
          pbVar1 = (byte *)(lVar6 + 0x100);
          *pbVar1 = *pbVar1 | 0x10;
        }
      }
    }
  }
  return uVar4;
}

