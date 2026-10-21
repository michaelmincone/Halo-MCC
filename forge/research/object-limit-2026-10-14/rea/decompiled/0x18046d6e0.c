/* REA evidence: ev_03242fd474b5bfd9b5cd7476c32d52800dcc224d1278510d1e91a9608ac3e0c2; source: object-creation-batch.json */

ulonglong FUN_18046d6e0(ushort *param_1)

{
  int *piVar1;
  uint *puVar2;
  byte *pbVar3;
  longlong lVar4;
  ushort *puVar5;
  uint uVar6;
  longlong lVar7;
  undefined *puVar8;
  longlong lVar9;
  longlong lVar10;
  bool bVar11;
  bool bVar12;
  char cVar13;
  char cVar14;
  byte bVar15;
  char cVar16;
  ushort uVar17;
  undefined2 uVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  undefined4 uVar22;
  longlong lVar23;
  longlong lVar24;
  undefined4 *puVar25;
  ulonglong uVar26;
  longlong *plVar27;
  short sVar28;
  ulonglong uVar29;
  longlong *plVar30;
  uint uVar31;
  ulonglong uVar32;
  ulonglong uVar33;
  ulonglong uVar34;
  ulonglong uVar35;
  undefined2 uVar36;
  longlong lVar37;
  int iVar38;
  longlong lVar39;
  undefined8 uVar40;
  ushort *puVar41;
  uint uVar42;
  char cVar43;
  char local_res8;
  undefined1 uStackX_9;
  byte local_res10;
  char local_res18;
  char local_res20;
  ulonglong in_stack_ffffffffffffff38;
  char local_97;
  int local_94;
  char local_88;
  int local_68;
  
  if (((*(uint *)(param_1 + 0xc) >> 4 & 1) == 0) && (*(int *)param_1 != -1)) {
    FUN_1804ee4a0();
  }
  lVar37 = 0;
  uVar26 = 0xffffffff;
  if (((*(int *)param_1 == -1) || (cVar14 = FUN_18008f620(*(undefined4 *)param_1), cVar14 == '\0'))
     || (uVar26 = 0xffffffff, *(int *)param_1 == -1)) goto LAB_18046e86e;
  uVar19 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)*param_1 * 8);
  uVar32 = (ulonglong)uVar19;
  uVar35 = (ulonglong)uVar19;
  lVar7 = (&DAT_184e39f20)[uVar19 >> 0x1c];
  puVar8 = (&PTR_PTR_180a52540)[*(short *)(lVar7 + uVar32 * 4)];
  if (*(int *)(lVar7 + (uVar35 * 2 + 0x38) * 2) != -1) {
    uVar19 = *(uint *)(DAT_180c1a600 + 4 +
                      (ulonglong)*(ushort *)(lVar7 + (uVar35 * 2 + 0x38) * 2) * 8);
    lVar37 = (&DAT_184e39f20)[uVar19 >> 0x1c] + (ulonglong)uVar19 * 4;
  }
  uVar19 = FUN_180475064(*(undefined2 *)(puVar8 + 0xc));
  uVar26 = (ulonglong)uVar19;
  if (uVar19 == 0xffffffff) goto LAB_18046e86e;
  lVar9 = *(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8);
  uVar33 = uVar26 & 0xffff;
  lVar10 = *(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50);
  puVar25 = *(undefined4 **)(lVar10 + 0x10 + uVar33 * 0x18);
  if ((int)*(char *)(*(longlong *)(lVar9 + 0x48) + 0x11) - 4U < 2) {
    lVar23 = FUN_1803cc6ec(*(undefined4 *)param_1);
    local_res20 = '\x01';
    if (lVar23 == 0) goto LAB_18046d84b;
  }
  else {
LAB_18046d84b:
    local_res20 = '\0';
  }
  local_res18 = '\0';
  local_res10 = 0;
  local_97 = '\0';
  puVar5 = (ushort *)(lVar10 + 2 + uVar33 * 0x18);
  *puVar5 = *puVar5 | 0x10;
  *(undefined1 *)(lVar10 + 4 + uVar33 * 0x18) = *(undefined1 *)(lVar7 + uVar35 * 4);
  puVar25[1] = puVar25[1] | 4;
  *puVar25 = *(undefined4 *)param_1;
  local_88 = '\0';
  cVar13 = local_88;
  local_88 = '\0';
  cVar14 = local_88;
  local_88 = '\0';
  local_68 = 2;
  lVar23 = *(longlong *)(lVar9 + 0x70);
  if (((lVar23 != 0) && (*(char *)(lVar23 + 2) != '\0')) &&
     (uVar29 = (ulonglong)(uVar19 & 0xffff), (uVar19 & 0xffff) < 0x800)) {
    if (*(uint *)((ulonglong)*(byte *)(lVar23 + 1) * 0x1a2b834 + uVar29 * 0x3410 + 4 + DAT_180c4d958
                 ) == uVar19) {
      *(undefined4 *)
       ((ulonglong)*(byte *)(lVar23 + 1) * 0x1a2b834 + uVar29 * 0x3410 + 4 + DAT_180c4d958) =
           0xffffffff;
    }
    (&DAT_180c4d960)[uVar29] = 0;
    (&DAT_180c4f960)[uVar29] = 0;
  }
  *(undefined2 *)(puVar25 + 7) = 0xffff;
  puVar25[0x51] = 0xffffffff;
  puVar25[0x52] = 0xffffffff;
  puVar25[0x53] = 0xffffffff;
  puVar25[0x54] = 0xffffffff;
  puVar25[0x68] = 0xffffffff;
  puVar25[0x67] = 0xffffffff;
  puVar25[0x56] = 0xffffffff;
  if (*(char *)((longlong)param_1 + 0xb) == -1) {
    uVar18 = *(undefined2 *)(lVar7 + uVar35 * 4);
    lVar23 = *(longlong *)(lVar9 + 0x140);
    piVar1 = (int *)(lVar23 + 0xc);
    *piVar1 = *piVar1 + 1;
    *(char *)((longlong)puVar25 + 0x8e) = (char)uVar18;
    *(undefined1 *)((longlong)puVar25 + 0x8f) = 2;
    *(undefined2 *)(puVar25 + 0x23) = 0xffff;
    puVar25[0x22] = *(undefined4 *)(lVar23 + 0xc);
    uVar17 = 0xffff;
  }
  else {
    *(undefined8 *)(puVar25 + 0x22) = *(undefined8 *)(param_1 + 2);
    uVar17 = param_1[8];
  }
  *(ushort *)((longlong)puVar25 + 0x1a) = uVar17;
  puVar2 = (uint *)(param_1 + 0xc);
  *(undefined8 *)(puVar25 + 0x11) = *(undefined8 *)(param_1 + 0xe);
  puVar25[0x13] = *(undefined4 *)(param_1 + 0x12);
  *(undefined8 *)(puVar25 + 0x14) = *(undefined8 *)(param_1 + 0x14);
  puVar25[0x16] = *(undefined4 *)(param_1 + 0x18);
  *(undefined8 *)(puVar25 + 0x17) = *(undefined8 *)(param_1 + 0x1a);
  puVar25[0x19] = *(undefined4 *)(param_1 + 0x1e);
  *(undefined8 *)(puVar25 + 0x1a) = *(undefined8 *)(param_1 + 0x20);
  puVar25[0x1c] = *(undefined4 *)(param_1 + 0x24);
  *(undefined8 *)(puVar25 + 0x1d) = *(undefined8 *)(param_1 + 0x26);
  puVar25[0x1f] = *(undefined4 *)(param_1 + 0x2a);
  puVar25[0x20] = *(undefined4 *)(param_1 + 0x2c);
  puVar25[0x21] = *(undefined4 *)(param_1 + 0x2c);
  *(undefined2 *)(puVar25 + 0x3a) = 0xffff;
  if ((*puVar2 & 1) == 0) {
    uVar20 = puVar25[1] & 0xfffffdff;
  }
  else {
    uVar20 = puVar25[1] | 0x200;
  }
  puVar25[1] = uVar20;
  if ((lVar37 == 0) || (*(int *)(lVar37 + 0x1c) == -1)) {
    uVar20 = uVar20 & 0xfffffeff;
  }
  else {
    uVar20 = uVar20 | 0x100;
  }
  puVar25[1] = uVar20 & 0xbfffffff;
  if (*(char *)((longlong)puVar25 + 0x8f) == '\x05') {
    uVar20 = uVar20 & 0xbfffffff | 0x2000000;
  }
  else {
    uVar20 = uVar20 & 0xbdffffff;
  }
  puVar25[1] = uVar20;
  if (*(int *)(lVar7 + (uVar35 * 2 + 0x38) * 2) != -1) {
    uVar20 = *(uint *)(DAT_180c1a600 + 4 +
                      (ulonglong)*(ushort *)(lVar7 + (uVar35 * 2 + 0x38) * 2) * 8);
    if (*(int *)((&DAT_184e39f20)[uVar20 >> 0x1c] + 0xc + (ulonglong)uVar20 * 4) != -1) {
      uVar20 = *(uint *)(DAT_180c1a600 + 4 +
                        (ulonglong)
                        (*(uint *)((&DAT_184e39f20)[uVar20 >> 0x1c] + 0xc + (ulonglong)uVar20 * 4) &
                        0xffff) * 8);
      if ((0 < *(int *)((&DAT_184e39f20)[uVar20 >> 0x1c] + 0x20 + (ulonglong)uVar20 * 4)) &&
         (*(int *)((&DAT_184e39f20)[uVar20 >> 0x1c] + 0x1c + (ulonglong)uVar20 * 4) != -1)) {
        puVar25[1] = puVar25[1] | 0x400;
        goto LAB_18046daca;
      }
    }
    puVar25[1] = puVar25[1] & 0xfffffbff;
  }
