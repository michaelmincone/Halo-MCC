/* REA evidence: ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3; source: respawn-eligibility-batch.json */

ulonglong FUN_18017c094(longlong param_1)

{
  ushort uVar1;
  longlong lVar2;
  bool bVar3;
  char cVar4;
  longlong *plVar5;
  ulonglong uVar6;
  uint uVar7;
  ushort *puVar8;
  int iVar9;
  longlong *plVar10;
  longlong lVar11;
  int iVar12;
  int iVar13;
  
  lVar2 = *(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8);
  uVar6 = *(ulonglong *)(lVar2 + 0x48);
  if (*(char *)(uVar6 + 0x11) != '\x04') {
    plVar10 = (longlong *)0x0;
    iVar12 = *(int *)(*(longlong *)(lVar2 + 0x20) + 0x841c);
    plVar5 = plVar10;
    if (iVar12 - 1U < 4) {
      plVar5 = *(longlong **)(&DAT_180b95f78 + (longlong)iVar12 * 8);
    }
    uVar6 = 0;
    if (plVar5 != (longlong *)0x0) {
      plVar5 = plVar10;
      if (iVar12 - 1U < 4) {
        plVar5 = *(longlong **)(&DAT_180b95f78 + (longlong)iVar12 * 8);
      }
      uVar6 = (**(code **)(*plVar5 + 0x318))();
      if ((char)uVar6 != '\0') {
        iVar13 = (int)*(short *)(*(longlong *)(lVar2 + 0xa0) + 6);
        iVar12 = *(int *)(*(longlong *)(lVar2 + 0xa0) + 0xc) % iVar13;
        plVar5 = plVar10;
        lVar11 = param_1;
        do {
          if ((int)plVar5 % iVar13 == iVar12) {
            FUN_18017bb54(lVar11);
          }
          uVar7 = (int)plVar5 + 1;
          plVar5 = (longlong *)(ulonglong)uVar7;
          lVar11 = lVar11 + 0x10;
        } while ((int)uVar7 < 0x2cb);
        puVar8 = (ushort *)(param_1 + 0x2cb4);
        do {
          iVar9 = (int)plVar10;
          uVar6 = (longlong)iVar9 / (longlong)iVar13 & 0xffffffff;
          if ((iVar9 % iVar13 == iVar12) && (uVar7 = *(uint *)(puVar8 + -2), uVar7 != 0xffffffff)) {
            bVar3 = false;
            if (((char)puVar8[1] == '\0') ||
               ((cVar4 = FUN_1800714b8(uVar7,0), cVar4 != '\0' ||
                (cVar4 = FUN_180071430(uVar7), cVar4 != '\0')))) {
              cVar4 = FUN_18017cb04(uVar7);
              if (cVar4 != '\0') {
                *(undefined1 *)(puVar8 + 1) = 1;
                goto LAB_18017c1cd;
              }
LAB_18017c1d8:
              cVar4 = FUN_18017d190(uVar7);
              if (cVar4 != '\0') goto LAB_18017c1e6;
            }
            else {
LAB_18017c1cd:
              cVar4 = FUN_18017cc80(uVar7);
              if (cVar4 == '\0') goto LAB_18017c1d8;
LAB_18017c1e6:
              bVar3 = true;
            }
            uVar1 = *puVar8;
            uVar6 = (ulonglong)uVar1;
            if ((0 < (short)uVar1) || (bVar3)) {
              if (uVar1 == 0x7fff) {
                uVar6 = 0x7fff;
              }
              else {
                uVar6 = (ulonglong)(ushort)(uVar1 + 1);
              }
              *puVar8 = (ushort)uVar6;
              if (!bVar3) goto LAB_18017c21a;
              uVar6 = CONCAT71((int7)(uVar6 >> 8),(short)puVar8[3] <= (short)(ushort)uVar6);
            }
            else {
LAB_18017c21a:
              if (uVar7 == 0xffffffff) goto LAB_18017c277;
              lVar11 = *(longlong *)(*(longlong *)(lVar2 + 0x10) + 0x50);
              uVar6 = *(ulonglong *)(lVar11 + 0x10 + (ulonglong)(uVar7 & 0xffff) * 0x18);
              if (*(int *)(uVar6 + 0x14) == -1) {
                cVar4 = *(char *)(lVar11 + 4 + (ulonglong)(uVar7 & 0xffff) * 0x18);
                if (cVar4 == '\x01') {
                  uVar6 = FUN_18017d0fc(uVar7);
                }
                else {
                  if ((cVar4 != '\x02') && (cVar4 != '\x03')) goto LAB_18017c277;
                  uVar6 = FUN_1804718dc(uVar7);
                }
                if ((char)uVar6 == '\0') goto LAB_18017c277;
              }
              *puVar8 = 0;
              uVar6 = uVar6 & 0xffffffffffffff00;
            }
            if ((char)uVar6 != '\0') {
              uVar6 = FUN_18046f0b0(*(undefined4 *)(puVar8 + -2));
            }
          }
LAB_18017c277:
          plVar10 = (longlong *)(ulonglong)(iVar9 + 1U);
          puVar8 = puVar8 + 6;
        } while ((int)(iVar9 + 1U) < 0x2cb);
      }
    }
  }
  return uVar6;
}

