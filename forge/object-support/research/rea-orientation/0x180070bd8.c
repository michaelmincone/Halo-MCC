/* ev_db4a03b3025ddcdba9ede1960ab7d8c665bc5ed31c50f1c6dadb5d6c969fc6d8 */

int FUN_180070bd8(float *param_1)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  float fVar8;
  float fVar9;
  
  fVar1 = *param_1;
  fVar2 = param_1[1];
  fVar3 = param_1[2];
  fVar8 = ABS(fVar1);
  fVar9 = ABS(fVar2);
  fVar4 = ABS(fVar3);
  if (fVar8 <= fVar9) {
    if (fVar9 <= fVar4) goto LAB_180070c61;
    iVar5 = 1;
    iVar7 = 4;
    fVar8 = fVar3 / fVar9;
  }
  else {
    if (fVar4 < fVar8) {
      fVar9 = fVar2 / fVar8;
      iVar7 = 3;
      if (0.0 < fVar1) {
        iVar7 = 0;
      }
      fVar8 = fVar3 / fVar8;
      goto LAB_180070c81;
    }
LAB_180070c61:
    iVar7 = 5;
    iVar5 = 2;
    fVar8 = fVar2 / fVar4;
    fVar9 = fVar4;
    fVar2 = fVar3;
  }
  fVar9 = fVar1 / fVar9;
  if (0.0 < fVar2) {
    iVar7 = iVar5;
  }
LAB_180070c81:
  iVar5 = (int)((fVar9 - -1.0) / 0.0048076925);
  iVar6 = (int)((fVar8 - -1.0) / 0.0048076925);
  if (iVar5 < 1) {
    iVar5 = 0;
  }
  if (0x19f < iVar5) {
    iVar5 = 0x19f;
  }
  if (iVar6 < 1) {
    iVar6 = 0;
  }
  if (0x19f < iVar6) {
    iVar6 = 0x19f;
  }
  return iVar5 * 0x1a1 + DAT_180b9b760 * iVar7 + iVar6;
}

