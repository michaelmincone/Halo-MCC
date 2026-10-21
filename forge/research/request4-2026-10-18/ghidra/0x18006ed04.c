/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006ed04; PE exception range ends: 0x18006eef4.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_18006ed04(longlong param_1,int param_2,char param_3)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  longlong lVar4;
  longlong unaff_GS_OFFSET;
  undefined1 auStack_1f8 [32];
  uint auStack_1d8 [6];
  uint uStack_1c0;
  undefined8 uStack_1b0;
  undefined4 uStack_1a8;
  undefined8 uStack_1a4;
  undefined4 uStack_19c;
  undefined2 uStack_174;
  undefined2 uStack_168;
  undefined1 uStack_164;
  undefined2 uStack_ac;
  ulonglong uStack_30;
  
  uStack_30 = _DAT_180afa010 ^ (ulonglong)auStack_1f8;
  uStack_174 = 0xffff;
  uStack_168 = 0xffff;
  uStack_1c0 = 0;
  uStack_164 = 0;
  uStack_ac = 0;
  lVar4 = FUN_18006cf60(param_1,(int)*(short *)((longlong)param_2 * 0x4c + 0x14fe + param_1));
  FUN_18049cc24(auStack_1d8,
                *(undefined4 *)
                 (*(longlong *)((ulonglong)(*(uint *)(lVar4 + 8) >> 0x1c) * 8 + 0x184e39f20) + 0x10
                 + ((ulonglong)*(uint *)(lVar4 + 8) +
                   (ulonglong)*(byte *)((longlong)param_2 * 0x4c + 0x152a + param_1) * 6) * 4),
                0xffffffff,0);
  if (auStack_1d8[0] != 0xffffffff) {
    FUN_18006efa0(param_1,param_2,auStack_1d8);
    cVar2 = FUN_180070ce8(&uStack_1b0,&uStack_1a4);
    if (cVar2 == '\0') {
      uStack_1b0 = _DAT_18098fa74;
      uStack_1a8 = _DAT_18098fa7c;
      uStack_1a4 = _DAT_18098fa8c;
      uStack_19c = _DAT_18098fa94;
    }
    cVar2 = FUN_18049c8b4(auStack_1d8);
    if (cVar2 != '\0') {
      auStack_1d8[0] = FUN_18049c7d0(auStack_1d8[0]);
      if ((auStack_1d8[0] != 0xffffffff) &&
         (uVar1 = *(uint *)(_DAT_180c1a600 + 4 + (ulonglong)(auStack_1d8[0] & 0xffff) * 8),
         *(int *)(*(longlong *)((ulonglong)(uVar1 >> 0x1c) * 8 + 0x184e39f20) + 0x70 +
                 (ulonglong)uVar1 * 4) != -1)) {
        if (param_3 == '\0') {
          uStack_1c0 = uStack_1c0 & 0xfffffdff;
        }
        else {
          uStack_1c0 = uStack_1c0 | 0x200;
        }
        iVar3 = FUN_18046d6e0(auStack_1d8);
        if (iVar3 != -1) {
          *(short *)(*(longlong *)
                      (*(longlong *)
                        (*(longlong *)
                          (*(longlong *)
                            (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
                          0x10) + 0x50) + 0x10 + (ulonglong)(ushort)iVar3 * 0x18) + 0x1c) =
               (short)param_2;
          FUN_18006f240(param_1,iVar3);
          FUN_18017b8d0(iVar3);
          FUN_1803a645c(iVar3);
          FUN_1803a6054(param_2,7);
        }
      }
    }
  }
  FUN_180787e00(uStack_30 ^ (ulonglong)auStack_1f8);
  return;
}