LAB_18046daca:
  *(undefined2 *)(puVar25 + 2) = 0xffff;
  puVar25[0x25] = 0xffffffff;
  puVar25[0x2c] = 0xffffffff;
  puVar25[0x10] = 0xffffffff;
  *(char *)((longlong)puVar25 + 0x92) = (char)param_1[10];
  puVar25[5] = 0xffffffff;
  puVar25[3] = 0xffffffff;
  puVar25[4] = 0xffffffff;
  puVar25[0x41] = 0xffffffff;
  *(undefined2 *)(puVar25 + 0x24) = 0xffff;
  *(undefined1 *)((longlong)puVar25 + 0x13f) = 0xff;
  *(undefined1 *)((longlong)puVar25 + 0x141) = 0xff;
  *(undefined1 *)((longlong)puVar25 + 0x13e) = 0xff;
  *(undefined1 *)(puVar25 + 0x50) = 0xff;
  *(undefined1 *)((longlong)puVar25 + 0x142) = 0xff;
  puVar25[0x55] = 0xffffffff;
  FUN_1804716dc(uVar26,0);
  uVar20 = 1;
  FUN_180474df4(uVar19);
  uVar22 = 0xffffffff;
  uVar26 = 0;
  puVar25[0x37] = 0;
  bVar15 = (byte)uVar20;
  *(undefined1 *)((longlong)puVar25 + 0xea) = 0xff;
  puVar25[0x33] = 0xffffffff;
  puVar25[0x34] = 0xffffffff;
  puVar25[0x37] = (*(uint *)(lVar7 + (uVar35 * 2 + 2) * 2) >> 0xc & uVar20) << 0x17;
  if ((*(byte *)(lVar7 + (uVar35 * 2 + 1) * 2) & bVar15) == 0) {
    uVar21 = puVar25[0x37] & 0xfeffffff;
  }
  else {
    uVar21 = puVar25[0x37] | 0x1000000;
  }
  puVar25[0x37] = uVar21;
  if (((byte)(*puVar2 >> 3) & bVar15) == 0) {
    uVar21 = puVar25[0x37] & 0xfffffbff;
  }
  else {
    uVar21 = puVar25[0x37] | 0x400;
  }
  puVar25[0x37] = uVar21;
  *(undefined2 *)(puVar25 + 0x39) = 0x8000;
  *(undefined1 *)(puVar25 + 0x40) = 0;
  puVar25[0x3f] = 0xffffffff;
  *(undefined1 *)((longlong)puVar25 + 0x101) = 0xff;
  *(byte *)(puVar25 + 0x40) = ((byte)(*puVar2 >> 0xb) & bVar15) << 3;
  if (((byte)(*puVar2 >> 0xc) & bVar15) == 0) {
    bVar15 = *(byte *)(puVar25 + 0x40) & 0xdf;
  }
  else {
    bVar15 = *(byte *)(puVar25 + 0x40) | 0x20;
  }
  *(byte *)(puVar25 + 0x40) = bVar15;
  *(ushort *)(puVar25 + 0x42) = param_1[0x97];
  *(ushort *)((longlong)puVar25 + 0x10a) = param_1[0x98];
  FUN_18047c96c(uVar19);
  puVar25[0x5a] = uVar22;
  uVar21 = puVar25[1];
  uVar29 = (ulonglong)uVar20;
  cVar43 = (char)uVar26;
  local_94 = (int)uVar26;
  uVar35 = uVar32;
  lVar23 = lVar7;
  uVar42 = uVar20;
  local_res8 = cVar43;
  if (lVar37 == 0) {
LAB_18046de3b:
    cVar16 = FUN_180475194(uVar19,0x180,*(short *)(lVar23 + (uVar35 * 2 + 0x82) * 2) << 3,2);
    if (((cVar16 == '\0') ||
        (iVar38 = (uint)(ushort)((short)local_94 * 2) + local_94,
        cVar16 = FUN_180475194(uVar19,0x184,
                               CONCAT22((short)((uint)iVar38 >> 0x10),(short)iVar38 << 3),2),
        cVar16 == '\0')) ||
       (cVar16 = FUN_180475194(uVar19,0x188,*(short *)(lVar7 + (uVar32 * 2 + 0x9a) * 2) * 0x18,2),
       cVar16 == '\0')) {
LAB_18046df76:
      bVar11 = false;
    }
    else {
      cVar16 = FUN_180475194(uVar19,0x178,(longlong)(int)uVar42 * 0x34,2);
      if ((cVar16 == '\0') ||
         (cVar16 = FUN_180475194(uVar19,0x17c,
                                 (short)uVar29 * 6 + (short)((uVar21 >> 10 & uVar20) << 5),2),
         cVar16 == '\0')) goto LAB_18046df76;
      uVar36 = (undefined2)((longlong)(int)uVar42 << 5);
      uVar18 = uVar36;
      if (cVar43 == '\0') {
        uVar18 = 0;
      }
      cVar16 = FUN_180475194(uVar19,0x174,uVar18,4);
      if (cVar16 == '\0') goto LAB_18046df76;
      if (cVar43 == '\0') {
        uVar36 = 0;
      }
      cVar43 = FUN_180475194(uVar19,0x170,uVar36,4);
      if (cVar43 == '\0') goto LAB_18046df76;
      bVar11 = true;
    }
    bVar12 = true;
    if ((local_res20 != '\0') &&
       ((!bVar11 || (cVar43 = FUN_180475194(uVar19), bVar11 = bVar12, cVar43 == '\0')))) {
      bVar11 = false;
    }
    bVar15 = local_res10;
    sVar28 = 0;
    if (local_res18 != '\0') {
      if (local_res10 == 0) {
        sVar28 = 0x250;
        uVar20 = *(uint *)(puVar8 + 0x18);
        if (3 < uVar20) goto LAB_18046e04e;
      }
      else {
        uVar20 = 3;
      }
      sVar28 = 0x250;
      if ((longlong)(int)uVar20 * 0x298 != -0x180b9cab0) {
        uVar21 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)*(ushort *)(lVar37 + 0x2c) * 8);
        local_68 = 2 - (uint)((*(byte *)((&DAT_184e39f20)[uVar21 >> 0x1c] + 0x11 +
                                        (ulonglong)uVar21 * 4) & 2) != 0);
        sVar28 = (short)local_68 *
                 (short)*(undefined4 *)(&DAT_180b9cab8 + (longlong)(int)uVar20 * 0x298) + 0x250;
      }
    }
