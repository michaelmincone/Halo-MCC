/* REA evidence: ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698; source: respawn-batch.json */

bool FUN_18017c64c(undefined8 param_1,undefined4 param_2,undefined1 *param_3)

{
  longlong lVar1;
  byte bVar2;
  byte bVar3;
  char cVar4;
  undefined4 uVar5;
  int iVar6;
  longlong lVar7;
  bool bVar8;
  longlong lVar9;
  undefined1 local_78 [2];
  short local_76;
  undefined4 local_74;
  undefined2 local_4c;
  undefined8 local_48;
  undefined8 local_40;
  undefined1 local_38;
  undefined8 local_37;
  undefined2 local_2f;
  undefined1 local_2d;
  
  bVar8 = false;
  lVar7 = FUN_18006bcec();
  if (lVar7 != 0) {
    memset(local_78,0,0x4c);
    local_48 = 0;
    local_40 = 0;
    local_76 = -1;
    local_74 = 0xffffffff;
    local_4c = 0xffff;
    local_2d = 0;
    local_38 = 0;
    local_2f = 0xff00;
    local_37 = 0x800ffff000000;
    *param_3 = 0;
    cVar4 = FUN_18006e550(lVar7,param_2,local_78);
    if ((cVar4 != '\0') && (local_76 != -1)) {
      lVar9 = (longlong)local_76;
      lVar1 = lVar7 + lVar9 * 2;
      uVar5 = FUN_18006e6c8(lVar7,param_2,0);
      iVar6 = FUN_18017c4fc(param_1,param_2,uVar5);
      bVar2 = *(byte *)(lVar9 + 0xd640 + lVar1);
      bVar3 = *(byte *)(lVar9 + 0xd641 + lVar1);
      if (bVar2 != 0) {
        *param_3 = iVar6 < (int)(uint)bVar2;
      }
      if (bVar3 == 0) {
        bVar8 = true;
      }
      else {
        bVar8 = iVar6 < (int)(uint)bVar3;
      }
    }
  }
  return bVar8;
}

