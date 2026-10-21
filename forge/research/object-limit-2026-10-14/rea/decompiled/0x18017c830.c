/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

ulonglong FUN_18017c830(longlong param_1,int param_2)

{
  ulonglong uVar1;
  int *piVar2;
  ulonglong uVar3;
  
  uVar1 = 0;
  if (param_2 != -1) {
    piVar2 = (int *)(param_1 + 0x2cb0);
    uVar3 = uVar1;
    while (*piVar2 != param_2) {
      uVar1 = (ulonglong)((int)uVar1 + 1);
      uVar3 = uVar3 + 1;
      piVar2 = piVar2 + 3;
      if (0x2ca < (longlong)uVar3) {
        return 0;
      }
    }
    uVar1 = param_1 + ((longlong)(int)uVar1 * 3 + 0xb2c) * 4;
  }
  return uVar1;
}

