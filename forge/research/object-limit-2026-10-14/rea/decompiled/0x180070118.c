/* REA evidence: ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5; source: loophole-batch.json */

undefined8
FUN_180070118(longlong param_1,int param_2,ulonglong param_3,undefined8 param_4,longlong param_5)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  char cVar4;
  ulonglong uVar5;
  short sVar6;
  ushort uVar7;
  ushort *puVar8;
  longlong lVar9;
  uint uVar10;
  short *psVar11;
  int iVar12;
  longlong local_58;
  longlong local_50;
  longlong local_48;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  int local_30;
  undefined4 local_2c;
  
  iVar12 = param_2 * 0x15;
  lVar9 = (longlong)param_2;
  local_58 = lVar9 * 0x15;
  local_50 = 0x15;
  psVar11 = (short *)(param_5 + 0x46);
  uVar10 = 2;
  puVar8 = (ushort *)(param_1 + 0xd640 + lVar9 * 0x3f);
  lVar9 = param_1 + 0x153f + lVar9 * 0x63c;
  do {
    if ((param_3 >> ((ulonglong)(uVar10 - 2) & 0x3f) & 1) != 0) {
      sVar6 = *psVar11;
      if ((sVar6 != *(short *)(lVar9 + -0x41)) || (psVar11[1] != (ushort)*(byte *)(lVar9 + -0x15)))
      {
        FUN_18006dee4(param_1,iVar12);
        sVar6 = *psVar11;
      }
      if (sVar6 != -1) {
        if (*(short *)(lVar9 + -0x41) == -1) {
          memset((void *)(lVar9 + -0x43),0,0x4c);
          *(undefined2 *)(lVar9 + -0x41) = 0xffff;
          *(undefined4 *)(lVar9 + -0x3f) = 0xffffffff;
          *(undefined2 *)(lVar9 + -0x17) = 0xffff;
          *(undefined1 *)(lVar9 + 7) = 0xff;
          *(undefined2 *)(lVar9 + 1) = 0xffff;
          *(undefined1 *)(lVar9 + 4) = 8;
          *(ushort *)(lVar9 + -0x43) = *(ushort *)(lVar9 + -0x43) | 1;
          *(byte *)(lVar9 + 3) = *(byte *)(lVar9 + 3) | 0xc;
          *(short *)(lVar9 + -0x41) = *psVar11;
        }
        *(char *)(lVar9 + -0x15) = (char)psVar11[1];
      }
      if ((*(byte *)(lVar9 + -0x43) & 1) != 0) {
        uVar1 = *(undefined4 *)(psVar11 + -0x21);
        uVar2 = *(undefined4 *)(psVar11 + -0x1f);
        uVar3 = *(undefined4 *)(psVar11 + -0x1d);
        *(undefined4 *)(lVar9 + -0x13) = *(undefined4 *)(psVar11 + -0x23);
        *(undefined4 *)(lVar9 + -0xf) = uVar1;
        *(undefined4 *)(lVar9 + -0xb) = uVar2;
        *(undefined4 *)(lVar9 + -7) = uVar3;
        *(undefined8 *)(lVar9 + -3) = *(undefined8 *)(psVar11 + -0x1b);
        *(undefined4 *)(lVar9 + 5) = *(undefined4 *)(psVar11 + -0x17);
        FUN_18006f4f0(param_1,iVar12);
      }
    }
    if (((param_3 >> ((ulonglong)(uVar10 - 1) & 0x3f) & 1) != 0) &&
       ((*(byte *)(lVar9 + -0x43) & 1) != 0)) {
      *(undefined8 *)(lVar9 + -0x3b) = *(undefined8 *)(psVar11 + -0x15);
      *(undefined4 *)(lVar9 + -0x33) = *(undefined4 *)(psVar11 + -0x11);
      *(undefined8 *)(lVar9 + -0x2f) = *(undefined8 *)(psVar11 + -0xf);
      *(undefined4 *)(lVar9 + -0x27) = *(undefined4 *)(psVar11 + -0xb);
      *(undefined8 *)(lVar9 + -0x23) = *(undefined8 *)(psVar11 + -9);
      *(undefined4 *)(lVar9 + -0x1b) = *(undefined4 *)(psVar11 + -5);
      *(short *)(lVar9 + -0x17) = psVar11[-3];
      local_2c = 0x86868686;
      local_40 = 0x5ce;
      uVar7 = *(ushort *)(lVar9 + -0x43) | 2;
      if ((char)psVar11[-1] == '\0') {
        uVar7 = *(ushort *)(lVar9 + -0x43) & 0xfffd;
      }
      local_48 = 0;
      local_3c = 0;
      local_38 = 0;
      local_34 = 0;
      local_30 = -1;
      *(ushort *)(lVar9 + -0x43) = uVar7;
      while (cVar4 = FUN_180473a78(&local_48), cVar4 != '\0') {
        if ((*(short *)(local_48 + 0x1c) == iVar12) && (local_30 != *(int *)(lVar9 + -0x3f))) {
          FUN_18006e3fc(param_1);
        }
      }
    }
    uVar5 = (ulonglong)uVar10;
    if ((((param_3 >> (uVar5 & 0x3f) & 1) != 0) && (-1 < local_58)) &&
       (uVar5 = (ulonglong)(uint)(int)*(short *)(param_1 + 0x2b2),
       iVar12 < *(short *)(param_1 + 0x2b2))) {
      uVar5 = (ulonglong)(ushort)psVar11[2];
      sVar6 = psVar11[3];
      *puVar8 = psVar11[2];
      *(char *)(puVar8 + 1) = (char)sVar6;
    }
    puVar8 = (ushort *)((longlong)puVar8 + 3);
    local_58 = local_58 + 1;
    iVar12 = iVar12 + 1;
    uVar10 = uVar10 + 3;
    lVar9 = lVar9 + 0x4c;
    psVar11 = psVar11 + 0x28;
    local_50 = local_50 + -1;
  } while (local_50 != 0);
  return CONCAT71((int7)(uVar5 >> 8),1);
}

