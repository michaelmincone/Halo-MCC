/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006de38; PE exception range ends: 0x18006dee2.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_18006de38(longlong param_1,int param_2)

{
  short sVar1;
  byte bVar2;
  short *psVar3;
  byte bVar4;
  longlong lVar5;
  longlong unaff_GS_OFFSET;
  
  if (*(char *)(*(longlong *)
                 (*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 0x48) + 0x11) != '\x04') {
    FUN_18006cf60(0x48,param_2);
    lVar5 = 0x28b;
    psVar3 = (short *)(param_1 + 0x14fe);
    bVar4 = 0;
    do {
      sVar1 = *psVar3;
      psVar3 = psVar3 + 0x26;
      bVar2 = bVar4 + 1;
      if (sVar1 != param_2) {
        bVar2 = bVar4;
      }
      lVar5 = lVar5 + -1;
      bVar4 = bVar2;
    } while (lVar5 != 0);
    bVar4 = *(byte *)(param_1 + (longlong)param_2 * 3 + 0xd642);
    if (bVar4 != bVar2) {
      FUN_1800760b4(param_2,(uint)bVar2 - (uint)bVar4);
    }
    FUN_1803a6054(param_2,4);
  }
  return;
}

