/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

void FUN_18017bb54(byte *param_1)

{
  longlong lVar1;
  bool bVar2;
  bool bVar3;
  char cVar4;
  short sVar5;
  ushort *puVar6;
  short sVar7;
  char local_res8 [8];
  
  if (*(int *)(param_1 + 4) != -1) {
    puVar6 = (ushort *)0x0;
    if (*(int *)(param_1 + 8) != -1) {
      puVar6 = (ushort *)
               FUN_18017c830(*(longlong *)
                              (*(longlong *)
                                ((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8) +
                              0x20) + 0x35d4);
    }
    if ((puVar6 == (ushort *)0x0) || (bVar2 = true, (char)puVar6[3] == '\0')) {
      bVar2 = false;
    }
    if ((puVar6 == (ushort *)0x0) ||
       (bVar3 = true,
       (*(uint *)(*(longlong *)
                   (*(longlong *)
                     (*(longlong *)
                       (*(longlong *)
                         ((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8) + 0x10) +
                     0x50) + 0x10 + (ulonglong)*puVar6 * 0x18) + 0x138) >> 2 & 1) == 0)) {
      bVar3 = false;
    }
    if ((((puVar6 == (ushort *)0x0) || (*(short *)(param_1 + 0xc) != 0x7fff)) ||
        ((bVar2 && ((*param_1 & 4) != 0)))) || ((bVar3 && ((*param_1 & 8) != 0)))) {
      sVar5 = *(short *)(param_1 + 0xc);
      local_res8[0] = '\0';
      if (sVar5 == 0x7fff) {
        sVar5 = FUN_18017c870(*(undefined4 *)(param_1 + 4));
        *(short *)(param_1 + 0xc) = sVar5;
        if (sVar5 == 0) {
          param_1[4] = 0xff;
          param_1[5] = 0xff;
          param_1[6] = 0xff;
          param_1[7] = 0xff;
          param_1[8] = 0xff;
          param_1[9] = 0xff;
          param_1[10] = 0xff;
          param_1[0xb] = 0xff;
          *param_1 = 0;
          param_1[0xc] = 0;
          param_1[0xd] = 0;
        }
      }
      else {
        sVar7 = -0x8000;
        if (sVar5 != -0x8000) {
          sVar7 = sVar5 + -1;
        }
        *(short *)(param_1 + 0xc) = sVar7;
      }
    }
    else {
      local_res8[0] = '\0';
    }
    if ((*(int *)(param_1 + 4) != -1) && (((puVar6 == (ushort *)0x0 || (bVar2)) || (bVar3)))) {
      lVar1 = *(longlong *)
               (*(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8) +
               0x20);
      cVar4 = FUN_18017c64c(lVar1 + 0x35d4,*(int *)(param_1 + 4),local_res8);
      if ((cVar4 != '\0') && ((*(short *)(param_1 + 0xc) < 1 || (local_res8[0] != '\0')))) {
        FUN_18017c75c(lVar1 + 0x35d4,*(undefined4 *)(param_1 + 4),param_1);
      }
    }
  }
  return;
}

