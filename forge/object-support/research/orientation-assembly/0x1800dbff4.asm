; PE exception-table range 0x1800dbff4..0x1800dc11f (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
00000001800dbff4  488bc4                   mov      rax, rsp
00000001800dbff7  48895808                 mov      qword ptr [rax + 8], rbx
00000001800dbffb  48897010                 mov      qword ptr [rax + 0x10], rsi
00000001800dbfff  57                       push     rdi
00000001800dc000  4883ec40                 sub      rsp, 0x40
00000001800dc004  f30f1029                 movss    xmm5, dword ptr [rcx]
00000001800dc008  0f57c0                   xorps    xmm0, xmm0
00000001800dc00b  f30f106108               movss    xmm4, dword ptr [rcx + 8]
00000001800dc010  498bf0                   mov      rsi, r8
00000001800dc013  f30f59e8                 mulss    xmm5, xmm0
00000001800dc017  488bda                   mov      rbx, rdx
00000001800dc01a  488bf9                   mov      rdi, rcx
00000001800dc01d  0f2970e8                 movaps   xmmword ptr [rax - 0x18], xmm6
00000001800dc021  f30f107104               movss    xmm6, dword ptr [rcx + 4]
00000001800dc026  f30f59f0                 mulss    xmm6, xmm0
00000001800dc02a  0f28cd                   movaps   xmm1, xmm5
00000001800dc02d  f30f584904               addss    xmm1, dword ptr [rcx + 4]
00000001800dc032  0f2978d8                 movaps   xmmword ptr [rax - 0x28], xmm7
00000001800dc036  0f28fc                   movaps   xmm7, xmm4
00000001800dc039  f30f59f8                 mulss    xmm7, xmm0
00000001800dc03d  0f28c6                   movaps   xmm0, xmm6
00000001800dc040  f30f5801                 addss    xmm0, dword ptr [rcx]
00000001800dc044  f30f58cf                 addss    xmm1, xmm7
00000001800dc048  f30f58c7                 addss    xmm0, xmm7
00000001800dc04c  0f5ac0                   cvtps2pd xmm0, xmm0
00000001800dc04f  0f54050a0e9b00           andps    xmm0, xmmword ptr [rip + 0x9b0e0a] ; 0x180a8ce60
00000001800dc056  660f5ad8                 cvtpd2ps xmm3, xmm0
00000001800dc05a  0f5ac1                   cvtps2pd xmm0, xmm1
00000001800dc05d  0f5405fc0d9b00           andps    xmm0, xmmword ptr [rip + 0x9b0dfc] ; 0x180a8ce60
00000001800dc064  660f5ac0                 cvtpd2ps xmm0, xmm0
00000001800dc068  0f2fc3                   comiss   xmm0, xmm3
00000001800dc06b  7615                     jbe      0x1800dc082
00000001800dc06d  0f28c5                   movaps   xmm0, xmm5
00000001800dc070  f30f5ce5                 subss    xmm4, xmm5
00000001800dc074  f30f5c4104               subss    xmm0, dword ptr [rcx + 4]
00000001800dc079  f30f5cf7                 subss    xmm6, xmm7
00000001800dc07d  0f28ec                   movaps   xmm5, xmm4
00000001800dc080  eb12                     jmp      0x1800dc094
00000001800dc082  0f28c6                   movaps   xmm0, xmm6
00000001800dc085  f30f5ce6                 subss    xmm4, xmm6
00000001800dc089  f30f5c01                 subss    xmm0, dword ptr [rcx]
00000001800dc08d  f30f5cef                 subss    xmm5, xmm7
00000001800dc091  0f28f4                   movaps   xmm6, xmm4
00000001800dc094  f30f1132                 movss    dword ptr [rdx], xmm6
00000001800dc098  488bcb                   mov      rcx, rbx
00000001800dc09b  f30f116a04               movss    dword ptr [rdx + 4], xmm5
00000001800dc0a0  f30f114208               movss    dword ptr [rdx + 8], xmm0
00000001800dc0a5  e8523cf4ff               call     0x18001fcfc
00000001800dc0aa  f30f105f08               movss    xmm3, dword ptr [rdi + 8]
00000001800dc0af  488bce                   mov      rcx, rsi
00000001800dc0b2  f30f105308               movss    xmm2, dword ptr [rbx + 8]
00000001800dc0b7  0f28c3                   movaps   xmm0, xmm3
00000001800dc0ba  f30f107b04               movss    xmm7, dword ptr [rbx + 4]
00000001800dc0bf  0f28ca                   movaps   xmm1, xmm2
00000001800dc0c2  f30f107704               movss    xmm6, dword ptr [rdi + 4]
00000001800dc0c7  f30f1027                 movss    xmm4, dword ptr [rdi]
00000001800dc0cb  f30f102b                 movss    xmm5, dword ptr [rbx]
00000001800dc0cf  f30f59c7                 mulss    xmm0, xmm7
00000001800dc0d3  f30f59ce                 mulss    xmm1, xmm6
00000001800dc0d7  f30f59fc                 mulss    xmm7, xmm4
00000001800dc0db  f30f59f5                 mulss    xmm6, xmm5
00000001800dc0df  f30f5cc8                 subss    xmm1, xmm0
00000001800dc0e3  f30f59dd                 mulss    xmm3, xmm5
00000001800dc0e7  f30f59d4                 mulss    xmm2, xmm4
00000001800dc0eb  f30f5cfe                 subss    xmm7, xmm6
00000001800dc0ef  f30f110e                 movss    dword ptr [rsi], xmm1
00000001800dc0f3  f30f5cda                 subss    xmm3, xmm2
00000001800dc0f7  f30f117e08               movss    dword ptr [rsi + 8], xmm7
00000001800dc0fc  f30f115e04               movss    dword ptr [rsi + 4], xmm3
00000001800dc101  488b5c2450               mov      rbx, qword ptr [rsp + 0x50]
00000001800dc106  488b742458               mov      rsi, qword ptr [rsp + 0x58]
00000001800dc10b  0f28742430               movaps   xmm6, xmmword ptr [rsp + 0x30]
00000001800dc110  0f287c2420               movaps   xmm7, xmmword ptr [rsp + 0x20]
00000001800dc115  4883c440                 add      rsp, 0x40
00000001800dc119  5f                       pop      rdi
00000001800dc11a  e9dd3bf4ff               jmp      0x18001fcfc
