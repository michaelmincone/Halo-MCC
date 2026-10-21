/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18019c588; PE exception range ends: 0x18019c603.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_18019c588(undefined8 param_1,undefined4 param_2)

{
  short sVar1;
  longlong lVar2;
  undefined4 *puVar3;
  longlong lVar4;
  undefined8 unaff_RDI;
  ulonglong uVar5;
  ulonglong uVar6;
  longlong lVar7;
  longlong unaff_GS_OFFSET;
  undefined4 uVar8;
  undefined8 extraout_XMM0_Qa;
  
  puVar3 = *(undefined4 **)
            (*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
            0x330);
  *puVar3 = 0x40857af5;
  puVar3[1] = 0x3f800000;
  puVar3[2] = 0x3a902de0;
  puVar3[6] = 0;
  *(undefined8 *)(puVar3 + 3) = _DAT_18098faf0;
  uVar8 = _DAT_180a8adc0;
  puVar3[5] = _DAT_18098faf8;
  uVar8 = func_0x00018091a14a(uVar8);
  puVar3[7] = uVar8;
  lVar2 = func_0x000180085754(param_2);
  uVar6 = (ulonglong)*(ushort *)((longlong)*(short *)(lVar2 + 0x14) + 0x2c + lVar2);
  lVar7 = uVar6 * 3;
  lVar4 = *(longlong *)(uRam0000000180c1a838 + 0x50);
  sVar1 = *(short *)(lVar4 + 2 + uVar6 * 0x18);
  uVar5 = uRam0000000180c1a838;
  if ((*(byte *)(lVar4 + 6 + uVar6 * 0x18) & 2) == 0) {
    uVar6 = (ulonglong)**(ushort **)(&UNK_180a28d40 + (longlong)sVar1 * 8);
  }
  else if (sVar1 == -1) {
    uVar6 = 4;
  }
  else {
    uVar5 = (ulonglong)(*(uint *)(_DAT_180c1a230 + 0x434) >> 0x1c);
    uVar6 = (ulonglong)
            *(ushort *)
             (*(longlong *)(uVar5 * 8 + 0x184e39f20) + 6 +
             ((ulonglong)*(uint *)(_DAT_180c1a230 + 0x434) + (longlong)sVar1 * 6) * 4);
  }
  puVar3 = (undefined4 *)
           func_0x000180085d70(lVar2,*(undefined4 *)
                                      ((longlong)
                                       *(short *)((longlong)*(short *)(lVar2 + 0x14) + 0x3a + lVar2)
                                       + 0x34 + lVar2),uVar5,lVar2,unaff_RDI);
  if (puVar3 != (undefined4 *)0x0) {
    uVar8 = FUN_180086ba8(extraout_XMM0_Qa,uVar6 & 0xffff,*(undefined2 *)(lVar4 + 4 + lVar7 * 8),0);
    *puVar3 = uVar8;
  }
  lVar4 = func_0x000180085754(param_2);
  *(undefined2 *)(lVar4 + 0x14) = *(undefined2 *)((longlong)*(short *)(lVar4 + 0x14) + 0x3a + lVar4)
  ;
  return;
}

