/* REA evidence: ev_0b466879f8171a12d02081074261691c3dcaf721c25c5611b17c508e9f943e21; source: physics-override-batch.json */

void FUN_18009ac84(uint param_1,char param_2,char param_3)

{
  longlong lVar1;
  char cVar2;
  
  lVar1 = *(longlong *)
           (*(longlong *)
             (*(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8) + 0x10)
           + 0x50);
  if ((param_3 != '\0') || ((*(byte *)(lVar1 + 2 + (ulonglong)(param_1 & 0xffff) * 0x18) & 1) != 0))
  {
    cVar2 = FUN_18009a8c0(param_1,**(undefined4 **)
                                    (lVar1 + 0x10 + (ulonglong)(param_1 & 0xffff) * 0x18));
    if (cVar2 != '\0') {
      if (param_2 == '\0') {
        FUN_18009a670(param_1);
      }
      else {
        FUN_18009a81c(param_1,param_1);
      }
    }
  }
  return;
}

