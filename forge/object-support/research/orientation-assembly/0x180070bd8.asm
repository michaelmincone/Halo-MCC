; PE exception-table range 0x180070bd8..0x180070ce6 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
0000000180070bd8  4883ec28                 sub      rsp, 0x28
0000000180070bdc  f20f10157cc2a100         movsd    xmm2, qword ptr [rip + 0xa1c27c] ; 0x180a8ce60
0000000180070be4  4533c9                   xor      r9d, r9d
0000000180070be7  f30f1021                 movss    xmm4, dword ptr [rcx]
0000000180070beb  f30f106904               movss    xmm5, dword ptr [rcx + 4]
0000000180070bf0  f30f105908               movss    xmm3, dword ptr [rcx + 8]
0000000180070bf5  0f5ac4                   cvtps2pd xmm0, xmm4
0000000180070bf8  0f29742410               movaps   xmmword ptr [rsp + 0x10], xmm6
0000000180070bfd  0f54c2                   andps    xmm0, xmm2
0000000180070c00  0f293c24                 movaps   xmmword ptr [rsp], xmm7
0000000180070c04  660f5af0                 cvtpd2ps xmm6, xmm0
0000000180070c08  0f5ac5                   cvtps2pd xmm0, xmm5
0000000180070c0b  0f5acb                   cvtps2pd xmm1, xmm3
0000000180070c0e  0f54c2                   andps    xmm0, xmm2
0000000180070c11  660f5af8                 cvtpd2ps xmm7, xmm0
0000000180070c15  0f54ca                   andps    xmm1, xmm2
0000000180070c18  0f2ff7                   comiss   xmm6, xmm7
0000000180070c1b  660f5ac1                 cvtpd2ps xmm0, xmm1
0000000180070c1f  7621                     jbe      0x180070c42
0000000180070c21  0f2ff0                   comiss   xmm6, xmm0
0000000180070c24  763b                     jbe      0x180070c61
0000000180070c26  0f2f250798a000           comiss   xmm4, dword ptr [rip + 0xa09807] ; 0x180a7a434
0000000180070c2d  458d4103                 lea      r8d, [r9 + 3]
0000000180070c31  f30f5eee                 divss    xmm5, xmm6
0000000180070c35  450f47c1                 cmova    r8d, r9d
0000000180070c39  f30f5ede                 divss    xmm3, xmm6
0000000180070c3d  0f28e5                   movaps   xmm4, xmm5
0000000180070c40  eb3f                     jmp      0x180070c81
0000000180070c42  0f2ff8                   comiss   xmm7, xmm0
0000000180070c45  761a                     jbe      0x180070c61
0000000180070c47  0f2f2de697a000           comiss   xmm5, dword ptr [rip + 0xa097e6] ; 0x180a7a434
0000000180070c4e  b801000000               mov      eax, 1
0000000180070c53  448d4003                 lea      r8d, [rax + 3]
0000000180070c57  f30f5ee7                 divss    xmm4, xmm7
0000000180070c5b  f30f5edf                 divss    xmm3, xmm7
0000000180070c5f  eb1c                     jmp      0x180070c7d
0000000180070c61  0f2f1dcc97a000           comiss   xmm3, dword ptr [rip + 0xa097cc] ; 0x180a7a434
0000000180070c68  41b805000000             mov      r8d, 5
0000000180070c6e  418d40fd                 lea      eax, [r8 - 3]
0000000180070c72  0f28dd                   movaps   xmm3, xmm5
0000000180070c75  f30f5ed8                 divss    xmm3, xmm0
0000000180070c79  f30f5ee0                 divss    xmm4, xmm0
0000000180070c7d  440f47c0                 cmova    r8d, eax
0000000180070c81  f30f5c255faba100         subss    xmm4, dword ptr [rip + 0xa1ab5f] ; 0x180a8b7e8
0000000180070c89  f30f5c1d57aba100         subss    xmm3, dword ptr [rip + 0xa1ab57] ; 0x180a8b7e8
0000000180070c91  0f28742410               movaps   xmm6, xmmword ptr [rsp + 0x10]
0000000180070c96  b99f010000               mov      ecx, 0x19f
0000000180070c9b  0f283c24                 movaps   xmm7, xmmword ptr [rsp]
0000000180070c9f  f30f5e25959da100         divss    xmm4, dword ptr [rip + 0xa19d95] ; 0x180a8aa3c
0000000180070ca7  f30f5e1d8d9da100         divss    xmm3, dword ptr [rip + 0xa19d8d] ; 0x180a8aa3c
0000000180070caf  f30f2cc4                 cvttss2si eax, xmm4
0000000180070cb3  f30f2cd3                 cvttss2si edx, xmm3
0000000180070cb7  85c0                     test     eax, eax
0000000180070cb9  410f4ec1                 cmovle   eax, r9d
0000000180070cbd  3bc1                     cmp      eax, ecx
0000000180070cbf  0f4fc1                   cmovg    eax, ecx
0000000180070cc2  85d2                     test     edx, edx
0000000180070cc4  410f4ed1                 cmovle   edx, r9d
0000000180070cc8  3bd1                     cmp      edx, ecx
0000000180070cca  0f4fd1                   cmovg    edx, ecx
0000000180070ccd  8b0d8daab200             mov      ecx, dword ptr [rip + 0xb2aa8d] ; 0x180b9b760
0000000180070cd3  410fafc8                 imul     ecx, r8d
0000000180070cd7  69c0a1010000             imul     eax, eax, 0x1a1
0000000180070cdd  03ca                     add      ecx, edx
0000000180070cdf  03c1                     add      eax, ecx
0000000180070ce1  4883c428                 add      rsp, 0x28
0000000180070ce5  c3                       ret      
