; PE exception-table range 0x180538914..0x180538d8a (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
0000000180538914  488bc4                   mov      rax, rsp
0000000180538917  55                       push     rbp
0000000180538918  53                       push     rbx
0000000180538919  56                       push     rsi
000000018053891a  57                       push     rdi
000000018053891b  4154                     push     r12
000000018053891d  4155                     push     r13
000000018053891f  4156                     push     r14
0000000180538921  4157                     push     r15
0000000180538923  488d68a1                 lea      rbp, [rax - 0x5f]
0000000180538927  4881ecc8000000           sub      rsp, 0xc8
000000018053892e  8b15e4f16d00             mov      edx, dword ptr [rip + 0x6df1e4] ; 0x180c17b18
0000000180538934  4032f6                   xor      sil, sil
0000000180538937  0f2970a8                 movaps   xmmword ptr [rax - 0x58], xmm6
000000018053893b  0f297898                 movaps   xmmword ptr [rax - 0x68], xmm7
000000018053893f  440f294088               movaps   xmmword ptr [rax - 0x78], xmm8
0000000180538944  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018053894d  448bf1                   mov      r14d, ecx
0000000180538950  41b910000000             mov      r9d, 0x10
0000000180538956  488b04d0                 mov      rax, qword ptr [rax + rdx*8]
000000018053895a  48894577                 mov      qword ptr [rbp + 0x77], rax
000000018053895e  0fb7d1                   movzx    edx, cx
0000000180538961  4d8b0c01                 mov      r9, qword ptr [r9 + rax]
0000000180538965  4c8d0452                 lea      r8, [rdx + rdx*2]
0000000180538969  498b4150                 mov      rax, qword ptr [r9 + 0x50]
000000018053896d  4a8b5cc010               mov      rbx, qword ptr [rax + r8*8 + 0x10]
0000000180538972  0fb70b                   movzx    ecx, word ptr [rbx]
0000000180538975  480fbf83b2010000         movsx    rax, word ptr [rbx + 0x1b2]
000000018053897d  480fbfbbb6010000         movsx    rdi, word ptr [rbx + 0x1b6]
0000000180538985  4803c3                   add      rax, rbx
0000000180538988  4889456f                 mov      qword ptr [rbp + 0x6f], rax
000000018053898c  4803fb                   add      rdi, rbx
000000018053898f  488b056a1c6e00           mov      rax, qword ptr [rip + 0x6e1c6a] ; 0x180c1a600
0000000180538996  448b64c804               mov      r12d, dword ptr [rax + rcx*8 + 4]
000000018053899b  488d0d7e159004           lea      rcx, [rip + 0x490157e] ; 0x184e39f20
00000001805389a2  418bc4                   mov      eax, r12d
00000001805389a5  48c1e81c                 shr      rax, 0x1c
00000001805389a9  4c8b2cc1                 mov      r13, qword ptr [rcx + rax*8]
00000001805389ad  418bce                   mov      ecx, r14d
00000001805389b0  480fbf838e010000         movsx    rax, word ptr [rbx + 0x18e]
00000001805389b8  4803c3                   add      rax, rbx
00000001805389bb  4889457f                 mov      qword ptr [rbp + 0x7f], rax
00000001805389bf  e82435f7ff               call     0x1804abee8
00000001805389c4  84c0                     test     al, al
00000001805389c6  0f8594030000             jne      0x180538d60
00000001805389cc  418bce                   mov      ecx, r14d
00000001805389cf  e8b436f7ff               call     0x1804ac088
00000001805389d4  84c0                     test     al, al
00000001805389d6  0f8584030000             jne      0x180538d60
00000001805389dc  488b456f                 mov      rax, qword ptr [rbp + 0x6f]
00000001805389e0  41bf01000000             mov      r15d, 1
00000001805389e6  6644397820               cmp      word ptr [rax + 0x20], r15w
00000001805389eb  0f846f030000             je       0x180538d60
00000001805389f1  80bb6e0a000006           cmp      byte ptr [rbx + 0xa6e], 6
00000001805389f8  0f8462030000             je       0x180538d60
00000001805389fe  f3430f10b4a5f0040000     movss    xmm6, dword ptr [r13 + r12*4 + 0x4f0]
0000000180538a08  4c8d45d7                 lea      r8, [rbp - 0x29]
0000000180538a0c  4533c9                   xor      r9d, r9d
0000000180538a0f  44887c2420               mov      byte ptr [rsp + 0x20], r15b
0000000180538a14  488d55c7                 lea      rdx, [rbp - 0x39]
0000000180538a18  418bce                   mov      ecx, r14d
0000000180538a1b  e8d481f7ff               call     0x1804b0bf4
0000000180538a20  f30f108bd4040000         movss    xmm1, dword ptr [rbx + 0x4d4]
0000000180538a28  418af7                   mov      sil, r15b
0000000180538a2b  f3430f598ca508030000     mulss    xmm1, dword ptr [r13 + r12*4 + 0x308]
0000000180538a35  8b8bcc010000             mov      ecx, dword ptr [rbx + 0x1cc]
0000000180538a3b  f3440f1005d4245500       movss    xmm8, dword ptr [rip + 0x5524d4] ; 0x180a8af18
0000000180538a44  884567                   mov      byte ptr [rbp + 0x67], al
0000000180538a47  410f28c0                 movaps   xmm0, xmm8
0000000180538a4b  f30f5cc1                 subss    xmm0, xmm1
0000000180538a4f  f30f59f0                 mulss    xmm6, xmm0
0000000180538a53  83f9ff                   cmp      ecx, -1
0000000180538a56  7458                     je       0x180538ab0
0000000180538a58  488b5577                 mov      rdx, qword ptr [rbp + 0x77]
0000000180538a5c  b818000000               mov      eax, 0x18
0000000180538a61  488b1410                 mov      rdx, qword ptr [rax + rdx]
0000000180538a65  0fb7c1                   movzx    eax, cx
0000000180538a68  4869c890040000           imul     rcx, rax, 0x490
0000000180538a6f  488b5250                 mov      rdx, qword ptr [rdx + 0x50]
0000000180538a73  4881c22b030000           add      rdx, 0x32b
0000000180538a7a  4803d1                   add      rdx, rcx
0000000180538a7d  4883e2fc                 and      rdx, 0xfffffffffffffffc
0000000180538a81  660f6e421c               movd     xmm0, dword ptr [rdx + 0x1c]
0000000180538a86  0f5bc0                   cvtdq2ps xmm0, xmm0
0000000180538a89  f30f5e05bf295500         divss    xmm0, dword ptr [rip + 0x5529bf] ; 0x180a8b450
0000000180538a91  0f2e059c195400           ucomiss  xmm0, dword ptr [rip + 0x54199c] ; 0x180a7a434
0000000180538a98  7a07                     jp       0x180538aa1
0000000180538a9a  7505                     jne      0x180538aa1
0000000180538a9c  4032f6                   xor      sil, sil
0000000180538a9f  eb0f                     jmp      0x180538ab0
0000000180538aa1  0f2e05402d5500           ucomiss  xmm0, dword ptr [rip + 0x552d40] ; 0x180a8b7e8
0000000180538aa8  7a02                     jp       0x180538aac
0000000180538aaa  7404                     je       0x180538ab0
0000000180538aac  f30f59f0                 mulss    xmm6, xmm0
0000000180538ab0  4533c0                   xor      r8d, r8d
0000000180538ab3  488d55d7                 lea      rdx, [rbp - 0x29]
0000000180538ab7  418bce                   mov      ecx, r14d
0000000180538aba  e88d99f3ff               call     0x18047244c
0000000180538abf  f20f1055d7               movsd    xmm2, qword ptr [rbp - 0x29]
0000000180538ac4  8b45df                   mov      eax, dword ptr [rbp - 0x21]
0000000180538ac7  448a6d67                 mov      r13b, byte ptr [rbp + 0x67]
0000000180538acb  f20f1155b7               movsd    qword ptr [rbp - 0x49], xmm2
0000000180538ad0  f30f1045bb               movss    xmm0, dword ptr [rbp - 0x45]
0000000180538ad5  8945bf                   mov      dword ptr [rbp - 0x41], eax
0000000180538ad8  f30f105dbf               movss    xmm3, dword ptr [rbp - 0x41]
0000000180538add  f20f1155a7               movsd    qword ptr [rbp - 0x59], xmm2
0000000180538ae2  8945af                   mov      dword ptr [rbp - 0x51], eax
0000000180538ae5  4584ed                   test     r13b, r13b
0000000180538ae8  7416                     je       0x180538b00
0000000180538aea  f30f104dd7               movss    xmm1, dword ptr [rbp - 0x29]
0000000180538aef  f30f5c4dc7               subss    xmm1, dword ptr [rbp - 0x39]
0000000180538af4  f30f5c45cb               subss    xmm0, dword ptr [rbp - 0x35]
0000000180538af9  f30f5c5dcf               subss    xmm3, dword ptr [rbp - 0x31]
0000000180538afe  eb05                     jmp      0x180538b05
0000000180538b00  f30f104db7               movss    xmm1, dword ptr [rbp - 0x49]
0000000180538b05  f30f106b60               movss    xmm5, dword ptr [rbx + 0x60]
0000000180538b0a  f30f10535c               movss    xmm2, dword ptr [rbx + 0x5c]
0000000180538b0f  0f28e5                   movaps   xmm4, xmm5
0000000180538b12  f30f107b64               movss    xmm7, dword ptr [rbx + 0x64]
0000000180538b17  f30f59e0                 mulss    xmm4, xmm0
0000000180538b1b  0f28c2                   movaps   xmm0, xmm2
0000000180538b1e  f30f59c1                 mulss    xmm0, xmm1
0000000180538b22  0f28cf                   movaps   xmm1, xmm7
0000000180538b25  f30f59cb                 mulss    xmm1, xmm3
0000000180538b29  f30f58e0                 addss    xmm4, xmm0
0000000180538b2d  f30f1045ab               movss    xmm0, dword ptr [rbp - 0x55]
0000000180538b32  f30f58e1                 addss    xmm4, xmm1
0000000180538b36  f30f104daf               movss    xmm1, dword ptr [rbp - 0x51]
0000000180538b3b  0f2ff4                   comiss   xmm6, xmm4
0000000180538b3e  762e                     jbe      0x180538b6e
0000000180538b40  f30f5cf4                 subss    xmm6, xmm4
0000000180538b44  f30f59d6                 mulss    xmm2, xmm6
0000000180538b48  f30f59ee                 mulss    xmm5, xmm6
0000000180538b4c  f30f5855d7               addss    xmm2, dword ptr [rbp - 0x29]
0000000180538b51  f30f59fe                 mulss    xmm7, xmm6
0000000180538b55  f30f58c5                 addss    xmm0, xmm5
0000000180538b59  f30f58cf                 addss    xmm1, xmm7
0000000180538b5d  f30f1155a7               movss    dword ptr [rbp - 0x59], xmm2
0000000180538b62  f30f1145ab               movss    dword ptr [rbp - 0x55], xmm0
0000000180538b67  f30f114daf               movss    dword ptr [rbp - 0x51], xmm1
0000000180538b6c  eb05                     jmp      0x180538b73
0000000180538b6e  f30f1055a7               movss    xmm2, dword ptr [rbp - 0x59]
0000000180538b73  448ba3bc010000           mov      r12d, dword ptr [rbx + 0x1bc]
0000000180538b7a  4183fcff                 cmp      r12d, -1
0000000180538b7e  0f84da000000             je       0x180538c5e
0000000180538b84  488b457f                 mov      rax, qword ptr [rbp + 0x7f]
0000000180538b88  f30f59c0                 mulss    xmm0, xmm0
0000000180538b8c  f30f59d2                 mulss    xmm2, xmm2
0000000180538b90  8b8004020000             mov      eax, dword ptr [rax + 0x204]
0000000180538b96  f30f59c9                 mulss    xmm1, xmm1
0000000180538b9a  83e84f                   sub      eax, 0x4f
0000000180538b9d  413bc7                   cmp      eax, r15d
0000000180538ba0  f30f58c2                 addss    xmm0, xmm2
0000000180538ba4  400f96c6                 setbe    sil
0000000180538ba8  f30f58c1                 addss    xmm0, xmm1
0000000180538bac  e8ed153e00               call     0x18091a19e
0000000180538bb1  8b4f70                   mov      ecx, dword ptr [rdi + 0x70]
0000000180538bb4  33c0                     xor      eax, eax
0000000180538bb6  85c9                     test     ecx, ecx
0000000180538bb8  7413                     je       0x180538bcd
0000000180538bba  f30f108780000000         movss    xmm0, dword ptr [rdi + 0x80]
0000000180538bc2  488d4774                 lea      rax, [rdi + 0x74]
0000000180538bc6  448abf90000000           mov      r15b, byte ptr [rdi + 0x90]
0000000180538bcd  83656700                 and      dword ptr [rbp + 0x67], 0
0000000180538bd1  488d4da7                 lea      rcx, [rbp - 0x59]
0000000180538bd5  48894c2430               mov      qword ptr [rsp + 0x30], rcx
0000000180538bda  0f28d8                   movaps   xmm3, xmm0
0000000180538bdd  488d4d67                 lea      rcx, [rbp + 0x67]
0000000180538be1  458ac7                   mov      r8b, r15b
0000000180538be4  48894c2428               mov      qword ptr [rsp + 0x28], rcx
0000000180538be9  408ad6                   mov      dl, sil
0000000180538bec  418bcc                   mov      ecx, r12d
0000000180538bef  4889442420               mov      qword ptr [rsp + 0x20], rax
0000000180538bf4  e8c7d41d00               call     0x1807160c0
0000000180538bf9  837f7000                 cmp      dword ptr [rdi + 0x70], 0
0000000180538bfd  408af0                   mov      sil, al
0000000180538c00  7421                     je       0x180538c23
0000000180538c02  f30f104567               movss    xmm0, dword ptr [rbp + 0x67]
0000000180538c07  f30f118784000000         movss    dword ptr [rdi + 0x84], xmm0
0000000180538c0f  e8c437b2ff               call     0x18005c3d8
0000000180538c14  83a78c00000000           and      dword ptr [rdi + 0x8c], 0
0000000180538c1b  f30f118788000000         movss    dword ptr [rdi + 0x88], xmm0
0000000180538c23  4084f6                   test     sil, sil
0000000180538c26  0f8434010000             je       0x180538d60
0000000180538c2c  4584ed                   test     r13b, r13b
0000000180538c2f  742d                     je       0x180538c5e
0000000180538c31  f30f1045a7               movss    xmm0, dword ptr [rbp - 0x59]
0000000180538c36  f30f5845c7               addss    xmm0, dword ptr [rbp - 0x39]
0000000180538c3b  f30f104dab               movss    xmm1, dword ptr [rbp - 0x55]
0000000180538c40  f30f584dcb               addss    xmm1, dword ptr [rbp - 0x35]
0000000180538c45  f30f1145a7               movss    dword ptr [rbp - 0x59], xmm0
0000000180538c4a  f30f1045af               movss    xmm0, dword ptr [rbp - 0x51]
0000000180538c4f  f30f5845cf               addss    xmm0, dword ptr [rbp - 0x31]
0000000180538c54  f30f114dab               movss    dword ptr [rbp - 0x55], xmm1
0000000180538c59  f30f1145af               movss    dword ptr [rbp - 0x51], xmm0
0000000180538c5e  4084f6                   test     sil, sil
0000000180538c61  0f84f9000000             je       0x180538d60
0000000180538c67  488b05ca156e00           mov      rax, qword ptr [rip + 0x6e15ca] ; 0x180c1a238
0000000180538c6e  4c8d3dab129004           lea      r15, [rip + 0x49012ab] ; 0x184e39f20
0000000180538c75  ba04000000               mov      edx, 4
0000000180538c7a  410f28d8                 movaps   xmm3, xmm8
0000000180538c7e  418bce                   mov      ecx, r14d
0000000180538c81  8bb884040000             mov      edi, dword ptr [rax + 0x484]
0000000180538c87  8bc7                     mov      eax, edi
0000000180538c89  448d42fe                 lea      r8d, [rdx - 2]
0000000180538c8d  48c1e81c                 shr      rax, 0x1c
0000000180538c91  4d8b3cc7                 mov      r15, qword ptr [r15 + rax*8]
0000000180538c95  e80adaf6ff               call     0x1804a66a4
0000000180538c9a  488b456f                 mov      rax, qword ptr [rbp + 0x6f]
0000000180538c9e  488d55a7                 lea      rdx, [rbp - 0x59]
0000000180538ca2  4533c0                   xor      r8d, r8d
0000000180538ca5  418bce                   mov      ecx, r14d
0000000180538ca8  c6401e00                 mov      byte ptr [rax + 0x1e], 0
0000000180538cac  e8b340f3ff               call     0x18046cd64
0000000180538cb1  488b4577                 mov      rax, qword ptr [rbp + 0x77]
0000000180538cb5  b9a0000000               mov      ecx, 0xa0
0000000180538cba  488b0401                 mov      rax, qword ptr [rcx + rax]
0000000180538cbe  8b480c                   mov      ecx, dword ptr [rax + 0xc]
0000000180538cc1  898b3c0a0000             mov      dword ptr [rbx + 0xa3c], ecx
0000000180538cc7  41837cbf1cff             cmp      dword ptr [r15 + rdi*4 + 0x1c], -1
0000000180538ccd  0f8480000000             je       0x180538d53
0000000180538cd3  f30f101515174a00         movss    xmm2, dword ptr [rip + 0x4a1715] ; 0x1809da3f0
0000000180538cdb  488d55c7                 lea      rdx, [rbp - 0x39]
0000000180538cdf  f30f108314020000         movss    xmm0, dword ptr [rbx + 0x214]
0000000180538ce7  418bce                   mov      ecx, r14d
0000000180538cea  f30f108b1c020000         movss    xmm1, dword ptr [rbx + 0x21c]
0000000180538cf2  0f57c2                   xorps    xmm0, xmm2
0000000180538cf5  f30f1145d7               movss    dword ptr [rbp - 0x29], xmm0
0000000180538cfa  0f57ca                   xorps    xmm1, xmm2
0000000180538cfd  f30f108318020000         movss    xmm0, dword ptr [rbx + 0x218]
0000000180538d05  0f57c2                   xorps    xmm0, xmm2
0000000180538d08  f30f114ddf               movss    dword ptr [rbp - 0x21], xmm1
0000000180538d0d  f30f1145db               movss    dword ptr [rbp - 0x25], xmm0
0000000180538d12  e80913f5ff               call     0x18048a020
0000000180538d17  458b44bf1c               mov      r8d, dword ptr [r15 + rdi*4 + 0x1c]
0000000180538d1c  488d45c7                 lea      rax, [rbp - 0x39]
0000000180538d20  c644244000               mov      byte ptr [rsp + 0x40], 0
0000000180538d25  4c8d0d3c946d00           lea      r9, [rip + 0x6d943c] ; 0x180c12168
0000000180538d2c  f3440f11442438           movss    dword ptr [rsp + 0x38], xmm8
0000000180538d33  83caff                   or       edx, 0xffffffff
0000000180538d36  f3440f11442430           movss    dword ptr [rsp + 0x30], xmm8
0000000180538d3d  418bce                   mov      ecx, r14d
0000000180538d40  4889442428               mov      qword ptr [rsp + 0x28], rax
0000000180538d45  488d45d7                 lea      rax, [rbp - 0x29]
0000000180538d49  4889442420               mov      qword ptr [rsp + 0x20], rax
0000000180538d4e  e80199c2ff               call     0x180162654
0000000180538d53  ba03000000               mov      edx, 3
0000000180538d58  418bce                   mov      ecx, r14d
0000000180538d5b  e808c1f8ff               call     0x1804c4e68
0000000180538d60  4c8d9c24c8000000         lea      r11, [rsp + 0xc8]
0000000180538d68  408ac6                   mov      al, sil
0000000180538d6b  410f2873e8               movaps   xmm6, xmmword ptr [r11 - 0x18]
0000000180538d70  410f287bd8               movaps   xmm7, xmmword ptr [r11 - 0x28]
0000000180538d75  450f2843c8               movaps   xmm8, xmmword ptr [r11 - 0x38]
0000000180538d7a  498be3                   mov      rsp, r11
0000000180538d7d  415f                     pop      r15
0000000180538d7f  415e                     pop      r14
0000000180538d81  415d                     pop      r13
0000000180538d83  415c                     pop      r12
0000000180538d85  5f                       pop      rdi
0000000180538d86  5e                       pop      rsi
0000000180538d87  5b                       pop      rbx
0000000180538d88  5d                       pop      rbp
0000000180538d89  c3                       ret      
