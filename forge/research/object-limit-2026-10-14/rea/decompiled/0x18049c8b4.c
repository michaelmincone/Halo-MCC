/* REA evidence: ev_03242fd474b5bfd9b5cd7476c32d52800dcc224d1278510d1e91a9608ac3e0c2; source: object-creation-batch.json */

char FUN_18049c8b4(uint *param_1)

{
  uint uVar1;
  int iVar2;
  longlong lVar3;
  char cVar4;
  char cVar5;
  char cVar6;
  byte bVar7;
  byte *pbVar8;
  longlong lVar9;
  longlong lVar10;
  longlong lVar11;
  longlong *plVar12;
  longlong *plVar13;
  bool bVar14;
  ulonglong uVar15;
  char cVar16;
  
  cVar4 = FUN_180059398();
  uVar1 = *param_1;
  cVar5 = '\x01';
  if (cVar4 == '\0') {
    return '\x01';
  }
  uVar15 = (longlong)param_1 + 0x14bU & 0xfffffffffffffffc;
  if (uVar15 != 0) {
    lVar9 = *(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8);
    lVar11 = *(longlong *)(lVar9 + 0x48);
    if (((byte)(*(char *)(lVar11 + 0x10) - 1U) < 3) && (lVar11 + 0x14e8 != 0)) {
      lVar10 = 0;
      if ((byte)(*(char *)(lVar11 + 0x10) - 1U) < 3) {
        lVar10 = lVar11 + 0x14e8;
      }
      cVar4 = (**(code **)(*(longlong *)(lVar10 + 4) + 0x58))();
      lVar11 = *(longlong *)(lVar9 + 0x48);
    }
    else {
      cVar4 = '\0';
    }
    plVar13 = (longlong *)0x0;
    if (((byte)(*(char *)(lVar11 + 0x10) - 1U) < 3) &&
       ((longlong *)(lVar11 + 0x14e8) != (longlong *)0x0)) {
      plVar12 = plVar13;
      if ((byte)(*(char *)(lVar11 + 0x10) - 1U) < 3) {
        plVar12 = (longlong *)(lVar11 + 0x14e8);
      }
      cVar5 = (**(code **)(*(longlong *)((longlong)plVar12 + 4) + 0x58))();
      cVar16 = cVar5 == '\0';
    }
    else {
      cVar16 = false;
    }
    cVar6 = FUN_180071540();
    cVar5 = true;
    if ((((cVar6 == '\0') && (iVar2 = *(int *)(uVar15 + 0x20), iVar2 != 0)) &&
        (bVar14 = cVar4 == '\0' || iVar2 == 1, cVar5 = bVar14, cVar16 != '\0')) &&
       (cVar5 = false, iVar2 == 2)) {
      cVar5 = bVar14;
    }
    if ((bool)cVar5 == false) {
      return '\0';
    }
    if ((*(byte *)(uVar15 + 0x24) & 0x1f) != 0) {
      iVar2 = *(int *)(*(longlong *)(lVar9 + 0x20) + 0x841c);
      plVar12 = plVar13;
      if (iVar2 - 1U < 4) {
        plVar12 = *(longlong **)(&DAT_180b95f78 + (longlong)iVar2 * 8);
      }
      bVar7 = (**(code **)*plVar12)();
      cVar5 = cVar5 & -((*(byte *)(uVar15 + 0x24) & '\x01' << (bVar7 & 0x1f)) != 0);
    }
    if ((bool)cVar5 == false) {
      return '\0';
    }
    if ((*(byte *)(uVar15 + 0x2b) & 4) != 0) {
      iVar2 = *(int *)(*(longlong *)(lVar9 + 0x20) + 0x841c);
      if (iVar2 - 1U < 4) {
        plVar13 = *(longlong **)(&DAT_180b95f78 + (longlong)iVar2 * 8);
      }
      cVar5 = (**(code **)(*plVar13 + 0x158))(plVar13,param_1);
    }
    if (cVar5 == '\0') {
      return '\0';
    }
  }
  lVar9 = 0;
  if (uVar1 != 0xffffffff) {
    uVar1 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)(uVar1 & 0xffff) * 8);
    lVar11 = *(longlong *)
              (*(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8) + 0x48
              );
    cVar4 = *(char *)(lVar11 + 0x10);
    pbVar8 = (byte *)(lVar11 + 0x17e8);
    if (2 < (byte)(cVar4 - 1U)) {
      pbVar8 = &DAT_00000300;
    }
    if (((*pbVar8 & 2) == 0) && ((*(byte *)(uVar15 + 0x2b) & 8) != 0)) {
      cVar5 = '\0';
    }
    if (0 < *(int *)((&DAT_184e39f20)[uVar1 >> 0x1c] + 0x140 + (ulonglong)uVar1 * 4)) {
      uVar1 = *(uint *)((&DAT_184e39f20)[uVar1 >> 0x1c] + 0x144 + (ulonglong)uVar1 * 4);
      uVar15 = (ulonglong)uVar1;
      lVar3 = (&DAT_184e39f20)[uVar1 >> 0x1c];
      lVar10 = lVar9;
      if ((byte)(cVar4 - 1U) < 3) {
        lVar10 = lVar11 + 0x14e8;
      }
      if (((*(byte *)(lVar10 + 0x300) & 1) == 0) && (*(char *)(lVar3 + 1 + uVar15 * 4) == '\x02')) {
        cVar5 = '\0';
      }
      lVar10 = lVar9;
      if ((byte)(cVar4 - 1U) < 3) {
        lVar10 = lVar11 + 0x14e8;
      }
      if (((*(byte *)(lVar10 + 0x300) & 4) == 0) && (*(char *)(lVar3 + 1 + uVar15 * 4) == '\x05')) {
        cVar5 = '\0';
      }
      lVar10 = lVar9;
      if ((byte)(cVar4 - 1U) < 3) {
        lVar10 = lVar11 + 0x14e8;
      }
      if (((*(byte *)(lVar10 + 0x300) & 8) == 0) && (*(char *)(lVar3 + 1 + uVar15 * 4) == '\x04')) {
        cVar5 = '\0';
      }
      if ((byte)(cVar4 - 1U) < 3) {
        lVar9 = lVar11 + 0x14e8;
      }
      if (((*(byte *)(lVar9 + 0x300) & 0x10) == 0) && (*(char *)(lVar3 + 1 + uVar15 * 4) == '\n')) {
        cVar5 = '\0';
      }
    }
  }
  return cVar5;
}

