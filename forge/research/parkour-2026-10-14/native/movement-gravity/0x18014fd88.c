/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18014fd88; PE exception range ends: 0x18014fdf0.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_18014fd88(void)

{
  undefined4 *puVar1;
  longlong unaff_GS_OFFSET;
  undefined4 uVar2;
  
  puVar1 = *(undefined4 **)
            (*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
            0x330);
  *puVar1 = 0x40857af5;
  puVar1[1] = 0x3f800000;
  puVar1[2] = 0x3a902de0;
  puVar1[6] = 0;
  *(undefined8 *)(puVar1 + 3) = _DAT_18098faf0;
  uVar2 = _DAT_180a8adc0;
  puVar1[5] = _DAT_18098faf8;
  uVar2 = func_0x00018091a14a(uVar2);
  puVar1[7] = uVar2;
  return;
}

