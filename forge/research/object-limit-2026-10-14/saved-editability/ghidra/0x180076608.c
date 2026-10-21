/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x180076608; PE exception range ends: 0x180076833.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_180076608(ulonglong param_1,undefined4 param_2,undefined4 param_3,int param_4,
                  undefined8 *param_5,undefined8 param_6,undefined8 param_7)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  uint uVar4;
  undefined8 uVar5;
  longlong lVar6;
  longlong lVar7;
  ulonglong uVar8;
  longlong unaff_GS_OFFSET;
  undefined8 extraout_XMM0_Qa;
  undefined8 uStack_58;
  undefined4 uStack_50;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined1 uStack_38;
  undefined1 uStack_37;
  undefined2 uStack_36;
  undefined8 uStack_34;
  
  uVar8 = param_1 & 0xffff;
  param_1 = param_1 & 0xffffffff;
  lVar7 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8);
  if (*(int *)(*(longlong *)(lVar7 + 0x20) + 0x1758 + uVar8 * 300) != -1) {
    return;
  }
  uVar5 = func_0x00018006bcec();
  uVar2 = 0;
  if (param_5 != (undefined8 *)0x0) {
    uStack_58 = *param_5;
    uStack_50 = *(undefined4 *)(param_5 + 1);
    uVar2 = uStack_50;
  }
  uVar2 = func_0x00018006cf1c(uVar2,param_2,param_3);
  lVar6 = FUN_18006cf60(extraout_XMM0_Qa,uVar2);
  cVar1 = FUN_1800751f4(*(undefined4 *)
                         (*(longlong *)((ulonglong)(*(uint *)(lVar6 + 8) >> 0x1c) * 8 + 0x184e39f20)
                          + 0x10 + ((ulonglong)*(uint *)(lVar6 + 8) + (longlong)param_4 * 6) * 4),
                        &uStack_58);
  if (cVar1 == '\0') {
    uStack_48 = 0xffffffff;
    uStack_34 = 0;
    uStack_44 = 0xffffffff;
    uStack_38 = 0xff;
    uStack_40 = 0xffffffff;
    uStack_3c = 0xffffffff;
    uStack_37 = 0xff;
    uStack_36 = 0;
    FUN_18010ac14(param_1,&uStack_48);
    uVar5 = 0x780038;
  }
  else {
    iVar3 = FUN_18006e7bc(uVar5,param_2,param_3,param_4,&uStack_58,param_6,param_7);
    if ((iVar3 != -1) && (uVar4 = FUN_18006ed04(uVar5,iVar3,1), uVar4 != 0xffffffff)) {
      lVar6 = *(longlong *)
               (*(longlong *)(*(longlong *)(lVar7 + 0x10) + 0x50) + 0x10 +
               (ulonglong)(uVar4 & 0xffff) * 0x18);
      if (*(short *)(lVar6 + 0x1c) != -1) {
        FUN_180076e14(param_1,uVar4);
        FUN_18006de38(uVar5,uVar2);
        FUN_1803a6054((int)*(short *)(lVar6 + 0x1c),4);
      }
      goto LAB_1800767d8;
    }
    uStack_48 = 0xffffffff;
    uStack_34 = 0;
    uStack_36 = 0;
    uStack_44 = 0xffffffff;
    uStack_38 = 0xff;
    uStack_40 = 0xffffffff;
    uStack_3c = 0xffffffff;
    uStack_37 = 0xff;
    FUN_18010ac14(param_1,&uStack_48);
    uVar5 = 0x780037;
  }
  FUN_18010a998(uVar5,&uStack_48);
  FUN_1801099cc();
LAB_1800767d8:
  cVar1 = FUN_180058eec();
  if ((cVar1 == '\0') && (*(int *)(*(longlong *)(lVar7 + 0x158) + 0x34 + uVar8 * 4) != -1)) {
    lVar7 = func_0x0001800d1070((longlong)*(int *)(*(longlong *)(lVar7 + 0x158) + 0x34 + uVar8 * 4)
                                * 0x700 + 0x18287ff94,0x22);
    *(byte *)(lVar7 + 3) = *(byte *)(lVar7 + 3) | 1;
  }
  return;
}

