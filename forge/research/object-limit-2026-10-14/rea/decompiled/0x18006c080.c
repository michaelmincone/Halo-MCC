/* REA evidence: ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5; source: loophole-batch.json */

void FUN_18006c080(undefined1 *param_1,int param_2)

{
  undefined4 *puVar1;
  longlong lVar2;
  undefined8 *puVar3;
  undefined2 *puVar4;
  undefined1 *puVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined1 local_88 [16];
  undefined2 local_78;
  undefined2 uStack_76;
  undefined4 uStack_74;
  undefined8 uStack_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined4 uStack_50;
  undefined2 uStack_4c;
  undefined2 uStack_4a;
  undefined8 local_48;
  undefined8 uStack_40;
  undefined1 local_38;
  undefined2 uStack_37;
  undefined1 uStack_35;
  undefined2 uStack_34;
  undefined1 uStack_32;
  undefined1 uStack_31;
  undefined1 uStack_30;
  undefined1 uStack_2f;
  undefined1 uStack_2e;
  undefined1 uStack_2d;
  
  memset(&local_78,0,0x4c);
  uStack_37 = 0;
  uStack_32 = 0;
  uStack_30 = 0;
  uStack_2f = 0;
  local_48 = 0;
  uStack_40 = 0;
  uStack_35 = 0;
  uStack_2e = 0xff;
  uStack_34 = 0xffff;
  uStack_31 = 8;
  uStack_76 = 0xffff;
  uStack_74 = 0xffffffff;
  uStack_4c = 0xffff;
  uStack_2d = 0;
  local_38 = 0;
  memset(param_1,0,0xd9bc);
  *param_1 = 0xff;
  param_1[0x28] = 0xff;
  *(undefined4 *)(param_1 + 0x2c) = 0xffffffff;
  param_1[0x30] = 0xff;
  *(int *)(param_1 + 0x2b4) = param_2;
  param_1[0x2e9] = 1;
  if (param_2 + 2U < 2) {
    uVar6 = 0;
    uVar7 = 0;
    uVar8 = 0;
    uVar9 = 0;
  }
  else {
    puVar1 = (undefined4 *)FUN_18003c5fc(local_88,param_2);
    uVar6 = *puVar1;
    uVar7 = puVar1[1];
    uVar8 = puVar1[2];
    uVar9 = puVar1[3];
  }
  *(undefined4 *)(param_1 + 0x2b8) = uVar6;
  *(undefined4 *)(param_1 + 700) = uVar7;
  *(undefined4 *)(param_1 + 0x2c0) = uVar8;
  *(undefined4 *)(param_1 + 0x2c4) = uVar9;
  puVar1 = (undefined4 *)(param_1 + 0xd940);
  for (lVar2 = 0x1f; lVar2 != 0; lVar2 = lVar2 + -1) {
    *puVar1 = 0xffffffff;
    puVar1 = puVar1 + 1;
  }
  *(undefined4 *)(param_1 + 0x14f8) = 0;
  puVar4 = (undefined2 *)(param_1 + 0x12f8);
  for (lVar2 = 0x100; lVar2 != 0; lVar2 = lVar2 + -1) {
    *puVar4 = 0xffff;
    puVar4 = puVar4 + 1;
  }
  *(undefined4 *)(param_1 + 0x12f4) = 0;
  *(ulonglong *)(param_1 + 0x14fc) = CONCAT44(uStack_74,CONCAT22(uStack_76,local_78));
  *(undefined8 *)(param_1 + 0x1504) = uStack_70;
  *(undefined8 *)(param_1 + 0x150c) = local_68;
  *(undefined8 *)(param_1 + 0x1514) = uStack_60;
  *(undefined8 *)(param_1 + 0x151c) = local_58;
  *(ulonglong *)(param_1 + 0x1524) = CONCAT26(uStack_4a,CONCAT24(uStack_4c,uStack_50));
  *(undefined8 *)(param_1 + 0x152c) = local_48;
  *(undefined8 *)(param_1 + 0x1534) = uStack_40;
  *(ulonglong *)(param_1 + 0x153c) =
       CONCAT17(uStack_31,
                CONCAT16(uStack_32,
                         CONCAT24(uStack_34,CONCAT13(uStack_35,CONCAT21(uStack_37,local_38)))));
  *(uint *)(param_1 + 0x1544) =
       CONCAT13(uStack_2d,CONCAT12(uStack_2e,CONCAT11(uStack_2f,uStack_30)));
  puVar3 = (undefined8 *)(param_1 + 0x14fc);
  puVar1 = (undefined4 *)(param_1 + 0x1548);
  for (lVar2 = 0x303e; lVar2 != 0; lVar2 = lVar2 + -1) {
    *puVar1 = *(undefined4 *)puVar3;
    puVar3 = (undefined8 *)((longlong)puVar3 + 4);
    puVar1 = puVar1 + 1;
  }
  *(undefined2 *)(param_1 + 0xd640) = 0;
  param_1[0xd642] = 0;
  puVar4 = (undefined2 *)(param_1 + 0xd640);
  puVar5 = param_1 + 0xd643;
  for (lVar2 = 0x2fd; lVar2 != 0; lVar2 = lVar2 + -1) {
    *puVar5 = *(undefined1 *)puVar4;
    puVar4 = (undefined2 *)((longlong)puVar4 + 1);
    puVar5 = puVar5 + 1;
  }
  *(undefined4 *)(param_1 + 0x2b0) = 0x20;
  *(undefined4 *)(param_1 + 0x2c8) = 0x7f7fffff;
  *(undefined4 *)(param_1 + 0x2cc) = 0xff7fffff;
  *(undefined4 *)(param_1 + 0x2d0) = 0x7f7fffff;
  *(undefined4 *)(param_1 + 0x2d4) = 0xff7fffff;
  *(undefined8 *)(param_1 + 0x2d8) = 0xff7fffff7f7fffff;
  *(undefined8 *)(param_1 + 0x2e0) = 0;
  param_1[0x2e8] = 0;
  *(undefined4 *)(param_1 + 0x2ec) = 0xffffffff;
  if (-1 < param_2) {
    FUN_180070434(param_1);
  }
  return;
}

