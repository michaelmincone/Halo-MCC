/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x1800760b4; PE exception range ends: 0x1800761b6.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1800760b4(int param_1,char param_2)

{
  longlong lVar1;
  char cVar2;
  longlong lVar3;
  longlong lVar4;
  undefined8 uVar5;
  ulonglong uVar6;
  byte bVar7;
  byte bVar8;
  longlong lVar9;
  longlong unaff_GS_OFFSET;
  
  lVar9 = (longlong)param_1;
  cVar2 = FUN_180071540();
  if (cVar2 != '\0') {
    lVar3 = func_0x00018006bcec();
    lVar9 = lVar9 * 3;
    lVar4 = FUN_18006cf60();
    lVar1 = *(longlong *)(unaff_GS_OFFSET + 0x58);
    bVar7 = *(char *)(lVar3 + 0xd641 + lVar9) + param_2;
    bVar8 = param_2 + *(char *)(lVar3 + 0xd642 + lVar9);
    uVar6 = (ulonglong)__tls_index;
    *(byte *)(lVar3 + 0xd641 + lVar9) = bVar7;
    *(byte *)(lVar3 + 0xd642 + lVar9) = bVar8;
    lVar1 = *(longlong *)(*(longlong *)(lVar1 + uVar6 * 8) + 0x48);
    if ((*(char *)(lVar1 + 0x11) != '\x04') && (bVar8 == 0)) {
      bVar7 = 0;
      *(undefined1 *)(lVar3 + 0xd641 + lVar9) = 0;
    }
    if (bVar7 <= bVar8) {
      bVar7 = bVar8;
    }
    if (*(int *)(lVar4 + 0x10) <= (int)(uint)bVar7) {
      bVar7 = *(byte *)(lVar4 + 0x10);
    }
    *(byte *)(lVar3 + 0xd641 + lVar9) = bVar7;
    bVar7 = *(byte *)(lVar3 + 0xd640 + lVar9);
    if (bVar7 == 0) {
      bVar7 = 0;
    }
    if (bVar7 < bVar8) {
      bVar8 = bVar7;
    }
    *(byte *)(lVar3 + 0xd640 + lVar9) = bVar8;
    if (*(char *)(lVar1 + 0x11) != '\x04') {
      uVar5 = func_0x00018006bcec();
      FUN_18006dd80(uVar5);
      FUN_1803a5be8(0x100000);
    }
  }
  return;
}