LAB_18046e04e:
    if ((!bVar11) || (cVar43 = FUN_180475194(uVar19,0x18c,sVar28,3), cVar43 == '\0')) {
      bVar12 = false;
    }
    if (bVar12) {
      uVar40 = 0x88;
      if (*(int *)(lVar7 + (uVar32 * 2 + 0xa0) * 2) < 1) {
        uVar40 = 0;
      }
      cVar43 = FUN_180475194(uVar19,400,uVar40,2);
      if (cVar43 != '\0') {
        if (0 < local_94) {
          lVar23 = *(longlong *)
                    (*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 + uVar33 * 0x18);
          iVar38 = (int)((ulonglong)(longlong)*(short *)(lVar23 + 0x184) / 0x18);
          lVar24 = (longlong)iVar38;
          if (0 < iVar38) {
            puVar25 = (undefined4 *)((longlong)*(short *)(lVar23 + 0x186) + 0x14 + lVar23);
            do {
              *puVar25 = 0xffffffff;
              puVar25 = puVar25 + 6;
              lVar24 = lVar24 + -1;
            } while (lVar24 != 0);
          }
          if (iVar38 != local_94) goto LAB_18046e197;
        }
        cVar43 = FUN_180475194(uVar19,0x198,*(short *)(lVar7 + (uVar32 * 2 + 0x7c) * 2) * 0xc,2);
        if (cVar43 != '\0') {
          cVar43 = '\x01';
          cVar16 = FUN_18009a8c0(0xffffffffffffffff);
          uVar26 = 0;
          if (cVar16 != '\0') {
            cVar43 = *(int *)(DAT_180c519b8 + 0x48) < *(int *)(DAT_180c519b8 + 0x2c);
          }
          goto LAB_18046e1a5;
        }
      }
    }
