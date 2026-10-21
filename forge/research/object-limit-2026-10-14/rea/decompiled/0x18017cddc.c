/* REA evidence: ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3; source: respawn-eligibility-batch.json */

longlong * FUN_18017cddc(void)

{
  int iVar1;
  char cVar2;
  longlong *plVar3;
  longlong *plVar4;
  
  plVar4 = (longlong *)0x0;
  iVar1 = *(int *)(*(longlong *)
                    (*(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8)
                    + 0x20) + 0x841c);
  plVar3 = plVar4;
  if (iVar1 - 1U < 4) {
    plVar3 = *(longlong **)(&DAT_180b95f78 + (longlong)iVar1 * 8);
  }
  if (plVar3 != (longlong *)0x0) {
    plVar3 = plVar4;
    if (iVar1 - 1U < 4) {
      plVar3 = *(longlong **)(&DAT_180b95f78 + (longlong)iVar1 * 8);
    }
    cVar2 = (**(code **)(*plVar3 + 0x318))();
    if (cVar2 != '\0') {
      plVar4 = (longlong *)0x1;
    }
  }
  return plVar4;
}

