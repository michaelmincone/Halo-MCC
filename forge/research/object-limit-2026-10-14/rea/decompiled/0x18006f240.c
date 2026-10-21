/* REA evidence: ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3; source: respawn-eligibility-batch.json */

void FUN_18006f240(longlong param_1,ulonglong param_2)

{
  longlong lVar1;
  undefined4 *puVar2;
  byte bVar3;
  uint uVar4;
  ushort *puVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  void *pvVar8;
  undefined4 uVar9;
  byte bVar10;
  char cVar11;
  ushort uVar12;
  ushort uVar13;
  undefined4 *puVar14;
  longlong lVar15;
  ulonglong uVar16;
  short local_res10 [4];
  
  pvVar8 = ThreadLocalStoragePointer;
  uVar16 = (ulonglong)_tls_index;
  puVar5 = *(ushort **)
            (*(longlong *)
              (*(longlong *)(*(longlong *)((longlong)ThreadLocalStoragePointer + uVar16 * 8) + 0x10)
              + 0x50) + 0x10 + (param_2 & 0xffff) * 0x18);
  puVar14 = (undefined4 *)((longlong)(short)puVar5[0xc9] + (longlong)puVar5);
  lVar15 = (longlong)(short)puVar5[0xe] * 0x4c;
  uVar9 = FUN_180071238(param_2 & 0xffffffff);
  FUN_18007130c(param_2 & 0xffffffff,uVar9);
  FUN_18006e3fc(param_1,param_2 & 0xffffffff);
  *(ushort *)(puVar14 + 8) = (ushort)*(byte *)(lVar15 + 0x153e + param_1);
  puVar2 = (undefined4 *)(lVar15 + 0x152c + param_1);
  uVar9 = puVar2[1];
  uVar6 = puVar2[2];
  uVar7 = puVar2[3];
  *puVar14 = *puVar2;
  puVar14[1] = uVar9;
  puVar14[2] = uVar6;
  puVar14[3] = uVar7;
  *(undefined1 *)(puVar14 + 4) = *(undefined1 *)(lVar15 + 0x153c + param_1);
  puVar14[0x21] = (int)*(short *)(lVar15 + 0x1540 + param_1);
  uVar12 = *(ushort *)((longlong)puVar14 + 0x12) | 0x80;
  if ((*(byte *)(lVar15 + 0x1542 + param_1) & 1) == 0) {
    uVar12 = *(ushort *)((longlong)puVar14 + 0x12) & 0xff7f;
  }
  *(ushort *)((longlong)puVar14 + 0x12) = uVar12;
  uVar13 = uVar12 | 0x100;
  if ((*(byte *)(lVar15 + 0x1542 + param_1) & 2) == 0) {
    uVar13 = uVar12 & 0xfeff;
  }
  *(ushort *)((longlong)puVar14 + 0x12) = uVar13;
  uVar12 = uVar13 | 0x200;
  if ((*(byte *)(lVar15 + 0x1542 + param_1) & 0x10) == 0) {
    uVar12 = uVar13 & 0xfdff;
  }
  *(ushort *)((longlong)puVar14 + 0x12) = uVar12;
  uVar13 = uVar12 | 0x400;
  if ((*(byte *)(lVar15 + 0x1542 + param_1) & 0x20) == 0) {
    uVar13 = uVar12 & 0xfbff;
  }
  *(ushort *)((longlong)puVar14 + 0x12) = uVar13;
  bVar3 = *(byte *)(lVar15 + 0x1542 + param_1);
  bVar10 = bVar3 >> 2 & 1;
  if (bVar10 == (bVar3 >> 3 & 1)) {
    cVar11 = '\0';
  }
  else {
    cVar11 = (bVar10 ^ 1) + 1;
  }
  *(char *)((longlong)puVar14 + 0x17) = cVar11;
  *(undefined1 *)((longlong)puVar14 + 0x1a) = *(undefined1 *)(lVar15 + 0x153d + param_1);
  *(undefined1 *)((longlong)puVar14 + 0x1d) = 0xff;
  FUN_1804b2010(puVar14,param_2 & 0xffffffff);
  *(undefined1 *)((longlong)puVar14 + 0x15) = 0;
  FUN_1804b2cdc(param_2 & 0xffffffff);
  cVar11 = *(char *)(lVar15 + 0x153f + param_1);
  if (cVar11 == '\x01') {
    if (*(char *)(*(longlong *)
                   (*(longlong *)(*(longlong *)((longlong)pvVar8 + uVar16 * 8) + 0x10) + 0x50) + 4 +
                 (param_2 & 0xffff) * 0x18) == '\x02') {
      uVar4 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)*puVar5 * 8);
      if ((0 < *(int *)((&DAT_184e39f20)[uVar4 >> 0x1c] + 0x3f0 + (ulonglong)uVar4 * 4)) &&
         (uVar4 = *(uint *)((&DAT_184e39f20)[uVar4 >> 0x1c] + 0x3f4 + (ulonglong)uVar4 * 4),
         lVar1 = (&DAT_184e39f20)[uVar4 >> 0x1c] + (ulonglong)uVar4 * 4, lVar1 != 0)) {
        local_res10[1] = 0;
        local_res10[0] = (*(byte *)(lVar15 + 0x1544 + param_1) + 1) * *(short *)(lVar1 + 10);
        FUN_1804bd0cc(param_2 & 0xffffffff,local_res10);
      }
    }
  }
  else if ('\v' < cVar11) {
    if (cVar11 < '\x0f') {
      *(undefined1 *)((longlong)puVar14 + 0x15) = *(undefined1 *)(lVar15 + 0x1544 + param_1);
      *(undefined1 *)((longlong)puVar14 + 0x16) = *(undefined1 *)(lVar15 + 0x1545 + param_1);
    }
    else if (cVar11 == '\x13') {
      *(undefined1 *)((longlong)puVar14 + 0x1d) = *(undefined1 *)(lVar15 + 0x1544 + param_1);
    }
  }
  cVar11 = FUN_180071540();
  if (cVar11 != '\0') {
    FUN_180070f04(param_2 & 0xffffffff);
  }
  return;
}

