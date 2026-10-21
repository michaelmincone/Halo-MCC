/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18019c604; PE exception range ends: 0x18019c69f.
 * Inferred types, callees, and function extents remain provisional.
 */


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_18019c604(short param_1,undefined4 param_2,undefined1 param_3)

{
  float fVar1;
  float *pfVar2;
  longlong unaff_GS_OFFSET;
  float fVar3;
  
  pfVar2 = (float *)FUN_1800865e8(param_2,*(undefined2 *)
                                           (*(longlong *)(&UNK_180a28d40 + (longlong)param_1 * 8) +
                                           0x38),
                                  *(longlong *)(&UNK_180a28d40 + (longlong)param_1 * 8) + 0x3a,
                                  param_3);
  if (pfVar2 != (float *)0x0) {
    fVar3 = *pfVar2 * _DAT_180a8b29c;
    pfVar2 = *(float **)
              (*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
              0x330);
    fVar1 = *pfVar2;
    *pfVar2 = fVar3;
    if (fVar3 != fVar1) {
      DAT_180b93615 = 1;
      FUN_180099a80();
      DAT_180b93617 = 1;
      FUN_180099558();
      DAT_180b93617 = 0;
      DAT_180b93615 = 0;
    }
    FUN_180085de0(param_2,0);
  }
  return;
}

