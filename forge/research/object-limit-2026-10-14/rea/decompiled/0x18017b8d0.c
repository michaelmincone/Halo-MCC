/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

void FUN_18017b8d0(uint param_1)

{
  int iVar1;
  longlong lVar2;
  char cVar3;
  longlong lVar4;
  ulonglong uVar5;
  
  lVar2 = *(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8);
  if (*(char *)(*(longlong *)(lVar2 + 0x48) + 0x11) != '\x04') {
    iVar1 = *(int *)(*(longlong *)(lVar2 + 0x20) + 0x841c);
    if (iVar1 - 1U < 4) {
      lVar4 = *(longlong *)(&DAT_180b95f78 + (longlong)iVar1 * 8);
    }
    else {
      lVar4 = 0;
    }
    if (lVar4 != 0) {
      uVar5 = (ulonglong)param_1 & 0xffff;
      lVar4 = *(longlong *)(*(longlong *)(lVar2 + 0x10) + 0x50);
      if (((1 << (*(byte *)(lVar4 + 4 + uVar5 * 0x18) & 0x1f) & 0x50eU) != 0) &&
         (*(short *)(*(longlong *)(lVar4 + 0x10 + uVar5 * 0x18) + 0x192) != -1)) {
        cVar3 = FUN_18017cddc();
        if (((cVar3 != '\0') &&
            (lVar4 = *(longlong *)
                      (*(longlong *)(*(longlong *)(lVar2 + 0x10) + 0x50) + 0x10 + uVar5 * 0x18),
            (*(byte *)((longlong)*(short *)(lVar4 + 0x192) + 0x12 + lVar4) >> 4 & 1) == 0)) &&
           ((*(short *)(lVar4 + 0x1c) != -1 || (*(short *)(lVar4 + 0x1a) != -1)))) {
          FUN_18017c2a8(*(longlong *)(lVar2 + 0x20) + 0x35d4,(int)*(short *)(lVar4 + 0x1c),param_1);
        }
      }
    }
  }
  return;
}

