/* REA evidence: ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5; source: loophole-batch.json */

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_18006daf4(longlong param_1,int param_2,undefined4 param_3,char param_4)

{
  longlong lVar1;
  undefined1 uVar2;
  short sVar3;
  uint uVar4;
  char cVar5;
  short sVar6;
  int iVar7;
  int iVar8;
  longlong lVar9;
  longlong lVar10;
  undefined8 uVar11;
  short sVar12;
  longlong lVar13;
  char *pcVar14;
  undefined1 auStack_218 [32];
  undefined1 local_1f8;
  uint *local_1f0;
  uint local_1e8 [6];
  undefined4 local_1d0;
  undefined2 local_184;
  undefined2 local_178;
  undefined1 local_174;
  undefined2 local_bc;
  char local_a0 [96];
  ulonglong local_40;
  
  local_40 = DAT_180afa010 ^ (ulonglong)auStack_218;
  lVar9 = FUN_18049d490(DAT_180c1a230,param_2);
  local_1f0 = local_1e8;
  local_1f8 = 1;
  local_184 = 0xffff;
  local_178 = 0xffff;
  local_1d0 = 0;
  local_174 = 0;
  local_bc = 0;
  cVar5 = FUN_18049c448(param_2,param_3,lVar9,
                        *(short *)((&PTR_PTR_180a52540)[param_2] + 0x10) + DAT_180c1a230);
  if (((cVar5 != '\0') && (local_1e8[0] != 0xffffffff)) &&
     (uVar4 = *(uint *)(DAT_180c1a600 + 4 + ((ulonglong)local_1e8[0] & 0xffff) * 8),
     0 < *(int *)((&DAT_184e39f20)[uVar4 >> 0x1c] + 0x140 + (ulonglong)uVar4 * 4))) {
    iVar7 = FUN_18006ce90(param_1);
    lVar13 = (longlong)iVar7;
    if (iVar7 != -1) {
      if (param_4 == '\0') {
        pcVar14 = local_a0;
        if (local_a0[0] != '\0') {
          uVar11 = FUN_18006bd30();
          FUN_18006bb70(uVar11,pcVar14);
        }
      }
      else {
        iVar8 = FUN_18006e0c8(param_1);
        if (iVar8 != -1) {
          *(undefined4 *)((longlong)iVar8 * 0x4c + 0x1500 + param_1) = 0xffffffff;
          FUN_18006eabc(param_1,iVar8,local_1e8);
          if (param_2 - 1U < 2) {
            lVar10 = FUN_1800703ac(param_2,param_3);
            if (lVar10 != 0) {
              uVar2 = *(undefined1 *)(lVar10 + 0x2a);
              lVar1 = param_1 + lVar13 * 2;
              *(undefined1 *)(lVar13 + 0xd640 + lVar1) = *(undefined1 *)(lVar10 + 0x29);
              *(undefined1 *)(lVar13 + 0xd641 + lVar1) = uVar2;
            }
          }
          FUN_18006de38(param_1,iVar7);
          if (param_2 == 2) {
            uVar4 = *(uint *)(DAT_180c1a600 + 4 + (ulonglong)(ushort)local_1e8[0] * 8);
            if (0 < *(int *)((&DAT_184e39f20)[uVar4 >> 0x1c] + 0x3f0 + (ulonglong)uVar4 * 4)) {
              uVar4 = *(uint *)((&DAT_184e39f20)[uVar4 >> 0x1c] + 0x3f4 + (ulonglong)uVar4 * 4);
              sVar3 = *(short *)((&DAT_184e39f20)[uVar4 >> 0x1c] + 10 + (ulonglong)uVar4 * 4);
              if (0 < sVar3) {
                sVar12 = *(short *)(lVar9 + 0x70);
                if (sVar12 < 1) {
                  sVar12 = *(short *)((&DAT_184e39f20)[uVar4 >> 0x1c] + 6 + (ulonglong)uVar4 * 4);
                }
                sVar6 = *(short *)(lVar9 + 0x72);
                if (*(short *)(lVar9 + 0x72) < 1) {
                  sVar6 = sVar3;
                }
                *(char *)((longlong)iVar8 * 0x4c + 0x1544 + param_1) =
                     (char)((sVar3 + -1 + ((int)sVar12 - (int)sVar6)) / (int)sVar3);
              }
            }
          }
        }
      }
    }
  }
  return;
}

