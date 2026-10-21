/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x18006bc20; PE exception range ends: 0x18006bcec.
 * Inferred types, callees, and function extents remain provisional.
 */


void FUN_18006bc20(byte *param_1,longlong param_2)

{
  byte bVar1;
  int iVar2;
  
  bVar1 = *param_1;
  if (0x40 - *(int *)(param_2 + 0x30) < 8) {
    func_0x0001800dcfc4(param_2,(ulonglong)bVar1,8);
    iVar2 = *(int *)(param_2 + 0x30);
  }
  else {
    iVar2 = *(int *)(param_2 + 0x30) + 8;
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 8;
    *(int *)(param_2 + 0x30) = iVar2;
    *(ulonglong *)(param_2 + 0x28) = *(longlong *)(param_2 + 0x28) << 8 | (ulonglong)bVar1;
  }
  bVar1 = param_1[1];
  if (0x40 - iVar2 < 8) {
    func_0x0001800dcfc4(param_2,(ulonglong)bVar1,8);
    iVar2 = *(int *)(param_2 + 0x30);
  }
  else {
    iVar2 = iVar2 + 8;
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 8;
    *(int *)(param_2 + 0x30) = iVar2;
    *(ulonglong *)(param_2 + 0x28) = *(longlong *)(param_2 + 0x28) << 8 | (ulonglong)bVar1;
  }
  bVar1 = param_1[2];
  if (0x40 - iVar2 < 8) {
    func_0x0001800dcfc4(param_2,(ulonglong)bVar1,8);
  }
  else {
    *(int *)(param_2 + 0x24) = *(int *)(param_2 + 0x24) + 8;
    *(int *)(param_2 + 0x30) = iVar2 + 8;
    *(ulonglong *)(param_2 + 0x28) = *(longlong *)(param_2 + 0x28) << 8 | (ulonglong)bVar1;
  }
  return;
}

