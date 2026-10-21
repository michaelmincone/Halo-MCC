/* REA evidence: ev_03242fd474b5bfd9b5cd7476c32d52800dcc224d1278510d1e91a9608ac3e0c2; source: object-creation-batch.json */

longlong FUN_18047b848(undefined8 param_1)

{
  longlong lVar1;
  longlong lVar2;
  
  lVar1 = FUN_1804739cc(param_1,0xffffffff);
  lVar2 = 0;
  if ((lVar1 != 0) && (*(short *)(lVar1 + 0x192) != -1)) {
    lVar2 = *(short *)(lVar1 + 0x192) + lVar1;
  }
  return lVar2;
}

