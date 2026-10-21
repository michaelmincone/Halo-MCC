/* REA evidence: ev_1d462e6be7311fd967eefb19d7ed3023a3e496963a6118c4c23031d59ea48010; source: physics-settings-batch.json */

void FUN_18006e3fc(longlong param_1,undefined4 param_2)

{
  longlong lVar1;
  longlong lVar2;
  char cVar3;
  byte *pbVar4;
  float fVar5;
  float fVar6;
  
  lVar1 = *(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8);
  lVar2 = *(longlong *)
           (*(longlong *)(*(longlong *)(lVar1 + 0x10) + 0x50) + 0x10 +
           (ulonglong)(ushort)param_2 * 0x18);
  if ((((*(char *)(*(longlong *)(lVar1 + 0x48) + 0x11) == '\x04') &&
       (*(short *)(lVar2 + 0x1c) != -1)) &&
      (pbVar4 = (byte *)(param_1 + 0x14fc + (longlong)*(short *)(lVar2 + 0x1c) * 0x4c),
      (*pbVar4 & 1) != 0)) && (*(int *)(lVar2 + 0x14) == -1)) {
    cVar3 = FUN_18006fbd4(pbVar4);
    if (cVar3 != '\0') {
      cVar3 = FUN_1800714b8(param_2,0);
      if ((cVar3 == '\0') && (((pbVar4[0x46] & 0x40) != 0 || ((char)pbVar4[0x46] < '\0')))) {
        fVar5 = (float)FUN_180018214(pbVar4 + 0x20,lVar2 + 0x5c);
        fVar6 = (float)FUN_180018214(pbVar4 + 0x14,lVar2 + 0x50);
        if (fVar6 - fVar5 < 0.0) {
          fVar6 = fVar5;
        }
        cVar3 = FUN_1803c6ad4(lVar2 + 0x44,pbVar4 + 8);
        if ((0.00017453292 < fVar6) || (cVar3 == '\0')) {
          FUN_1803c9fc0(param_2,pbVar4 + 8,pbVar4 + 0x14,pbVar4 + 0x20);
        }
      }
    }
  }
  return;
}

