/* ev_db4a03b3025ddcdba9ede1960ab7d8c665bc5ed31c50f1c6dadb5d6c969fc6d8 */

void FUN_1800dbff4(float *param_1,float *param_2,float *param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  
  fVar2 = param_1[2];
  fVar3 = *param_1 * 0.0;
  fVar4 = param_1[1] * 0.0;
  fVar6 = fVar2 * 0.0;
  if (ABS(fVar3 + param_1[1] + fVar6) <= ABS(fVar4 + *param_1 + fVar6)) {
    fVar5 = fVar2 - fVar4;
    fVar1 = fVar4 - *param_1;
    fVar2 = fVar3 - fVar6;
  }
  else {
    fVar2 = fVar2 - fVar3;
    fVar1 = fVar3 - param_1[1];
    fVar5 = fVar4 - fVar6;
  }
  *param_2 = fVar5;
  param_2[1] = fVar2;
  param_2[2] = fVar1;
  FUN_18001fcfc(param_2);
  fVar2 = param_1[2];
  fVar3 = param_2[2];
  fVar4 = param_2[1];
  fVar6 = param_1[1];
  fVar1 = *param_1;
  fVar5 = *param_2;
  *param_3 = fVar3 * fVar6 - fVar2 * fVar4;
  param_3[2] = fVar4 * fVar1 - fVar6 * fVar5;
  param_3[1] = fVar2 * fVar5 - fVar3 * fVar1;
  FUN_18001fcfc(param_3);
  return;
}