LAB_18046e197:
    uVar26 = 0;
    cVar43 = '\0';
  }
  else {
    uVar6 = *(uint *)(lVar37 + 300);
    lVar24 = (longlong)(int)uVar6;
    cVar16 = (char)uVar20;
    local_res8 = cVar16;
    if (((int)uVar20 <= (int)uVar6) && (uVar42 = uVar6, local_res8 = cVar43, 0 < (int)uVar6)) {
      lVar39 = 0;
      uVar26 = uVar26 & 0xffffffff;
      do {
        lVar4 = (ulonglong)*(uint *)(lVar37 + 0x130) + lVar39;
        lVar39 = lVar39 + 0x17;
        uVar34 = (ulonglong)((int)uVar26 + 1);
        if (*(short *)((&DAT_184e39f20)[*(uint *)(lVar37 + 0x130) >> 0x1c] + 4 + lVar4 * 4) != -1) {
          uVar34 = uVar26;
        }
        lVar24 = lVar24 - uVar29;
        uVar26 = uVar34;
      } while (lVar24 != 0);
      if ((int)uVar20 < (int)uVar34) {
        local_res8 = cVar16;
      }
      uVar26 = 0;
    }
    if ((int)uVar20 <= (int)*(uint *)(lVar37 + 0x120)) {
      uVar29 = (ulonglong)*(uint *)(lVar37 + 0x120);
      cVar16 = local_res8;
    }
    local_res8 = cVar16;
    if (local_res8 == '\0') {
      iVar38 = *(int *)(lVar7 + (uVar32 * 2 + 0x38) * 2);
      local_94 = FUN_18049db14();
      if ((*(int *)(lVar37 + 0x2c) != -1) &&
         ((cVar16 = FUN_18013790c(*(undefined4 *)(lVar37 + 0x2c),iVar38), cVar16 != '\0' ||
          (iVar38 == -1)))) {
        uVar31 = 1 << (*(byte *)(lVar23 + uVar35 * 4) & 0x1f);
        cVar43 = (uVar31 & 0x2220) == 0;
        local_res18 = '\x01';
        uVar6 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)*(ushort *)(lVar37 + 0x2c) * 8);
        lVar24 = (&DAT_184e39f20)[uVar6 >> 0x1c] + (ulonglong)uVar6 * 4;
        if (lVar24 != 0) {
          local_res10 = *(byte *)(lVar24 + 0x11) >> 3 & 1;
        }
        if (((uVar31 & 400) != 0) &&
           (uVar6 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)*param_1 * 8),
           (*(byte *)((&DAT_184e39f20)[uVar6 >> 0x1c] + 0x168 + (ulonglong)uVar6 * 4) & 4) != 0)) {
          cVar43 = '\x01';
        }
      }
      goto LAB_18046de3b;
    }
    cVar43 = (char)uVar26;
    bVar15 = local_res10;
  }
