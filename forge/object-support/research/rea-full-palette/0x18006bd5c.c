/* REA/Ghidra ev_1980de16eacbd3f6e1f16d19f1e47d6b6c129f11dd96961f7e564b2780d093a6 */

int FUN_18006bd5c(longlong param_1)

{
  int iVar1;
  int *piVar2;
  ulonglong uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  longlong lVar7;
  uint *puVar8;
  uint uVar9;
  int iVar10;
  uint uVar11;
  
  iVar1 = *(int *)(param_1 + 0x228);
  lVar7 = (longlong)iVar1;
  uVar4 = (iVar1 + 0xdeadbef2U ^ 0x90434855) + 0xe5bd537e;
  uVar5 = (uVar4 ^ 0xdeadbef2) - (uVar4 * 0x2000000 ^ uVar4 >> 7);
  uVar9 = (uVar5 ^ 0x90434855) - (uVar5 >> 0x10 ^ uVar5 * 0x10000);
  uVar4 = (uVar9 ^ uVar4) - (uVar9 >> 0x1c ^ uVar9 * 0x10);
  uVar4 = (uVar5 ^ uVar4) - (uVar4 >> 0x12 ^ uVar4 * 0x4000);
  iVar10 = (uVar9 ^ uVar4) - (uVar4 * 0x1000000 ^ uVar4 >> 8);
  if (0 < iVar1) {
    puVar8 = (uint *)((&DAT_184e39f20)[*(uint *)(param_1 + 0x22c) >> 0x1c] +
                     ((ulonglong)*(uint *)(param_1 + 0x22c) + 2) * 4);
    do {
      uVar5 = *puVar8;
      uVar3 = (ulonglong)uVar5;
      uVar4 = iVar10 + 0xdeadbef3;
      uVar9 = uVar4 >> 0x12 ^ uVar4 * 0x4000;
      uVar11 = -uVar9;
      uVar9 = (uVar11 ^ uVar5 + uVar4) - (uVar11 >> 0x15 ^ uVar9 * -0x800);
      uVar6 = (uVar4 ^ uVar9) - (uVar9 * 0x2000000 ^ uVar9 >> 7);
      uVar11 = (uVar11 ^ uVar6) - (uVar6 >> 0x10 ^ uVar6 * 0x10000);
      uVar4 = (uVar11 ^ uVar9) - (uVar11 >> 0x1c ^ uVar11 * 0x10);
      uVar4 = (uVar6 ^ uVar4) - (uVar4 >> 0x12 ^ uVar4 * 0x4000);
      iVar10 = (uVar11 ^ uVar4) - (uVar4 * 0x1000000 ^ uVar4 >> 8);
      if (0 < (int)uVar5) {
        piVar2 = (int *)((&DAT_184e39f20)[puVar8[1] >> 0x1c] + ((ulonglong)puVar8[1] + 1) * 4);
        do {
          iVar1 = *piVar2;
          uVar4 = iVar10 + 0xdeadbef3;
          piVar2 = piVar2 + 7;
          uVar5 = uVar4 >> 0x12 ^ uVar4 * 0x4000;
          uVar6 = -uVar5;
          uVar5 = (uVar6 ^ iVar1 + uVar4) - (uVar6 >> 0x15 ^ uVar5 * -0x800);
          uVar9 = (uVar4 ^ uVar5) - (uVar5 * 0x2000000 ^ uVar5 >> 7);
          uVar6 = (uVar6 ^ uVar9) - (uVar9 >> 0x10 ^ uVar9 * 0x10000);
          uVar4 = (uVar6 ^ uVar5) - (uVar6 >> 0x1c ^ uVar6 * 0x10);
          uVar4 = (uVar9 ^ uVar4) - (uVar4 >> 0x12 ^ uVar4 * 0x4000);
          iVar10 = (uVar6 ^ uVar4) - (uVar4 * 0x1000000 ^ uVar4 >> 8);
          uVar3 = uVar3 - 1;
        } while (uVar3 != 0);
      }
      puVar8 = puVar8 + 5;
      lVar7 = lVar7 + -1;
    } while (lVar7 != 0);
  }
  return iVar10;
}

