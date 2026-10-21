/* REA evidence: ev_1d462e6be7311fd967eefb19d7ed3023a3e496963a6118c4c23031d59ea48010; source: physics-settings-batch.json */

undefined1 FUN_180071540(void)

{
  int iVar1;
  longlong lVar2;
  short sVar3;
  longlong lVar4;
  
  lVar2 = *(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8);
  iVar1 = *(int *)(*(longlong *)(lVar2 + 0x20) + 0x841c);
  if (iVar1 - 1U < 4) {
    lVar4 = *(longlong *)(&DAT_180b95f78 + (longlong)iVar1 * 8);
  }
  else {
    lVar4 = 0;
  }
  if (((lVar4 != 0) && (*(char *)(*(longlong *)(lVar2 + 0x48) + 0x10) == '\x03')) &&
     (sVar3 = FUN_180080ff8(), sVar3 == 1)) {
    return 1;
  }
  return 0;
}

