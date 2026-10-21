/* Ghidra targeted fallback; no whole-program autoanalysis.
 * Entry: 0x1804f1e44; PE exception range ends: 0x1804f1ee8.
 * Inferred types, callees, and function extents remain provisional.
 */


void FUN_1804f1e44(undefined4 param_1,float param_2,undefined2 param_3,undefined8 param_4,
                  undefined8 param_5,undefined8 param_6,undefined8 param_7,undefined8 param_8,
                  undefined1 param_9,undefined8 param_10,undefined8 param_11,undefined8 param_12,
                  undefined8 param_13,undefined8 param_14,undefined8 param_15)

{
  float fVar1;
  
  fVar1 = (float)func_0x00018014fe2c(param_3,param_2,param_1);
  FUN_1804f1ee8(param_1,fVar1 * param_2,param_4,param_5,param_6,param_7,0,param_9,param_10,param_11,
                param_12,0,param_14,param_15);
  return;
}

