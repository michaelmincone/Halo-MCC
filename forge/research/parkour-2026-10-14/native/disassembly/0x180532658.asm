; PE exception-table range 0x180532658..0x180532905 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
0000000180532658  488bc4                   mov      rax, rsp
000000018053265b  4c894820                 mov      qword ptr [rax + 0x20], r9
000000018053265f  48895010                 mov      qword ptr [rax + 0x10], rdx
0000000180532663  55                       push     rbp
0000000180532664  53                       push     rbx
0000000180532665  56                       push     rsi
0000000180532666  57                       push     rdi
0000000180532667  4154                     push     r12
0000000180532669  4155                     push     r13
000000018053266b  4156                     push     r14
000000018053266d  4157                     push     r15
000000018053266f  488d68b9                 lea      rbp, [rax - 0x47]
0000000180532673  4881ece8000000           sub      rsp, 0xe8
000000018053267a  448b0d97546e00           mov      r9d, dword ptr [rip + 0x6e5497] ; 0x180c17b18
0000000180532681  488d3598789004           lea      rsi, [rip + 0x4907898] ; 0x184e39f20
0000000180532688  0f2970a8                 movaps   xmmword ptr [rax - 0x58], xmm6
000000018053268c  4d8be0                   mov      r12, r8
000000018053268f  0f297898                 movaps   xmmword ptr [rax - 0x68], xmm7
0000000180532693  32db                     xor      bl, bl
0000000180532695  440f294088               movaps   xmmword ptr [rax - 0x78], xmm8
000000018053269a  65488b042558000000       mov      rax, qword ptr gs:[0x58]
00000001805326a3  448bf9                   mov      r15d, ecx
00000001805326a6  b910000000               mov      ecx, 0x10
00000001805326ab  4e8b34c8                 mov      r14, qword ptr [rax + r9*8]
00000001805326af  450fb7cf                 movzx    r9d, r15w
00000001805326b3  4d8b1c0e                 mov      r11, qword ptr [r14 + rcx]
00000001805326b7  4f8d0449                 lea      r8, [r9 + r9*2]
00000001805326bb  498b4350                 mov      rax, qword ptr [r11 + 0x50]
00000001805326bf  4e8b6cc010               mov      r13, qword ptr [rax + r8*8 + 0x10]
00000001805326c4  488b05357f6e00           mov      rax, qword ptr [rip + 0x6e7f35] ; 0x180c1a600
00000001805326cb  410fb74d00               movzx    ecx, word ptr [r13]
00000001805326d0  8b7cc804                 mov      edi, dword ptr [rax + rcx*8 + 4]
00000001805326d4  418bcf                   mov      ecx, r15d
00000001805326d7  8bc7                     mov      eax, edi
00000001805326d9  48c1e81c                 shr      rax, 0x1c
00000001805326dd  488b34c6                 mov      rsi, qword ptr [rsi + rax*8]
00000001805326e1  f3440f1084bef4050000     movss    xmm8, dword ptr [rsi + rdi*4 + 0x5f4]
00000001805326eb  e8942df7ff               call     0x1804a5484
00000001805326f0  418b8dbc010000           mov      ecx, dword ptr [r13 + 0x1bc]
00000001805326f7  0f28f8                   movaps   xmm7, xmm0
00000001805326fa  83f9ff                   cmp      ecx, -1
00000001805326fd  7416                     je       0x180532715
00000001805326ff  33d2                     xor      edx, edx
0000000180532701  e856451e00               call     0x180716c5c
0000000180532706  41bb10000000             mov      r11d, 0x10
000000018053270c  0f28f0                   movaps   xmm6, xmm0
000000018053270f  4f8b1c1e                 mov      r11, qword ptr [r14 + r11]
0000000180532713  eb09                     jmp      0x18053271e
0000000180532715  f30f10b4bef0040000       movss    xmm6, dword ptr [rsi + rdi*4 + 0x4f0]
000000018053271e  488d559f                 lea      rdx, [rbp - 0x61]
0000000180532722  418bcf                   mov      ecx, r15d
0000000180532725  e80ef6f3ff               call     0x180471d38
000000018053272a  f30f104d9f               movss    xmm1, dword ptr [rbp - 0x61]
000000018053272f  410f28c0                 movaps   xmm0, xmm8
0000000180532733  f3410f59455c             mulss    xmm0, dword ptr [r13 + 0x5c]
0000000180532739  488b4557                 mov      rax, qword ptr [rbp + 0x57]
000000018053273d  f30f58c8                 addss    xmm1, xmm0
0000000180532741  410f28c0                 movaps   xmm0, xmm8
0000000180532745  f3410f594560             mulss    xmm0, dword ptr [r13 + 0x60]
000000018053274b  f30f114d9f               movss    dword ptr [rbp - 0x61], xmm1
0000000180532750  f30f104da3               movss    xmm1, dword ptr [rbp - 0x5d]
0000000180532755  f30f58c8                 addss    xmm1, xmm0
0000000180532759  410f28c0                 movaps   xmm0, xmm8
000000018053275d  f3410f594564             mulss    xmm0, dword ptr [r13 + 0x64]
0000000180532763  f30f114da3               movss    dword ptr [rbp - 0x5d], xmm1
0000000180532768  f30f104da7               movss    xmm1, dword ptr [rbp - 0x59]
000000018053276d  f30f58c8                 addss    xmm1, xmm0
0000000180532771  410f28c0                 movaps   xmm0, xmm8
0000000180532775  f3410f590424             mulss    xmm0, dword ptr [r12]
000000018053277b  f30f5800                 addss    xmm0, dword ptr [rax]
000000018053277f  f30f114da7               movss    dword ptr [rbp - 0x59], xmm1
0000000180532784  410f28c8                 movaps   xmm1, xmm8
0000000180532788  f3410f594c2404           mulss    xmm1, dword ptr [r12 + 4]
000000018053278f  f30f1145af               movss    dword ptr [rbp - 0x51], xmm0
0000000180532794  f3410f10442408           movss    xmm0, dword ptr [r12 + 8]
000000018053279b  f30f584804               addss    xmm1, dword ptr [rax + 4]
00000001805327a0  f3410f59c0               mulss    xmm0, xmm8
00000001805327a5  f30f584008               addss    xmm0, dword ptr [rax + 8]
00000001805327aa  f30f114db3               movss    dword ptr [rbp - 0x4d], xmm1
00000001805327af  f30f100d65905500         movss    xmm1, dword ptr [rip + 0x559065] ; 0x180a8b81c
00000001805327b7  410f2f4c2408             comiss   xmm1, dword ptr [r12 + 8]
00000001805327bd  f30f1145b7               movss    dword ptr [rbp - 0x49], xmm0
00000001805327c2  f30f1084be0c070000       movss    xmm0, dword ptr [rsi + rdi*4 + 0x70c]
00000001805327cb  f30f11454f               movss    dword ptr [rbp + 0x4f], xmm0
00000001805327d0  7608                     jbe      0x1805327da
00000001805327d2  0f57c0                   xorps    xmm0, xmm0
00000001805327d5  f30f11454f               movss    dword ptr [rbp + 0x4f], xmm0
00000001805327da  418bcf                   mov      ecx, r15d
00000001805327dd  e8de15f4ff               call     0x180473dc0
00000001805327e2  0fb7c0                   movzx    eax, ax
00000001805327e5  4c8d4d9f                 lea      r9, [rbp - 0x61]
00000001805327e9  33ff                     xor      edi, edi
00000001805327eb  0f28cf                   movaps   xmm1, xmm7
00000001805327ee  48897c2470               mov      qword ptr [rsp + 0x70], rdi
00000001805327f3  0f28c6                   movaps   xmm0, xmm6
00000001805327f6  48897c2468               mov      qword ptr [rsp + 0x68], rdi
00000001805327fb  488d0c40                 lea      rcx, [rax + rax*2]
00000001805327ff  498b4350                 mov      rax, qword ptr [r11 + 0x50]
0000000180532803  488b54c810               mov      rdx, qword ptr [rax + rcx*8 + 0x10]
0000000180532808  488d455f                 lea      rax, [rbp + 0x5f]
000000018053280c  4889442458               mov      qword ptr [rsp + 0x58], rax
0000000180532811  488d4557                 lea      rax, [rbp + 0x57]
0000000180532815  4889442450               mov      qword ptr [rsp + 0x50], rax
000000018053281a  488d45bf                 lea      rax, [rbp - 0x41]
000000018053281e  4889442448               mov      qword ptr [rsp + 0x48], rax
0000000180532823  488d454f                 lea      rax, [rbp + 0x4f]
0000000180532827  440fb74208               movzx    r8d, word ptr [rdx + 8]
000000018053282c  40887c2440               mov      byte ptr [rsp + 0x40], dil
0000000180532831  4889442430               mov      qword ptr [rsp + 0x30], rax
0000000180532836  488d4567                 lea      rax, [rbp + 0x67]
000000018053283a  4889442428               mov      qword ptr [rsp + 0x28], rax
000000018053283f  488d45af                 lea      rax, [rbp - 0x51]
0000000180532843  4889442420               mov      qword ptr [rsp + 0x20], rax
0000000180532848  e8f7f5fbff               call     0x1804f1e44
000000018053284d  84c0                     test     al, al
000000018053284f  755f                     jne      0x1805328b0
0000000180532851  f30f104567               movss    xmm0, dword ptr [rbp + 0x67]
0000000180532856  488d455f                 lea      rax, [rbp + 0x5f]
000000018053285a  f30f58058a835500         addss    xmm0, dword ptr [rip + 0x55838a] ; 0x180a8abec
0000000180532862  48897c2468               mov      qword ptr [rsp + 0x68], rdi
0000000180532867  4c8d4daf                 lea      r9, [rbp - 0x51]
000000018053286b  48897c2460               mov      qword ptr [rsp + 0x60], rdi
0000000180532870  4c8d459f                 lea      r8, [rbp - 0x61]
0000000180532874  48897c2458               mov      qword ptr [rsp + 0x58], rdi
0000000180532879  0f28cf                   movaps   xmm1, xmm7
000000018053287c  4889442450               mov      qword ptr [rsp + 0x50], rax
0000000180532881  488d4557                 lea      rax, [rbp + 0x57]
0000000180532885  4889442448               mov      qword ptr [rsp + 0x48], rax
000000018053288a  488d45bf                 lea      rax, [rbp - 0x41]
000000018053288e  4889442440               mov      qword ptr [rsp + 0x40], rax
0000000180532893  40887c2438               mov      byte ptr [rsp + 0x38], dil
0000000180532898  48897c2430               mov      qword ptr [rsp + 0x30], rdi
000000018053289d  48897c2428               mov      qword ptr [rsp + 0x28], rdi
00000001805328a2  48897c2420               mov      qword ptr [rsp + 0x20], rdi
00000001805328a7  e83cf6fbff               call     0x1804f1ee8
00000001805328ac  84c0                     test     al, al
00000001805328ae  742c                     je       0x1805328dc
00000001805328b0  488b4d6f                 mov      rcx, qword ptr [rbp + 0x6f]
00000001805328b4  4885c9                   test     rcx, rcx
00000001805328b7  740f                     je       0x1805328c8
00000001805328b9  f20f1045bf               movsd    xmm0, qword ptr [rbp - 0x41]
00000001805328be  8b45c7                   mov      eax, dword ptr [rbp - 0x39]
00000001805328c1  f20f1101                 movsd    qword ptr [rcx], xmm0
00000001805328c5  894108                   mov      dword ptr [rcx + 8], eax
00000001805328c8  488b4577                 mov      rax, qword ptr [rbp + 0x77]
00000001805328cc  b301                     mov      bl, 1
00000001805328ce  4885c0                   test     rax, rax
00000001805328d1  7409                     je       0x1805328dc
00000001805328d3  f30f104557               movss    xmm0, dword ptr [rbp + 0x57]
00000001805328d8  f30f1100                 movss    dword ptr [rax], xmm0
00000001805328dc  4c8d9c24e8000000         lea      r11, [rsp + 0xe8]
00000001805328e4  8ac3                     mov      al, bl
00000001805328e6  410f2873e8               movaps   xmm6, xmmword ptr [r11 - 0x18]
00000001805328eb  410f287bd8               movaps   xmm7, xmmword ptr [r11 - 0x28]
00000001805328f0  450f2843c8               movaps   xmm8, xmmword ptr [r11 - 0x38]
00000001805328f5  498be3                   mov      rsp, r11
00000001805328f8  415f                     pop      r15
00000001805328fa  415e                     pop      r14
00000001805328fc  415d                     pop      r13
00000001805328fe  415c                     pop      r12
0000000180532900  5f                       pop      rdi
0000000180532901  5e                       pop      rsi
0000000180532902  5b                       pop      rbx
0000000180532903  5d                       pop      rbp
0000000180532904  c3                       ret      
