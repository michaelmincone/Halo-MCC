/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18014fc94; PE exception range ends: 0x18014fd67.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_18014fc94(void)

{
  longlong lVar1;
  undefined4 *puVar2;
  longlong unaff_GS_OFFSET;
  undefined4 uVar3;
  
  _DAT_180b96068 = FUN_1800a00fc(4,&UNK_1809d9fc8,0,0x20,0,&UNK_18014fc74,0,0);
  lVar1 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8);
  _DAT_180b9606c = *(undefined4 *)(lVar1 + 0x28);
  puVar2 = (undefined4 *)
           ((ulonglong)*(uint *)((longlong)_DAT_180b96068 * 0x30 + 0x1827c5700) +
           *(longlong *)(lVar1 + 0x700));
  *puVar2 = 0x40857af5;
  puVar2[1] = 0x3f800000;
  puVar2[2] = 0x3a902de0;
  puVar2[6] = 0;
  *(undefined8 *)(puVar2 + 3) = _DAT_18098faf0;
  uVar3 = _DAT_180a8adc0;
  *(undefined4 **)(lVar1 + 0x330) = puVar2;
  puVar2[5] = _DAT_18098faf8;
  uVar3 = func_0x00018091a14a(uVar3);
  puVar2[7] = uVar3;
  return;
}

