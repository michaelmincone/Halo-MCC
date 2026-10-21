/* REA evidence: ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5; source: loophole-batch.json */

void FUN_18006cd14(longlong param_1,undefined8 param_2,undefined8 param_3,undefined1 param_4)

{
  short sVar1;
  longlong lVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  longlong lVar5;
  longlong lVar6;
  undefined8 uVar7;
  byte bVar8;
  char cVar9;
  undefined2 uVar10;
  undefined4 uVar11;
  int iVar12;
  int iVar13;
  undefined **ppuVar14;
  bool bVar15;
  
  uVar7 = DAT_184e2fcc0;
  lVar5 = DAT_180c1a230;
  DAT_184e2fcc0 = param_1;
  FUN_18006c080(param_1,*(undefined4 *)(DAT_180c1a230 + 0x10),param_3,param_4,0xfffffffffffffffe);
  lVar2 = *(longlong *)
           (*(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8) + 0x48);
  uVar11 = *(undefined4 *)(lVar2 + 0x40);
  uVar3 = *(undefined4 *)(lVar2 + 0x44);
  uVar4 = *(undefined4 *)(lVar2 + 0x48);
  *(undefined4 *)(param_1 + 0x2b8) = *(undefined4 *)(lVar2 + 0x3c);
  *(undefined4 *)(param_1 + 700) = uVar11;
  *(undefined4 *)(param_1 + 0x2c0) = uVar3;
  *(undefined4 *)(param_1 + 0x2c4) = uVar4;
  uVar11 = FUN_18009f4ec(0xffffffff,DAT_1825bda30 + 0x3a8,0x14);
  *(undefined4 *)(param_1 + 0x2ec) = uVar11;
  bVar8 = FUN_180071540();
  *(byte *)(param_1 + 0x2e9) = bVar8 ^ 1;
  uVar4 = DAT_180bfeb9c;
  uVar3 = DAT_180bfeb98;
  uVar11 = DAT_180bfeb94;
  *(undefined4 *)(param_1 + 0x2c8) = DAT_180bfeb90;
  *(undefined4 *)(param_1 + 0x2cc) = uVar11;
  *(undefined4 *)(param_1 + 0x2d0) = uVar3;
  *(undefined4 *)(param_1 + 0x2d4) = uVar4;
  *(undefined8 *)(param_1 + 0x2d8) = DAT_180bfeba0;
  lVar6 = DAT_180c1a230;
  uVar11 = FUN_18006bd5c(DAT_180c1a230);
  *(undefined4 *)(param_1 + 0x2f0) = uVar11;
  *(int *)(param_1 + 0x2e0) = (int)*(float *)(lVar6 + 0x38);
  uVar10 = FUN_18006c710(lVar6);
  *(undefined2 *)(param_1 + 0x2b2) = uVar10;
  cVar9 = FUN_180071540();
  if (cVar9 == '\0') {
    bVar15 = true;
  }
  else {
    bVar15 = *(char *)(lVar2 + 0x11) != '\x04';
  }
  iVar13 = 0;
  ppuVar14 = &PTR_PTR_180a52540;
  do {
    if ((1 << ((byte)iVar13 & 0x1f) & 0x5ceU) != 0) {
      sVar1 = *(short *)(*ppuVar14 + 0xe);
      iVar12 = 0;
      if (0 < *(int *)(sVar1 + lVar5)) {
        do {
          FUN_18006daf4(param_1,iVar13,iVar12,bVar15);
          iVar12 = iVar12 + 1;
        } while (iVar12 < *(int *)(sVar1 + lVar5));
      }
    }
    iVar13 = iVar13 + 1;
    ppuVar14 = ppuVar14 + 1;
  } while (iVar13 < 0xe);
  DAT_184e2fcc0 = uVar7;
  return;
}

