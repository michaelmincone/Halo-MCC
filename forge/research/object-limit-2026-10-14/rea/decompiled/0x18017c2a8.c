/* REA evidence: ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3; source: respawn-eligibility-batch.json */

void FUN_18017c2a8(longlong param_1,int param_2,ulonglong param_3)

{
  undefined4 *puVar1;
  longlong lVar2;
  void *pvVar3;
  char cVar4;
  longlong lVar5;
  int *piVar6;
  byte bVar7;
  ulonglong uVar8;
  int *piVar9;
  ulonglong uVar10;
  byte bVar11;
  byte bVar12;
  ulonglong uVar13;
  byte *pbVar14;
  ulonglong uVar15;
  ulonglong uVar16;
  ulonglong uVar17;
  
  pvVar3 = ThreadLocalStoragePointer;
  uVar17 = (ulonglong)_tls_index;
  uVar15 = param_3 & 0xffff;
  lVar2 = *(longlong *)
           (*(longlong *)(*(longlong *)((longlong)ThreadLocalStoragePointer + uVar17 * 8) + 0x10) +
           0x50);
  if ((1 << (*(byte *)(lVar2 + 4 + uVar15 * 0x18) & 0x1f) & 0x50eU) != 0) {
    lVar2 = *(longlong *)(lVar2 + 0x10 + uVar15 * 0x18);
    uVar10 = 0;
    bVar11 = *(byte *)((longlong)*(short *)(lVar2 + 0x192) + 0x13 + lVar2) & 1;
    bVar12 = bVar11;
    if (param_2 != -1) {
      piVar6 = (int *)(param_1 + 4);
      piVar9 = piVar6;
      uVar8 = uVar10;
      uVar16 = uVar10;
      do {
        if ((short)*piVar9 == param_2) {
          uVar13 = (longlong)(int)uVar8 * 0x10 + param_1;
          break;
        }
        uVar8 = (ulonglong)((int)uVar8 + 1);
        uVar16 = uVar16 + 1;
        piVar9 = piVar9 + 4;
        uVar13 = uVar10;
      } while ((longlong)uVar16 < 0x2cb);
      uVar8 = uVar10;
      if (uVar13 == 0) {
        do {
          if (*piVar6 == -1) {
            pbVar14 = (byte *)((longlong)(int)uVar8 * 0x10 + param_1);
            lVar5 = FUN_18047b848(param_3 & 0xffffffff);
            *pbVar14 = 1;
            bVar11 = *pbVar14 | 2;
            if (-1 < *(char *)(lVar5 + 0x12)) {
              bVar11 = *pbVar14 & 0xfd;
            }
            *pbVar14 = bVar11;
            bVar7 = bVar11 | 8;
            if (*(char *)(lVar5 + 0x1e) != '\0') {
              bVar7 = bVar11 & 0xf7;
            }
            *pbVar14 = bVar7;
            bVar11 = bVar7 | 4;
            if (*(char *)(lVar5 + 0x1e) != '\x01') {
              bVar11 = bVar7 & 0xfb;
            }
            *pbVar14 = bVar11;
            *(int *)(pbVar14 + 4) = (int)*(short *)(lVar2 + 0x1c);
            pbVar14[0xc] = 0xff;
            pbVar14[0xd] = 0x7f;
            *(int *)(pbVar14 + 8) = (int)param_3;
            goto LAB_18017c418;
          }
          uVar10 = uVar10 + 1;
          piVar6 = piVar6 + 4;
          uVar8 = (ulonglong)((int)uVar8 + 1);
        } while ((longlong)uVar10 < 0x2cb);
        pbVar14 = (byte *)0x0;
LAB_18017c418:
        if (pbVar14 == (byte *)0x0) {
          bVar12 = 0;
        }
      }
      else {
        bVar12 = 0;
        if (bVar11 == 0) {
          bVar12 = bVar11;
        }
      }
    }
    uVar8 = 0;
    piVar6 = (int *)(param_1 + 0x2cb0);
    uVar10 = uVar8;
    do {
      if (*piVar6 == -1) {
        puVar1 = (undefined4 *)(param_1 + 0x2cb0 + (longlong)(int)uVar8 * 0xc);
        if (puVar1 == (undefined4 *)0x0) {
          return;
        }
        FUN_18017bf34(puVar1,param_3 & 0xffffffff);
        if (bVar12 == 0) {
          return;
        }
        if ((((int)param_3 != -1) &&
            (*(char *)(*(longlong *)
                        (*(longlong *)
                          (*(longlong *)(*(longlong *)((longlong)pvVar3 + uVar17 * 8) + 0x10) + 0x50
                          ) + 0x10 + uVar15 * 0x18) + 0x8e) == '\x01')) &&
           (cVar4 = FUN_18017d0fc(param_3 & 0xffffffff), cVar4 != '\0')) {
          bVar12 = 0;
        }
        if (bVar12 == 0) {
          return;
        }
        FUN_18046f0b0(*puVar1);
        return;
      }
      uVar8 = (ulonglong)((int)uVar8 + 1);
      uVar10 = uVar10 + 1;
      piVar6 = piVar6 + 3;
    } while ((longlong)uVar10 < 0x2cb);
  }
  return;
}

