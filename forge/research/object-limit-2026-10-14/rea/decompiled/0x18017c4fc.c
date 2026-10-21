/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

int FUN_18017c4fc(undefined8 param_1,int param_2,uint param_3)

{
  ushort uVar1;
  void *pvVar2;
  char cVar3;
  longlong lVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  uint *puVar8;
  ulonglong uVar9;
  uint *local_38;
  int local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  
  iVar7 = 0;
  if (param_3 != 0xffffffff) {
    uVar5 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)(param_3 & 0xffff) * 8);
    uVar1 = *(ushort *)((&DAT_184e39f20)[uVar5 >> 0x1c] + (ulonglong)uVar5 * 4);
    if (uVar1 < 0xe) {
      local_38 = (uint *)0x0;
      iVar6 = 1 << ((byte)uVar1 & 0x1f);
      local_1c = 0x86868686;
      local_20 = 0xffffffff;
      local_30 = -1;
      if (iVar6 != 0) {
        local_30 = iVar6;
      }
      local_2c = 0;
      local_28 = 0;
      local_24 = 0;
      cVar3 = FUN_180473a78(&local_38);
      pvVar2 = ThreadLocalStoragePointer;
      if (cVar3 != '\0') {
        uVar9 = (ulonglong)_tls_index;
        do {
          if (param_3 == *local_38) {
            if (*(short *)(*(longlong *)
                            (*(longlong *)
                              (*(longlong *)(*(longlong *)((longlong)pvVar2 + uVar9 * 8) + 0x10) +
                              0x50) + 0x10 + (ulonglong)(ushort)local_20 * 0x18) + 0x192) == -1) {
LAB_18017c611:
              uVar5 = 1;
            }
            else {
              puVar8 = local_38;
              lVar4 = FUN_18017c830(param_1,local_20);
              if ((lVar4 == 0) ||
                 (-1 < *(char *)((longlong)*(short *)((longlong)puVar8 + 0x192) + 0x12 +
                                (longlong)puVar8))) goto LAB_18017c611;
              uVar5 = (uint)((short)puVar8[7] == param_2);
            }
            iVar7 = iVar7 + uVar5;
          }
          cVar3 = FUN_180473a78(&local_38);
        } while (cVar3 != '\0');
      }
    }
  }
  return iVar7;
}

