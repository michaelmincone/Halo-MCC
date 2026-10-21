/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

void FUN_18017c75c(longlong param_1,undefined4 param_2,short *param_3)

{
  int iVar1;
  int iVar2;
  short *psVar3;
  int *piVar4;
  short *psVar5;
  short *psVar6;
  short sVar7;
  longlong lVar8;
  
  psVar3 = (short *)0x0;
  sVar7 = 0;
  iVar1 = FUN_18017c4c8(param_2);
  psVar5 = (short *)(param_1 + 0xc);
  lVar8 = 0x2cb;
  psVar6 = psVar3;
  do {
    if (((*(int *)(psVar5 + -4) != -1) && (*psVar5 < sVar7)) &&
       (iVar2 = FUN_18017c4c8((int)psVar5[-4]), iVar2 == iVar1)) {
      sVar7 = *psVar5;
      psVar6 = psVar5 + -6;
    }
    psVar5 = psVar5 + 8;
    lVar8 = lVar8 + -1;
  } while (lVar8 != 0);
  if (psVar6 == (short *)0x0) {
    if (param_3 == (short *)0x0) {
      piVar4 = (int *)(param_1 + 4);
      psVar5 = psVar3;
      while (*piVar4 != -1) {
        psVar3 = (short *)(ulonglong)((int)psVar3 + 1);
        psVar5 = (short *)((longlong)psVar5 + 1);
        piVar4 = piVar4 + 4;
        if (0x2ca < (longlong)psVar5) {
          return;
        }
      }
      param_3 = (short *)((longlong)(int)psVar3 * 0x10 + param_1);
    }
    psVar6 = param_3;
    if (param_3 == (short *)0x0) {
      return;
    }
  }
  FUN_18017bcf8(psVar6);
  return;
}