LAB_18046e1a5:
  lVar23 = *(longlong *)(*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 + uVar33 * 0x18);
  if (cVar43 == '\0') {
    bVar11 = false;
    cVar14 = '\0';
  }
  else {
    if (local_res20 != (char)uVar26) {
      memset((void *)(*(short *)(lVar23 + 0x196) + lVar23),0,100);
      uVar26 = 0;
    }
    if (local_res18 != (char)uVar26) {
      lVar24 = *(short *)(lVar23 + 0x18e) + lVar23;
      if (bVar15 == 0) {
        iVar38 = *(int *)(puVar8 + 0x18);
        if (iVar38 != -1) goto LAB_18046e221;
      }
      else {
        iVar38 = 3;
LAB_18046e221:
        uVar26 = 0x250;
      }
      FUN_1801377cc(lVar24,uVar19,0xffffffff,iVar38,uVar26,local_68);
      in_stack_ffffffffffffff38 = uVar26;
      FUN_180137960(lVar24,*(undefined4 *)(lVar37 + 0x2c),
                    *(undefined4 *)(lVar7 + (uVar32 * 2 + 0x38) * 2),1);
      uVar26 = 0;
    }
    iVar38 = (int)uVar26;
    local_88 = cVar14;
    if (iVar38 < *(int *)(lVar7 + (uVar32 * 2 + 0xa0) * 2)) {
      uVar20 = *(uint *)(lVar7 + (uVar32 * 2 + 0xa2) * 2);
      lVar37 = *(short *)(lVar23 + 0x192) + lVar23;
      FUN_1804b20dc(lVar37,0x180000000,(&DAT_184e39f20)[uVar20 >> 0x1c] + (ulonglong)uVar20 * 4,
                    (longlong)param_1 + 0x14bU & 0xfffffffffffffffc);
      local_97 = '\x01';
      *(undefined4 *)(lVar37 + 0x84) = *(undefined4 *)(param_1 + 0xd0);
      local_88 = cVar13;
      if ((*(byte *)(lVar37 + 0x12) & 1) != 0) {
        local_97 = '\x01';
        cVar14 = FUN_180071540();
        local_88 = '\0';
        if (cVar14 == '\0') {
          local_88 = local_97;
        }
      }
      iVar38 = 0;
      puVar25 = (undefined4 *)(lVar37 + 0x44);
      for (lVar24 = 0x10; lVar24 != 0; lVar24 = lVar24 + -1) {
        *puVar25 = 0xffffffff;
        puVar25 = puVar25 + 1;
      }
    }
    if (iVar38 < *(int *)(lVar7 + (uVar32 * 2 + 0x82) * 2)) {
      memset((void *)(*(short *)(lVar23 + 0x182) + lVar23),-1,
             (longlong)(int)((ulonglong)(longlong)*(short *)(lVar23 + 0x180) >> 3) << 3);
    }
    cVar14 = FUN_1804ee518(uVar19,param_1);
    bVar11 = true;
    lVar23 = *(longlong *)(*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 + uVar33 * 0x18)
    ;
  }
  if (*(int *)(param_1 + 0x30) != -1) {
    uVar22 = FUN_180473dc0();
    FUN_1804b10f4(uVar22,uVar19);
  }
  if (cVar14 == '\0') {
    FUN_18017ba88(uVar19);
    if (bVar11) {
      FUN_1804ee830(uVar19);
    }
    FUN_180475128(uVar19);
    uVar26 = 0xffffffffffffffff;
    goto LAB_18046e86e;
  }
  uVar20 = *(uint *)(lVar23 + 4);
  if ((param_1[0xc] & 6) != 0) {
    *(uint *)(lVar23 + 4) = uVar20 & 0xfffeffff;
  }
  puVar5 = *(ushort **)(*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 + uVar33 * 0x18);
  uVar21 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)*puVar5 * 8);
  if (((*(uint *)((&DAT_184e39f20)[uVar21 >> 0x1c] + 4 + (ulonglong)uVar21 * 4) >> 6 & 1) != 0) &&
     (lVar37 = *(longlong *)(lVar9 + 0x1f8), *(int *)(lVar37 + 0x2680) < 0x20)) {
    puVar2 = (uint *)(puVar5 + 0x6e);
    *puVar2 = *puVar2 | 1;
    *(uint *)(lVar37 + 0x2600 + (longlong)*(int *)(lVar37 + 0x2680) * 4) = uVar19;
    *(int *)(lVar37 + 0x2680) = *(int *)(lVar37 + 0x2680) + 1;
  }
  if ((*(char *)(*(longlong *)(lVar9 + 0x48) + 0x10) != '\x03') &&
     (*(char *)(*(longlong *)(lVar9 + 0x48) + 0x11) != '\x04')) {
    lVar37 = *(longlong *)(*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 + uVar33 * 0x18)
    ;
    sVar28 = *(short *)(lVar37 + 0x1a);
    if (sVar28 != -1) {
      iVar38 = *(int *)(*(longlong *)(lVar9 + 0x140) + 0x18 + (longlong)*(char *)(lVar37 + 0x8e) * 4
                       );
      if (iVar38 != -1) {
        *(uint *)(*(longlong *)(lVar9 + 0x140) + 0x50 + (longlong)(sVar28 + iVar38) * 4) = uVar19;
      }
    }
  }
  FUN_180472c20(uVar19,*(undefined4 *)(param_1 + 6));
  FUN_180472c68(uVar19,param_1[0x96],param_1 + 0x56,*(undefined4 *)(param_1 + 0x54));
  FUN_180479d08(uVar19,(char)param_1[0x3a],param_1 + 0x3c);
  FUN_18049ea74(uVar19,0,0);
  FUN_18047a57c(uVar19);
  if (*(short *)(*(longlong *)
                  (*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 + uVar33 * 0x18) + 0x18e
                ) != -1) {
    FUN_1804727b8(uVar19);
  }
  FUN_18046c854(uVar19);
  cVar14 = FUN_18046d348();
  if (cVar14 == '\0') {
    if (*(short *)(*(longlong *)
                    (*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 + uVar33 * 0x18) +
                  0x176) != -1) {
      FUN_180476f1c(uVar19);
    }
    FUN_180476e50();
  }
  if ((*(char **)(lVar9 + 0x140) == (char *)0x0) || (**(char **)(lVar9 + 0x140) == '\0')) {
    bVar11 = false;
  }
  else {
    bVar11 = true;
  }
  if (bVar11) {
    puVar5 = param_1 + 0x9c;
    cVar14 = (char)*puVar5;
    if (cVar14 == -1) {
      FUN_18047b7c0(uVar19,puVar5);
      cVar14 = (char)*puVar5;
    }
    puVar41 = (ushort *)0x0;
    if (cVar14 != -1) {
      puVar41 = puVar5;
    }
    FUN_18046f2d8(uVar19,0,puVar41);
  }
  FUN_18009ac84(uVar19,0,0);
  if ((*(uint *)(param_1 + 0xc) >> 5 & 1) == 0) {
    uVar21 = *(uint *)(lVar23 + 0xdc) & 0xfffffffd;
  }
  else {
    uVar21 = *(uint *)(lVar23 + 0xdc) | 2;
  }
  *(uint *)(lVar23 + 0xdc) = uVar21;
  FUN_18046f75c(uVar19);
  if (*(char *)(*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 4 + uVar33 * 0x18) != '\x05') {
    FUN_1804dbcc8(uVar19);
  }
  FUN_18047aae8(uVar19);
  FUN_1804ee780(uVar19,param_1 + 0xc);
  iVar38 = *(int *)(lVar7 + (uVar32 * 2 + 0x5e) * 2);
  if (iVar38 != -1) {
    local_res8 = '\0';
    uStackX_9 = 0;
    FUN_1801177a0(iVar38,param_1 + 0x34,&local_res8,uVar19,
                  in_stack_ffffffffffffff38 & 0xffffffff00000000,0,0,0,1);
  }
  puVar2 = (uint *)(param_1 + 0xc);
  if ((*puVar2 >> 9 & 1) != 0) {
    FUN_1801223d0(uVar19);
    pbVar3 = (byte *)(*(longlong *)
                       (*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 + uVar33 * 0x18) +
                     0x100);
    *pbVar3 = *pbVar3 | 0x10;
  }
  if ((uVar20 & 0x10000) == 0) {
    uVar20 = *(uint *)(lVar23 + 4) & 0xfffeffff;
  }
  else {
    uVar20 = *(uint *)(lVar23 + 4) | 0x10000;
  }
  *(uint *)(lVar23 + 4) = uVar20;
  if (*(int *)(param_1 + 0x9e) != -1) {
    FUN_180470998(*(int *)(param_1 + 0x9e),*(undefined4 *)(param_1 + 0xa0),uVar19,
                  *(undefined4 *)(param_1 + 0xa2));
  }
  plVar30 = (longlong *)0x0;
  bVar11 = true;
  if (local_88 != '\0') {
    FUN_1804716dc(uVar19,1);
    FUN_1804717b0(uVar19,1);
  }
  if (local_97 != '\0') {
    iVar38 = *(int *)(*(longlong *)(lVar9 + 0x20) + 0x841c);
    plVar27 = plVar30;
    if (iVar38 - 1U < 4) {
      plVar27 = *(longlong **)(&DAT_180b95f78 + (longlong)iVar38 * 8);
    }
    if (plVar27 != (longlong *)0x0) {
      if (iVar38 - 1U < 4) {
        plVar30 = *(longlong **)(&DAT_180b95f78 + (longlong)iVar38 * 8);
      }
      (**(code **)(*plVar30 + 0x170))(plVar30,uVar19);
    }
  }
  if (((*(uint *)(lVar23 + 4) & 0x10000) == 0) || ((*(byte *)(lVar10 + 2 + uVar33 * 0x18) & 1) != 0)
     ) {
LAB_18046e79e:
    *(uint *)(lVar23 + 4) = *(uint *)(lVar23 + 4) & 0xfffffffb;
    FUN_18046e884(uVar19);
    if ((local_res18 != '\0') && (lVar37 = *(short *)(lVar23 + 0x18e) + lVar23, lVar37 != 0)) {
      FUN_1801374f4(lVar37,uVar19);
    }
    uVar20 = *(uint *)(lVar23 + 0x10);
    while (uVar20 != 0xffffffff) {
      lVar37 = *(longlong *)
                (*(longlong *)(*(longlong *)(lVar9 + 0x10) + 0x50) + 0x10 +
                (ulonglong)(uVar20 & 0xffff) * 0x18);
      if (*(short *)(lVar37 + 0x18e) != -1) {
        FUN_1801374f4(*(short *)(lVar37 + 0x18e) + lVar37,uVar20);
      }
      uVar20 = *(uint *)(lVar37 + 0xc);
    }
    uVar26 = (ulonglong)uVar19;
    if ((((byte)((uint)*(undefined4 *)(lVar23 + 4) >> 0x19) & 1) == 0) && ((*puVar2 >> 10 & 1) == 0)
       ) {
      FUN_1803a6310(uVar26);
    }
  }
  else {
    if ((*(char **)(lVar9 + 0x140) == (char *)0x0) || (**(char **)(lVar9 + 0x140) == '\0')) {
      bVar11 = false;
    }
    if (((!bVar11) || ((*puVar2 >> 1 & 1) != 0)) ||
       (((*puVar2 >> 2 & 1) != 0 && (*(char *)(lVar23 + 8) == -1)))) goto LAB_18046e79e;
    FUN_18017ba88(uVar19);
    FUN_18046f2a4(uVar19);
    uVar26 = 0xffffffff;
  }
  if ((*puVar2 >> 0xc & 1) != 0) {
    FUN_180474868(uVar26,1);
  }
LAB_18046e86e:
  return uVar26 & 0xffffffff;
}

