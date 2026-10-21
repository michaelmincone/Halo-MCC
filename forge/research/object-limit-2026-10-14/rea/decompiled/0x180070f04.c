/* REA evidence: ev_1d462e6be7311fd967eefb19d7ed3023a3e496963a6118c4c23031d59ea48010; source: physics-settings-batch.json */

void FUN_180070f04(ulonglong param_1)

{
  longlong lVar1;
  char cVar2;
  int iVar3;
  longlong lVar4;
  int iVar5;
  undefined4 *puVar6;
  longlong lVar7;
  longlong lVar8;
  
  lVar7 = *(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8);
  lVar1 = *(longlong *)(lVar7 + 0x20);
  lVar8 = lVar1 + 0x16c;
  lVar4 = FUN_18014ade8();
  iVar5 = 0;
  iVar3 = *(int *)(lVar4 + 0xe4d8);
  lVar7 = *(longlong *)
           (*(longlong *)(*(longlong *)(lVar7 + 0x10) + 0x50) + 0x10 + (param_1 & 0xffff) * 0x18);
  lVar7 = *(short *)(lVar7 + 0x192) + lVar7;
  if (0 < iVar3) {
    do {
      FUN_18014d528(lVar8,param_1 & 0xffffffff,lVar7,iVar5);
      iVar3 = *(int *)(lVar4 + 0xe4d8);
      iVar5 = iVar5 + 1;
    } while (iVar5 < iVar3);
  }
  iVar5 = 0;
  if (0 < iVar3) {
    puVar6 = (undefined4 *)(lVar1 + 0x150c);
    do {
      cVar2 = FUN_180146208(lVar4 + 0xe4e0 + (longlong)iVar5 * 0x10,param_1 & 0xffffffff);
      if (cVar2 != '\0') {
        *(undefined4 *)((lVar7 - lVar8) + -0x135c + (longlong)puVar6) = *puVar6;
        *puVar6 = (int)param_1;
      }
      iVar5 = iVar5 + 1;
      puVar6 = puVar6 + 1;
    } while (iVar5 < *(int *)(lVar4 + 0xe4d8));
  }
  return;
}

