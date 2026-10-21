/* REA evidence: ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3; source: respawn-eligibility-batch.json */

undefined1 FUN_18017cb04(uint param_1)

{
  longlong lVar1;
  char cVar2;
  longlong lVar3;
  undefined8 uVar4;
  undefined1 uVar5;
  ulonglong uVar6;
  undefined8 local_38;
  float local_30;
  float local_28;
  float fStack_24;
  float local_20;
  
  uVar5 = 0;
  uVar6 = (ulonglong)param_1;
  if (((param_1 != 0xffffffff) && (cVar2 = FUN_1800714b8(uVar6,0), cVar2 == '\0')) &&
     (cVar2 = FUN_180071430(param_1), cVar2 == '\0')) {
    lVar3 = *(longlong *)
             (*(longlong *)
               (*(longlong *)((longlong)ThreadLocalStoragePointer + (ulonglong)_tls_index * 8) +
               0x10) + 0x50);
    lVar1 = *(longlong *)(lVar3 + 0x10 + (uVar6 & 0xffff) * 0x18);
    if ((((*(uint *)(lVar1 + 0x138) >> 2 & 1) == 0) && (cVar2 = FUN_18017caa4(uVar6), cVar2 == '\0')
        ) && (cVar2 = FUN_18017d190(param_1), cVar2 == '\0')) {
      FUN_180471d38(param_1,&local_28);
      lVar3 = FUN_18049d490(DAT_180c1a230,*(undefined1 *)(lVar3 + 4 + (uVar6 & 0xffff) * 0x18),
                            (int)*(short *)(lVar1 + 0x1a));
      uVar6 = (ulonglong)(uint)(int)*(short *)(lVar1 + 0x1c);
      if ((int)*(short *)(lVar1 + 0x1c) == 0xffffffff) {
        if (lVar3 == 0) {
          local_38 = CONCAT44(fStack_24,local_28);
          local_30 = local_20;
        }
        else {
          local_38 = *(undefined8 *)(lVar3 + 8);
          local_30 = *(float *)(lVar3 + 0x10);
        }
      }
      else {
        lVar3 = FUN_18006bcec();
        if (lVar3 != 0) {
          uVar4 = FUN_18006bcec();
          FUN_18006e264(uVar4,uVar6 & 0xffffffff,&local_38,0,0);
        }
      }
      uVar5 = 0;
      if (0.25 <= (local_38._4_4_ - fStack_24) * (local_38._4_4_ - fStack_24) +
                  ((float)local_38 - local_28) * ((float)local_38 - local_28) +
                  (local_30 - local_20) * (local_30 - local_20)) {
        uVar5 = 1;
      }
    }
    else {
      uVar5 = 1;
    }
  }
  return uVar5;
}

