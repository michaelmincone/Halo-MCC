/* REA/Ghidra ev_1980de16eacbd3f6e1f16d19f1e47d6b6c129f11dd96961f7e564b2780d093a6 */

int FUN_18006c710(longlong param_1)

{
  int iVar1;
  int *piVar2;
  longlong lVar3;
  
  iVar1 = 0;
  if ((param_1 != 0) && (lVar3 = (longlong)*(int *)(param_1 + 0x228), 0 < lVar3)) {
    piVar2 = (int *)((&DAT_184e39f20)[*(uint *)(param_1 + 0x22c) >> 0x1c] +
                    ((ulonglong)*(uint *)(param_1 + 0x22c) + 2) * 4);
    do {
      iVar1 = iVar1 + *piVar2;
      piVar2 = piVar2 + 5;
      lVar3 = lVar3 + -1;
    } while (lVar3 != 0);
  }
  return iVar1;
}

