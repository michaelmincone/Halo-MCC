; PE exception-table range 0x18017cb04..0x18017cc80 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017cb04  488bc4                   mov      rax, rsp
000000018017cb07  48895808                 mov      qword ptr [rax + 8], rbx
000000018017cb0b  48897010                 mov      qword ptr [rax + 0x10], rsi
000000018017cb0f  48897818                 mov      qword ptr [rax + 0x18], rdi
000000018017cb13  4c896020                 mov      qword ptr [rax + 0x20], r12
000000018017cb17  55                       push     rbp
000000018017cb18  4156                     push     r14
000000018017cb1a  4157                     push     r15
000000018017cb1c  488bec                   mov      rbp, rsp
000000018017cb1f  4883ec50                 sub      rsp, 0x50
000000018017cb23  33db                     xor      ebx, ebx
000000018017cb25  8bf9                     mov      edi, ecx
000000018017cb27  83f9ff                   cmp      ecx, -1
000000018017cb2a  0f8430010000             je       0x18017cc60
000000018017cb30  33d2                     xor      edx, edx
000000018017cb32  8bcf                     mov      ecx, edi
000000018017cb34  e87f49efff               call     0x1800714b8
000000018017cb39  84c0                     test     al, al
000000018017cb3b  0f851f010000             jne      0x18017cc60
000000018017cb41  8bcf                     mov      ecx, edi
000000018017cb43  e8e848efff               call     0x180071430
000000018017cb48  84c0                     test     al, al
000000018017cb4a  0f8510010000             jne      0x18017cc60
000000018017cb50  8b0dc2afa900             mov      ecx, dword ptr [rip + 0xa9afc2] ; 0x180c17b18
000000018017cb56  448d6301                 lea      r12d, [rbx + 1]
000000018017cb5a  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018017cb63  ba10000000               mov      edx, 0x10
000000018017cb68  488b04c8                 mov      rax, qword ptr [rax + rcx*8]
000000018017cb6c  0fb7cf                   movzx    ecx, di
000000018017cb6f  488b1410                 mov      rdx, qword ptr [rax + rdx]
000000018017cb73  4c8d3449                 lea      r14, [rcx + rcx*2]
000000018017cb77  4c8b7a50                 mov      r15, qword ptr [rdx + 0x50]
000000018017cb7b  4b8b74f710               mov      rsi, qword ptr [r15 + r14*8 + 0x10]
000000018017cb80  8b8638010000             mov      eax, dword ptr [rsi + 0x138]
000000018017cb86  c1e802                   shr      eax, 2
000000018017cb89  4184c4                   test     r12b, al
000000018017cb8c  7516                     jne      0x18017cba4
000000018017cb8e  8bcf                     mov      ecx, edi
000000018017cb90  e80fffffff               call     0x18017caa4
000000018017cb95  84c0                     test     al, al
000000018017cb97  750b                     jne      0x18017cba4
000000018017cb99  8bcf                     mov      ecx, edi
000000018017cb9b  e8f0050000               call     0x18017d190
000000018017cba0  84c0                     test     al, al
000000018017cba2  7408                     je       0x18017cbac
000000018017cba4  418adc                   mov      bl, r12b
000000018017cba7  e9b4000000               jmp      0x18017cc60
000000018017cbac  488d55f0                 lea      rdx, [rbp - 0x10]
000000018017cbb0  8bcf                     mov      ecx, edi
000000018017cbb2  e881512f00               call     0x180471d38
000000018017cbb7  430fb654f704             movzx    edx, byte ptr [r15 + r14*8 + 4]
000000018017cbbd  440fbf461a               movsx    r8d, word ptr [rsi + 0x1a]
000000018017cbc2  488b0d67d6a900           mov      rcx, qword ptr [rip + 0xa9d667] ; 0x180c1a230
000000018017cbc9  e8c2083200               call     0x18049d490
000000018017cbce  440fbf561c               movsx    r10d, word ptr [rsi + 0x1c]
000000018017cbd3  4183faff                 cmp      r10d, -1
000000018017cbd7  7521                     jne      0x18017cbfa
000000018017cbd9  4885c0                   test     rax, rax
000000018017cbdc  740a                     je       0x18017cbe8
000000018017cbde  f20f104008               movsd    xmm0, qword ptr [rax + 8]
000000018017cbe3  8b4010                   mov      eax, dword ptr [rax + 0x10]
000000018017cbe6  eb08                     jmp      0x18017cbf0
000000018017cbe8  f20f1045f0               movsd    xmm0, qword ptr [rbp - 0x10]
000000018017cbed  8b45f8                   mov      eax, dword ptr [rbp - 8]
000000018017cbf0  f20f1145e0               movsd    qword ptr [rbp - 0x20], xmm0
000000018017cbf5  8945e8                   mov      dword ptr [rbp - 0x18], eax
000000018017cbf8  eb26                     jmp      0x18017cc20
000000018017cbfa  e8edf0eeff               call     0x18006bcec
000000018017cbff  4885c0                   test     rax, rax
000000018017cc02  741c                     je       0x18017cc20
000000018017cc04  e8e3f0eeff               call     0x18006bcec
000000018017cc09  4c8d45e0                 lea      r8, [rbp - 0x20]
000000018017cc0d  48895c2420               mov      qword ptr [rsp + 0x20], rbx
000000018017cc12  418bd2                   mov      edx, r10d
000000018017cc15  488bc8                   mov      rcx, rax
000000018017cc18  4533c9                   xor      r9d, r9d
000000018017cc1b  e84416efff               call     0x18006e264
000000018017cc20  f30f104de0               movss    xmm1, dword ptr [rbp - 0x20]
000000018017cc25  f30f1055e4               movss    xmm2, dword ptr [rbp - 0x1c]
000000018017cc2a  f30f5c55f4               subss    xmm2, dword ptr [rbp - 0xc]
000000018017cc2f  f30f5c4df0               subss    xmm1, dword ptr [rbp - 0x10]
000000018017cc34  f30f1045e8               movss    xmm0, dword ptr [rbp - 0x18]
000000018017cc39  f30f5c45f8               subss    xmm0, dword ptr [rbp - 8]
000000018017cc3e  0fb6db                   movzx    ebx, bl
000000018017cc41  f30f59d2                 mulss    xmm2, xmm2
000000018017cc45  f30f59c9                 mulss    xmm1, xmm1
000000018017cc49  f30f59c0                 mulss    xmm0, xmm0
000000018017cc4d  f30f58d1                 addss    xmm2, xmm1
000000018017cc51  f30f58d0                 addss    xmm2, xmm0
000000018017cc55  0f2f1534e09000           comiss   xmm2, dword ptr [rip + 0x90e034] ; 0x180a8ac90
000000018017cc5c  410f43dc                 cmovae   ebx, r12d
000000018017cc60  4c8d5c2450               lea      r11, [rsp + 0x50]
000000018017cc65  8ac3                     mov      al, bl
000000018017cc67  498b5b20                 mov      rbx, qword ptr [r11 + 0x20]
000000018017cc6b  498b7328                 mov      rsi, qword ptr [r11 + 0x28]
000000018017cc6f  498b7b30                 mov      rdi, qword ptr [r11 + 0x30]
000000018017cc73  4d8b6338                 mov      r12, qword ptr [r11 + 0x38]
000000018017cc77  498be3                   mov      rsp, r11
000000018017cc7a  415f                     pop      r15
000000018017cc7c  415e                     pop      r14
000000018017cc7e  5d                       pop      rbp
000000018017cc7f  c3                       ret      
