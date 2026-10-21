; PE exception-table range 0x180534338..0x180534479 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
0000000180534338  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018053433d  48896c2410               mov      qword ptr [rsp + 0x10], rbp
0000000180534342  4889742418               mov      qword ptr [rsp + 0x18], rsi
0000000180534347  57                       push     rdi
0000000180534348  4154                     push     r12
000000018053434a  4155                     push     r13
000000018053434c  4156                     push     r14
000000018053434e  4157                     push     r15
0000000180534350  4883ec50                 sub      rsp, 0x50
0000000180534354  448b05bd376e00           mov      r8d, dword ptr [rip + 0x6e37bd] ; 0x180c17b18
000000018053435b  4c8bca                   mov      r9, rdx
000000018053435e  65488b042558000000       mov      rax, qword ptr gs:[0x58]
0000000180534367  33ff                     xor      edi, edi
0000000180534369  8be9                     mov      ebp, ecx
000000018053436b  b910000000               mov      ecx, 0x10
0000000180534370  4e8b3cc0                 mov      r15, qword ptr [rax + r8*8]
0000000180534374  448d6f01                 lea      r13d, [rdi + 1]
0000000180534378  440fb7c5                 movzx    r8d, bp
000000018053437c  498b040f                 mov      rax, qword ptr [r15 + rcx]
0000000180534380  498bc9                   mov      rcx, r9
0000000180534383  4f8d2440                 lea      r12, [r8 + r8*2]
0000000180534387  488b5050                 mov      rdx, qword ptr [rax + 0x50]
000000018053438b  498b01                   mov      rax, qword ptr [r9]
000000018053438e  4e8b74e210               mov      r14, qword ptr [rdx + r12*8 + 0x10]
0000000180534393  418bd5                   mov      edx, r13d
0000000180534396  490fbf9eb2010000         movsx    rbx, word ptr [r14 + 0x1b2]
000000018053439e  4903de                   add      rbx, r14
00000001805343a1  ff10                     call     qword ptr [rax]
00000001805343a3  488bf0                   mov      rsi, rax
00000001805343a6  6644396b20               cmp      word ptr [rbx + 0x20], r13w
00000001805343ab  0f84a8000000             je       0x180534459
00000001805343b1  4180be6e0a000006         cmp      byte ptr [r14 + 0xa6e], 6
00000001805343b9  0f849a000000             je       0x180534459
00000001805343bf  8a4809                   mov      cl, byte ptr [rax + 9]
00000001805343c2  418bd5                   mov      edx, r13d
00000001805343c5  8a5818                   mov      bl, byte ptr [rax + 0x18]
00000001805343c8  f30f10051c685500         movss    xmm0, dword ptr [rip + 0x55681c] ; 0x180a8abec
00000001805343d0  8ac3                     mov      al, bl
00000001805343d2  448b4610                 mov      r8d, dword ptr [rsi + 0x10]
00000001805343d6  f6d8                     neg      al
00000001805343d8  8b0536916600             mov      eax, dword ptr [rip + 0x669136] ; 0x180b9d514
00000001805343de  884c2448                 mov      byte ptr [rsp + 0x48], cl
00000001805343e2  451bc9                   sbb      r9d, r9d
00000001805343e5  89442440                 mov      dword ptr [rsp + 0x40], eax
00000001805343e9  4181e155010000           and      r9d, 0x155
00000001805343f0  0fb7057dbd3602           movzx    eax, word ptr [rip + 0x236bd7d] ; 0x1828a0174
00000001805343f7  4183c14f                 add      r9d, 0x4f
00000001805343fb  6689442438               mov      word ptr [rsp + 0x38], ax
0000000180534400  8bcd                     mov      ecx, ebp
0000000180534402  6644896c2430             mov      word ptr [rsp + 0x30], r13w
0000000180534408  f30f11442428             movss    dword ptr [rsp + 0x28], xmm0
000000018053440e  44894c2420               mov      dword ptr [rsp + 0x20], r9d
0000000180534413  41b91a010000             mov      r9d, 0x11a
0000000180534419  e88a5af9ff               call     0x1804c9ea8
000000018053441e  4885c0                   test     rax, rax
0000000180534421  7436                     je       0x180534459
0000000180534423  40387e19                 cmp      byte ptr [rsi + 0x19], dil
0000000180534427  740b                     je       0x180534434
0000000180534429  488d561c                 lea      rdx, [rsi + 0x1c]
000000018053442d  8bcd                     mov      ecx, ebp
000000018053442f  e80cb4f6ff               call     0x18049f840
0000000180534434  84db                     test     bl, bl
0000000180534436  741c                     je       0x180534454
0000000180534438  b810000000               mov      eax, 0x10
000000018053443d  498b0407                 mov      rax, qword ptr [r15 + rax]
0000000180534441  488b4850                 mov      rcx, qword ptr [rax + 0x50]
0000000180534445  4a8b44e110               mov      rax, qword ptr [rcx + r12*8 + 0x10]
000000018053444a  c780b40d00000000003f     mov      dword ptr [rax + 0xdb4], 0x3f000000
0000000180534454  bf02000000               mov      edi, 2
0000000180534459  4c8d5c2450               lea      r11, [rsp + 0x50]
000000018053445e  8bc7                     mov      eax, edi
0000000180534460  498b5b30                 mov      rbx, qword ptr [r11 + 0x30]
0000000180534464  498b6b38                 mov      rbp, qword ptr [r11 + 0x38]
0000000180534468  498b7340                 mov      rsi, qword ptr [r11 + 0x40]
000000018053446c  498be3                   mov      rsp, r11
000000018053446f  415f                     pop      r15
0000000180534471  415e                     pop      r14
0000000180534473  415d                     pop      r13
0000000180534475  415c                     pop      r12
0000000180534477  5f                       pop      rdi
0000000180534478  c3                       ret      
