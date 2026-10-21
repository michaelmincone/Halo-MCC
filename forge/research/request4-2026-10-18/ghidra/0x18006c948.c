/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006c948; PE exception range ends: 0x18006cb4f.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

bool FUN_18006c948(longlong param_1,int param_2)

{
  longlong lVar1;
  char cVar2;
  short sVar3;
  int iVar4;
  longlong lVar5;
  longlong lVar6;
  longlong lVar7;
  longlong unaff_GS_OFFSET;
  bool bVar8;
  ulonglong uStackX_8;
  
  lVar1 = _DAT_180c1a230;
  if (*(short *)(param_1 + 0x2b0) == 0x20) {
    cVar2 = FUN_18006c848(param_1,&uStackX_8);
    bVar8 = cVar2 == '\0';
    if ((((*(int *)(param_1 + 0x2b4) != -1) ||
         (cVar2 = func_0x00018000d0a4(param_1 + 0x2b8), cVar2 == '\0')) &&
        (*(char *)(param_1 + 0x2ea) == '\0')) && (*(char *)(param_1 + 0x2e9) == '\0')) {
      cVar2 = func_0x0001800588e0();
      if ((cVar2 != '\0') &&
         (*(char *)(*(longlong *)
                     (*(longlong *)
                       (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 0x48)
                   + 0x10) != '\x04')) {
        iVar4 = FUN_18009f4ec(0xffffffff,_DAT_1825bda30 + 0x3a8,0x14);
        if ((*(int *)(param_1 + 0x2ec) != -1) && (iVar4 != *(int *)(param_1 + 0x2ec))) {
          bVar8 = false;
        }
      }
      if ((lVar1 != 0) && (*(int *)(lVar1 + 0x10) == *(int *)(param_1 + 0x2b4))) {
        iVar4 = func_0x00018006c710(lVar1);
        sVar3 = *(short *)(param_1 + 0x2b2);
        if (sVar3 == 0) {
          sVar3 = (short)iVar4;
          *(short *)(param_1 + 0x2b2) = sVar3;
        }
        if (iVar4 != sVar3) {
          if (((uStackX_8 == 0) || (*(int *)(uStackX_8 + 4) < 1)) ||
             (*(int *)(uStackX_8 + 4) != (int)sVar3)) goto LAB_18006cb0f;
          bVar8 = true;
        }
        if (bVar8 == false) goto LAB_18006cb0f;
        lVar6 = param_1 + 0x153f;
        lVar7 = 0x28b;
        do {
          if (((*(byte *)(lVar6 + -0x43) & 1) != 0) &&
             (((*(short *)(lVar6 + -0x41) < 0 ||
               (*(short *)(param_1 + 0x2b2) <= *(short *)(lVar6 + -0x41))) ||
              (lVar5 = FUN_18006cf60(), *(int *)(lVar5 + 4) <= (int)(uint)*(byte *)(lVar6 + -0x15)))
             )) {
            func_0x00018078932a((byte *)(lVar6 + -0x43),0,0x4c);
            *(undefined2 *)(lVar6 + -0x41) = 0xffff;
            *(undefined4 *)(lVar6 + -0x3f) = 0xffffffff;
            *(undefined2 *)(lVar6 + -0x17) = 0xffff;
            *(undefined1 *)(lVar6 + 4) = 8;
            *(undefined2 *)(lVar6 + 1) = 0xffff;
            *(undefined1 *)(lVar6 + 7) = 0xff;
            bVar8 = false;
          }
          lVar6 = lVar6 + 0x4c;
          lVar7 = lVar7 + -1;
        } while (lVar7 != 0);
      }
    }
    if (bVar8 != false) {
      return bVar8;
    }
  }
LAB_18006cb0f:
  if ((lVar1 == 0) || (*(int *)(lVar1 + 0x10) != param_2)) {
    FUN_18006c080(param_1,param_2);
  }
  else {
    FUN_18006cd14(param_1);
  }
  return false;
}

