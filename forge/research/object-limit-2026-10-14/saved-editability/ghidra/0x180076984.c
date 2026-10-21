/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x180076984; PE exception range ends: 0x180076a7d.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_180076984(ulonglong param_1,ulonglong param_2,undefined8 param_3)

{
  int iVar1;
  longlong lVar2;
  char cVar3;
  longlong lVar4;
  ushort uVar5;
  longlong unaff_GS_OFFSET;
  undefined4 auStackX_20 [2];
  undefined4 uStack_28;
  undefined4 auStack_24 [3];
  
  cVar3 = FUN_180076834(param_1,param_2,auStack_24,&uStack_28,auStackX_20);
  lVar4 = 0;
  if (cVar3 != '\0') {
    lVar2 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8);
    uVar5 = *(ushort *)
             (*(longlong *)
               (*(longlong *)(*(longlong *)(lVar2 + 0x10) + 0x50) + 0x10 + (param_2 & 0xffff) * 0x18
               ) + 0x1c);
    if (uVar5 < 0x28b) {
      lVar4 = func_0x00018006bcec();
      lVar4 = (longlong)(short)uVar5 * 0x4c + lVar4 + 0x14fc;
    }
    FUN_180076608(param_1 & 0xffffffff,auStack_24[0],uStack_28,auStackX_20[0],param_3,lVar4 + 0x14,
                  lVar4 + 0x20);
    iVar1 = *(int *)(*(longlong *)(lVar2 + 0x20) + 0x1758 + (param_1 & 0xffff) * 300);
    if (iVar1 != -1) {
      FUN_1800771bc(param_1 & 0xffffffff,iVar1,lVar4 + 0x30);
    }
  }
  return;
}

