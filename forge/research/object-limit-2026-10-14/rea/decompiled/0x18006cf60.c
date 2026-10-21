/* REA evidence: ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3; source: respawn-eligibility-batch.json */

longlong FUN_18006cf60(undefined8 param_1,undefined8 param_2)

{
  uint uVar1;
  int local_res8;
  undefined4 uStackX_c;
  int local_res18 [4];
  
  _local_res8 = CONCAT44((int)((ulonglong)param_1 >> 0x20),0xffffffff);
  local_res18[0] = -1;
  FUN_18006cfd0(param_1,param_2,&local_res8,local_res18);
  uVar1 = *(uint *)((&DAT_184e39f20)[*(uint *)(DAT_180c1a230 + 0x22c) >> 0x1c] + 0xc +
                   ((ulonglong)*(uint *)(DAT_180c1a230 + 0x22c) + (longlong)local_res8 * 5) * 4);
  return (&DAT_184e39f20)[uVar1 >> 0x1c] + ((longlong)local_res18[0] * 7 + (ulonglong)uVar1) * 4;
}

