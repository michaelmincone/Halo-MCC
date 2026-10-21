/* REA evidence: ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5; source: loophole-batch.json */

void FUN_18006f070(longlong param_1,int param_2,longlong param_3)

{
  longlong lVar1;
  undefined4 *puVar2;
  undefined1 uVar3;
  char cVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int iVar7;
  undefined4 uVar8;
  undefined8 *puVar9;
  byte bVar10;
  longlong lVar11;
  byte bVar12;
  longlong lVar13;
  ulonglong uVar14;
  
  lVar13 = (longlong)param_2 * 0x4c;
  uVar14 = param_3 + 0x14bU & 0xfffffffffffffffc;
  lVar11 = (longlong)*(short *)(lVar13 + 0x14fe + param_1);
  *(int *)(param_3 + 0x1a0) = (int)*(short *)(lVar13 + 0x1540 + param_1);
  bVar12 = *(byte *)(lVar13 + 0x1542 + param_1);
  lVar1 = param_1 + lVar11 * 2;
  bVar10 = bVar12 >> 2 & 1;
  if (bVar10 == (bVar12 >> 3 & 1)) {
    iVar7 = 0;
  }
  else {
    iVar7 = (bVar10 ^ 1) + 1;
  }
  *(int *)(uVar14 + 0x20) = iVar7;
  if (*(char *)(lVar13 + 0x1546 + param_1) != -1) {
    *(byte *)(param_3 + 0x74) = *(byte *)(param_3 + 0x74) | 1;
    puVar9 = (undefined8 *)FUN_18006bfb0((int)*(char *)(lVar13 + 0x1546 + param_1));
    *(undefined8 *)(param_3 + 0x78) = *puVar9;
    *(undefined4 *)(param_3 + 0x80) = *(undefined4 *)(puVar9 + 1);
  }
  *(undefined1 *)(uVar14 + 0x25) = *(undefined1 *)(lVar13 + 0x1543 + param_1);
  *(undefined1 *)(uVar14 + 0x28) = *(undefined1 *)(lVar13 + 0x153d + param_1);
  *(undefined1 *)(uVar14 + 0x29) = *(undefined1 *)(lVar11 + 0xd640 + lVar1);
  *(undefined1 *)(uVar14 + 0x2a) = *(undefined1 *)(lVar11 + 0xd641 + lVar1);
  bVar12 = *(byte *)(uVar14 + 0x2b) | 1;
  if ((*(byte *)(lVar13 + 0x1542 + param_1) & 1) == 0) {
    bVar12 = *(byte *)(uVar14 + 0x2b) & 0xfe;
  }
  *(byte *)(uVar14 + 0x2b) = bVar12;
  bVar10 = bVar12 | 2;
  if ((*(byte *)(lVar13 + 0x1542 + param_1) & 2) == 0) {
    bVar10 = bVar12 & 0xfd;
  }
  *(byte *)(uVar14 + 0x2b) = bVar10;
  bVar12 = bVar10 | 4;
  if ((*(byte *)(lVar13 + 0x1542 + param_1) & 0x20) == 0) {
    bVar12 = bVar10 & 0xfb;
  }
  *(byte *)(uVar14 + 0x2b) = bVar12;
  bVar10 = bVar12 | 8;
  if ((*(byte *)(lVar13 + 0x1542 + param_1) & 0x10) == 0) {
    bVar10 = bVar12 & 0xf7;
  }
  *(byte *)(uVar14 + 0x2b) = bVar10;
  *(ushort *)(uVar14 + 0x2c) = (ushort)*(byte *)(lVar13 + 0x153e + param_1);
  puVar2 = (undefined4 *)(lVar13 + 0x152c + param_1);
  uVar8 = puVar2[1];
  uVar5 = puVar2[2];
  uVar6 = puVar2[3];
  *(undefined4 *)(uVar14 + 0x30) = *puVar2;
  *(undefined4 *)(uVar14 + 0x34) = uVar8;
  *(undefined4 *)(uVar14 + 0x38) = uVar5;
  *(undefined4 *)(uVar14 + 0x3c) = uVar6;
  uVar3 = *(undefined1 *)(lVar13 + 0x153c + param_1);
  *(undefined4 *)(uVar14 + 0x44) = 0;
  *(undefined1 *)(uVar14 + 0x40) = uVar3;
  *(undefined2 *)(uVar14 + 0x42) = 0;
  cVar4 = *(char *)(lVar13 + 0x153f + param_1);
  if ('\v' < cVar4) {
    if (cVar4 < '\x0f') {
      *(undefined1 *)(uVar14 + 0x42) = *(undefined1 *)(lVar13 + 0x1544 + param_1);
      *(undefined1 *)(uVar14 + 0x43) = *(undefined1 *)(lVar13 + 0x1545 + param_1);
    }
    else if (cVar4 == '\x13') {
      uVar8 = FUN_180122aa4(*(undefined1 *)(lVar13 + 0x1544 + param_1));
      *(undefined4 *)(uVar14 + 0x44) = uVar8;
    }
  }
  return;
}

