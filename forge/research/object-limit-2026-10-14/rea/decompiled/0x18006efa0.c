/* REA evidence: ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3; source: respawn-eligibility-batch.json */

void FUN_18006efa0(longlong param_1,int param_2,undefined4 *param_3)

{
  longlong lVar1;
  int iVar2;
  longlong lVar3;
  longlong lVar4;
  
  lVar4 = (longlong)param_2 * 0x4c;
  lVar3 = FUN_18006cf60(param_1,(int)*(short *)(lVar4 + 0x14fe + param_1));
  lVar1 = (ulonglong)*(uint *)(lVar3 + 8) + (ulonglong)*(byte *)(lVar4 + 0x152a + param_1) * 6;
  lVar3 = (&DAT_184e39f20)[*(uint *)(lVar3 + 8) >> 0x1c];
  *param_3 = *(undefined4 *)(lVar3 + 0x10 + lVar1 * 4);
  iVar2 = *(int *)(lVar3 + 0x14 + lVar1 * 4);
  if (1 < iVar2 + 1U) {
    param_3[3] = iVar2;
  }
  *(undefined8 *)(param_3 + 7) = *(undefined8 *)(lVar4 + 0x1504 + param_1);
  param_3[9] = *(undefined4 *)(lVar4 + 0x150c + param_1);
  *(undefined8 *)(param_3 + 10) = *(undefined8 *)(lVar4 + 0x1510 + param_1);
  param_3[0xc] = *(undefined4 *)(lVar4 + 0x1518 + param_1);
  *(undefined8 *)(param_3 + 0xd) = *(undefined8 *)(lVar4 + 0x151c + param_1);
  param_3[0xf] = *(undefined4 *)(lVar4 + 0x1524 + param_1);
  FUN_18006f070(param_1,param_2,param_3);
  return;
}

