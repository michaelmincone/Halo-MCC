/* REA evidence: ev_0b466879f8171a12d02081074261691c3dcaf721c25c5611b17c508e9f943e21; source: physics-override-batch.json */

void FUN_1804b20dc(float *param_1,undefined8 param_2,byte *param_3,longlong param_4)

{
  float fVar1;
  ushort uVar2;
  ushort uVar3;
  byte bVar4;
  undefined1 uVar5;
  char cVar6;
  float fVar7;
  byte bVar8;
  float fVar9;
  
  param_1[0x21] = -NAN;
  *(undefined2 *)((longlong)param_1 + 0x12) = *(undefined2 *)(param_3 + 0x1a);
  *(byte *)((longlong)param_1 + 0x11) = param_3[1];
  fVar9 = *(float *)(param_3 + 8);
  fVar1 = *(float *)(param_3 + 0xc);
  fVar7 = *(float *)(param_3 + 0x10);
  *param_1 = *(float *)(param_3 + 4);
  param_1[1] = fVar9;
  param_1[2] = fVar1;
  param_1[3] = fVar7;
  *(byte *)(param_1 + 4) = param_3[0x14];
  *(undefined2 *)(param_1 + 5) = 0;
  *(byte *)((longlong)param_1 + 0x16) = param_3[2];
  *(undefined1 *)((longlong)param_1 + 0x17) = 0;
  bVar4 = *param_3;
  if ((*param_3 & 0x1f) == 0) {
    bVar4 = 0x1f;
  }
  *(byte *)(param_1 + 6) = bVar4;
  if (param_4 == 0) {
    uVar5 = 0xff;
  }
  else {
    uVar5 = *(undefined1 *)(param_4 + 0x25);
  }
  *(undefined1 *)((longlong)param_1 + 0x19) = uVar5;
  *(undefined4 *)((longlong)param_1 + 0x1a) = 0xff00ff;
  *(byte *)((longlong)param_1 + 0x1e) = param_3[0x15];
  *(undefined2 *)(param_1 + 8) = *(undefined2 *)(param_3 + 0x16);
  *(undefined2 *)((longlong)param_1 + 0x22) = *(undefined2 *)(param_3 + 0x18);
  param_1[9] = *(float *)(param_3 + 0x1c);
  param_1[10] = 0.0;
  param_1[0xb] = *(float *)(param_3 + 0x20);
  param_1[0xc] = *(float *)(param_3 + 0x24);
  param_1[0xd] = *(float *)(param_3 + 0x34);
  param_1[0xe] = *(float *)(param_3 + 0x38);
  if (param_4 != 0) {
    uVar2 = *(ushort *)((longlong)param_1 + 0x12) | 0x80;
    if ((*(byte *)(param_4 + 0x2b) & 1) == 0) {
      uVar2 = *(ushort *)((longlong)param_1 + 0x12) & 0xff7f;
    }
    *(ushort *)((longlong)param_1 + 0x12) = uVar2;
    uVar3 = uVar2 | 0x100;
    if ((*(byte *)(param_4 + 0x2b) & 2) == 0) {
      uVar3 = uVar2 & 0xfeff;
    }
    *(ushort *)((longlong)param_1 + 0x12) = uVar3;
    uVar2 = uVar3 | 0x400;
    if ((*(byte *)(param_4 + 0x2b) & 4) == 0) {
      uVar2 = uVar3 & 0xfbff;
    }
    *(ushort *)((longlong)param_1 + 0x12) = uVar2;
    uVar3 = uVar2 | 0x200;
    if ((*(byte *)(param_4 + 0x2b) & 8) == 0) {
      uVar3 = uVar2 & 0xfdff;
    }
    *(ushort *)((longlong)param_1 + 0x12) = uVar3;
    *(undefined1 *)(param_1 + 5) = *(undefined1 *)(param_4 + 0x41);
    *(undefined1 *)((longlong)param_1 + 0x15) = *(undefined1 *)(param_4 + 0x42);
    bVar4 = *(byte *)((longlong)param_1 + 0x16);
    if ((*(byte *)(param_4 + 0x43) & 0x1f) != 0) {
      bVar4 = *(byte *)(param_4 + 0x43);
    }
    *(byte *)((longlong)param_1 + 0x16) = bVar4;
    *(undefined1 *)((longlong)param_1 + 0x17) = *(undefined1 *)(param_4 + 0x20);
    bVar4 = *(byte *)(param_4 + 0x24);
    if ((bVar4 & 0xe0) == 0) {
      bVar8 = *(byte *)(param_1 + 6);
      if ((bVar4 & 0x1f) != 0) {
        bVar8 = bVar4;
      }
      *(byte *)(param_1 + 6) = bVar8;
    }
    *(undefined1 *)((longlong)param_1 + 0x19) = *(undefined1 *)(param_4 + 0x25);
    *(undefined1 *)((longlong)param_1 + 0x1a) = *(undefined1 *)(param_4 + 0x28);
    uVar5 = FUN_180122a10(*(undefined4 *)(param_4 + 0x44));
    *(undefined1 *)((longlong)param_1 + 0x1d) = uVar5;
    *(undefined1 *)((longlong)param_1 + 0x1b) = *(undefined1 *)(param_4 + 0x29);
    *(undefined1 *)(param_1 + 7) = *(undefined1 *)(param_4 + 0x2a);
    if (0 < *(short *)(param_4 + 0x2c)) {
      *(short *)(param_1 + 8) = *(short *)(param_4 + 0x2c);
    }
    if (*(short *)(param_4 + 0x2e) != 0) {
      *(short *)((longlong)param_1 + 0x22) = *(short *)(param_4 + 0x2e);
    }
    cVar6 = *(char *)(param_4 + 0x40);
    if (cVar6 == '\0') {
      cVar6 = *(char *)(param_1 + 4);
    }
    else {
      *(char *)(param_1 + 4) = cVar6;
    }
    fVar9 = *(float *)(param_4 + 0x30);
    if (cVar6 == '\0') {
      fVar9 = 0.0;
    }
    else if (fVar9 <= 0.0001) {
      fVar9 = *param_1;
    }
    *param_1 = fVar9;
    if (*(char *)(param_1 + 4) == '\x03') {
      fVar9 = *(float *)(param_4 + 0x34);
      if (fVar9 <= 0.0001) {
        fVar9 = param_1[1];
      }
    }
    else {
      fVar9 = 0.0;
    }
    param_1[1] = fVar9;
    fVar9 = *(float *)(param_4 + 0x38);
    if ((byte)(*(char *)(param_1 + 4) - 2U) < 2) {
      if (fVar9 <= 0.0001) {
        fVar9 = param_1[2];
      }
    }
    else {
      fVar9 = 0.0;
    }
    param_1[2] = fVar9;
    fVar9 = *(float *)(param_4 + 0x3c);
    if ((byte)(*(char *)(param_1 + 4) - 2U) < 2) {
      if (fVar9 <= 0.0001) {
        fVar9 = param_1[3];
      }
    }
    else {
      fVar9 = 0.0;
    }
    param_1[3] = fVar9;
    if (0.0001 < ABS(*(float *)(param_4 + 0x54))) {
      param_1[9] = *(float *)(param_4 + 0x54);
    }
  }
  fVar9 = *(float *)(param_3 + 0x48);
  cVar6 = *(char *)(param_1 + 4);
  param_1[0xf] = fVar9;
  fVar1 = *(float *)(param_3 + 0x58);
  param_1[0x10] = fVar1;
  if (cVar6 == '\x01') {
    fVar7 = *(float *)(param_3 + 0x68);
    if (*(float *)(param_3 + 0x68) == -NAN) {
      fVar7 = fVar9;
    }
    param_1[0xf] = fVar7;
    fVar9 = *(float *)(param_3 + 0x78);
  }
  else if (cVar6 == '\x02') {
    fVar7 = *(float *)(param_3 + 0x88);
    if (*(float *)(param_3 + 0x88) == -NAN) {
      fVar7 = fVar9;
    }
    param_1[0xf] = fVar7;
    fVar9 = *(float *)(param_3 + 0x98);
  }
  else {
    if (cVar6 != '\x03') goto LAB_1804b23c9;
    fVar7 = *(float *)(param_3 + 0xa8);
    if (*(float *)(param_3 + 0xa8) == -NAN) {
      fVar7 = fVar9;
    }
    param_1[0xf] = fVar7;
    fVar9 = *(float *)(param_3 + 0xb8);
  }
  if (fVar9 == -NAN) {
    fVar9 = fVar1;
  }
  param_1[0x10] = fVar9;
LAB_1804b23c9:
  if ((*(ushort *)((longlong)param_1 + 0x12) & 0x8000) != 0) {
    *(undefined2 *)((longlong)param_1 + 0x12) = 0;
  }
  if (0x1b < *(byte *)((longlong)param_1 + 0x11)) {
    *(undefined1 *)((longlong)param_1 + 0x11) = 0;
  }
  if (3 < *(byte *)(param_1 + 4)) {
    param_1[0] = 0.0;
    param_1[1] = 0.0;
    param_1[2] = 0.0;
    param_1[3] = 0.0;
    *(undefined1 *)(param_1 + 4) = 0;
  }
  if (2 < *(byte *)(param_1 + 5)) {
    *(undefined1 *)(param_1 + 5) = 0;
  }
  if (0x19 < *(byte *)((longlong)param_1 + 0x15)) {
    *(undefined1 *)((longlong)param_1 + 0x15) = 0;
  }
  if ((*(byte *)((longlong)param_1 + 0x16) & 0xe0) != 0) {
    *(undefined1 *)((longlong)param_1 + 0x16) = 0;
  }
  if (2 < *(byte *)((longlong)param_1 + 0x17)) {
    *(undefined1 *)((longlong)param_1 + 0x17) = 0;
  }
  if (((uint)param_1[6] & 0xe0) != 0) {
    *(undefined1 *)(param_1 + 6) = 0;
  }
  if (9 < (byte)(*(char *)((longlong)param_1 + 0x19) + 1U)) {
    *(undefined1 *)((longlong)param_1 + 0x19) = 0;
  }
  if (1 < *(byte *)((longlong)param_1 + 0x1e)) {
    *(undefined1 *)((longlong)param_1 + 0x1e) = 0;
  }
  return;
}

