; PE exception-table range 0x180070118..0x1800703aa (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
0000000180070118  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018007011d  4889742410               mov      qword ptr [rsp + 0x10], rsi
0000000180070122  48897c2418               mov      qword ptr [rsp + 0x18], rdi
0000000180070127  55                       push     rbp
0000000180070128  4154                     push     r12
000000018007012a  4155                     push     r13
000000018007012c  4156                     push     r14
000000018007012e  4157                     push     r15
0000000180070130  488bec                   mov      rbp, rsp
0000000180070133  4883ec50                 sub      rsp, 0x50
0000000180070137  4c8b7550                 mov      r14, qword ptr [rbp + 0x50]
000000018007013b  488db940d60000           lea      rdi, [rcx + 0xd640]
0000000180070142  498bd8                   mov      rbx, r8
0000000180070145  446bfa15                 imul     r15d, edx, 0x15
0000000180070149  4c63c2                   movsxd   r8, edx
000000018007014c  488db13f150000           lea      rsi, [rcx + 0x153f]
0000000180070153  496bc015                 imul     rax, r8, 0x15
0000000180070157  41b902000000             mov      r9d, 2
000000018007015d  48c745d815000000         mov      qword ptr [rbp - 0x28], 0x15
0000000180070165  488945d0                 mov      qword ptr [rbp - 0x30], rax
0000000180070169  4983c646                 add      r14, 0x46
000000018007016d  496bc03f                 imul     rax, r8, 0x3f
0000000180070171  4c8be1                   mov      r12, rcx
0000000180070174  458be9                   mov      r13d, r9d
0000000180070177  4803f8                   add      rdi, rax
000000018007017a  418d51ff                 lea      edx, [r9 - 1]
000000018007017e  4969c03c060000           imul     rax, r8, 0x63c
0000000180070185  48897d50                 mov      qword ptr [rbp + 0x50], rdi
0000000180070189  4803f0                   add      rsi, rax
000000018007018c  4183c8ff                 or       r8d, 0xffffffff
0000000180070190  418d4dfe                 lea      ecx, [r13 - 2]
0000000180070194  0fb6c1                   movzx    eax, cl
0000000180070197  480fa3c3                 bt       rbx, rax
000000018007019b  0f83bd000000             jae      0x18007025e
00000001800701a1  410fb70e                 movzx    ecx, word ptr [r14]
00000001800701a5  663b4ebf                 cmp      cx, word ptr [rsi - 0x41]
00000001800701a9  750b                     jne      0x1800701b6
00000001800701ab  0fb646eb                 movzx    eax, byte ptr [rsi - 0x15]
00000001800701af  6641394602               cmp      word ptr [r14 + 2], ax
00000001800701b4  7418                     je       0x1800701ce
00000001800701b6  418bd7                   mov      edx, r15d
00000001800701b9  498bcc                   mov      rcx, r12
00000001800701bc  e823ddffff               call     0x18006dee4
00000001800701c1  410fb70e                 movzx    ecx, word ptr [r14]
00000001800701c5  ba01000000               mov      edx, 1
00000001800701ca  4183c8ff                 or       r8d, 0xffffffff
00000001800701ce  66443bc1                 cmp      r8w, cx
00000001800701d2  7454                     je       0x180070228
00000001800701d4  66443b46bf               cmp      r8w, word ptr [rsi - 0x41]
00000001800701d9  7546                     jne      0x180070221
00000001800701db  33d2                     xor      edx, edx
00000001800701dd  488d4ebd                 lea      rcx, [rsi - 0x43]
00000001800701e1  448d424c                 lea      r8d, [rdx + 0x4c]
00000001800701e5  e840917100               call     0x18078932a
00000001800701ea  488b7d50                 mov      rdi, qword ptr [rbp + 0x50]
00000001800701ee  4183c8ff                 or       r8d, 0xffffffff
00000001800701f2  66448946bf               mov      word ptr [rsi - 0x41], r8w
00000001800701f7  448946c1                 mov      dword ptr [rsi - 0x3f], r8d
00000001800701fb  66448946e9               mov      word ptr [rsi - 0x17], r8w
0000000180070200  44884607                 mov      byte ptr [rsi + 7], r8b
0000000180070204  418d5002                 lea      edx, [r8 + 2]
0000000180070208  6644894601               mov      word ptr [rsi + 1], r8w
000000018007020d  c6460408                 mov      byte ptr [rsi + 4], 8
0000000180070211  660956bd                 or       word ptr [rsi - 0x43], dx
0000000180070215  804e030c                 or       byte ptr [rsi + 3], 0xc
0000000180070219  410fb706                 movzx    eax, word ptr [r14]
000000018007021d  668946bf                 mov      word ptr [rsi - 0x41], ax
0000000180070221  418a4602                 mov      al, byte ptr [r14 + 2]
0000000180070225  8846eb                   mov      byte ptr [rsi - 0x15], al
0000000180070228  8456bd                   test     byte ptr [rsi - 0x43], dl
000000018007022b  742b                     je       0x180070258
000000018007022d  410f1046ba               movups   xmm0, xmmword ptr [r14 - 0x46]
0000000180070232  418bd7                   mov      edx, r15d
0000000180070235  498bcc                   mov      rcx, r12
0000000180070238  0f1146ed                 movups   xmmword ptr [rsi - 0x13], xmm0
000000018007023c  f2410f104eca             movsd    xmm1, qword ptr [r14 - 0x36]
0000000180070242  f20f114efd               movsd    qword ptr [rsi - 3], xmm1
0000000180070247  418b46d2                 mov      eax, dword ptr [r14 - 0x2e]
000000018007024b  894605                   mov      dword ptr [rsi + 5], eax
000000018007024e  e89df2ffff               call     0x18006f4f0
0000000180070253  ba01000000               mov      edx, 1
0000000180070258  41b902000000             mov      r9d, 2
000000018007025e  418d4dff                 lea      ecx, [r13 - 1]
0000000180070262  0fb6c1                   movzx    eax, cl
0000000180070265  480fa3c3                 bt       rbx, rax
0000000180070269  0f83b7000000             jae      0x180070326
000000018007026f  8456bd                   test     byte ptr [rsi - 0x43], dl
0000000180070272  0f84ae000000             je       0x180070326
0000000180070278  f2410f1046d6             movsd    xmm0, qword ptr [r14 - 0x2a]
000000018007027e  bafdff0000               mov      edx, 0xfffd
0000000180070283  f20f1146c5               movsd    qword ptr [rsi - 0x3b], xmm0
0000000180070288  418b46de                 mov      eax, dword ptr [r14 - 0x22]
000000018007028c  8946cd                   mov      dword ptr [rsi - 0x33], eax
000000018007028f  f2410f1046e2             movsd    xmm0, qword ptr [r14 - 0x1e]
0000000180070295  f20f1146d1               movsd    qword ptr [rsi - 0x2f], xmm0
000000018007029a  418b46ea                 mov      eax, dword ptr [r14 - 0x16]
000000018007029e  8946d9                   mov      dword ptr [rsi - 0x27], eax
00000001800702a1  f2410f1046ee             movsd    xmm0, qword ptr [r14 - 0x12]
00000001800702a7  f20f1146dd               movsd    qword ptr [rsi - 0x23], xmm0
00000001800702ac  418b46f6                 mov      eax, dword ptr [r14 - 0xa]
00000001800702b0  8946e5                   mov      dword ptr [rsi - 0x1b], eax
00000001800702b3  410fb746fa               movzx    eax, word ptr [r14 - 6]
00000001800702b8  668946e9                 mov      word ptr [rsi - 0x17], ax
00000001800702bc  0fb74ebd                 movzx    ecx, word ptr [rsi - 0x43]
00000001800702c0  0fb7c1                   movzx    eax, cx
00000001800702c3  c745fc86868686           mov      dword ptr [rbp - 4], 0x86868686
00000001800702ca  6623c2                   and      ax, dx
00000001800702cd  c745e8ce050000           mov      dword ptr [rbp - 0x18], 0x5ce
00000001800702d4  66410bc9                 or       cx, r9w
00000001800702d8  41807efe00               cmp      byte ptr [r14 - 2], 0
00000001800702dd  660f44c8                 cmove    cx, ax
00000001800702e1  488365e000               and      qword ptr [rbp - 0x20], 0
00000001800702e6  8365ec00                 and      dword ptr [rbp - 0x14], 0
00000001800702ea  8365f000                 and      dword ptr [rbp - 0x10], 0
00000001800702ee  8365f400                 and      dword ptr [rbp - 0xc], 0
00000001800702f2  834df8ff                 or       dword ptr [rbp - 8], 0xffffffff
00000001800702f6  66894ebd                 mov      word ptr [rsi - 0x43], cx
00000001800702fa  eb1d                     jmp      0x180070319
00000001800702fc  488b45e0                 mov      rax, qword ptr [rbp - 0x20]
0000000180070300  0fbf481c                 movsx    ecx, word ptr [rax + 0x1c]
0000000180070304  413bcf                   cmp      ecx, r15d
0000000180070307  7510                     jne      0x180070319
0000000180070309  8b55f8                   mov      edx, dword ptr [rbp - 8]
000000018007030c  3b56c1                   cmp      edx, dword ptr [rsi - 0x3f]
000000018007030f  7408                     je       0x180070319
0000000180070311  498bcc                   mov      rcx, r12
0000000180070314  e8e3e0ffff               call     0x18006e3fc
0000000180070319  488d4de0                 lea      rcx, [rbp - 0x20]
000000018007031d  e856374000               call     0x180473a78
0000000180070322  84c0                     test     al, al
0000000180070324  75d6                     jne      0x1800702fc
0000000180070326  4c8b4dd0                 mov      r9, qword ptr [rbp - 0x30]
000000018007032a  418bc5                   mov      eax, r13d
000000018007032d  480fa3c3                 bt       rbx, rax
0000000180070331  7322                     jae      0x180070355
0000000180070333  4d85c9                   test     r9, r9
0000000180070336  781d                     js       0x180070355
0000000180070338  410fbf8424b2020000       movsx    eax, word ptr [r12 + 0x2b2]
0000000180070341  443bf8                   cmp      r15d, eax
0000000180070344  7d0f                     jge      0x180070355
0000000180070346  410fb74604               movzx    eax, word ptr [r14 + 4]
000000018007034b  418a4e06                 mov      cl, byte ptr [r14 + 6]
000000018007034f  668907                   mov      word ptr [rdi], ax
0000000180070352  884f02                   mov      byte ptr [rdi + 2], cl
0000000180070355  ba01000000               mov      edx, 1
000000018007035a  4883c703                 add      rdi, 3
000000018007035e  4c03ca                   add      r9, rdx
0000000180070361  48897d50                 mov      qword ptr [rbp + 0x50], rdi
0000000180070365  4403fa                   add      r15d, edx
0000000180070368  4c894dd0                 mov      qword ptr [rbp - 0x30], r9
000000018007036c  4183c503                 add      r13d, 3
0000000180070370  4883c64c                 add      rsi, 0x4c
0000000180070374  4983c650                 add      r14, 0x50
0000000180070378  448d42fe                 lea      r8d, [rdx - 2]
000000018007037c  482955d8                 sub      qword ptr [rbp - 0x28], rdx
0000000180070380  448d4a01                 lea      r9d, [rdx + 1]
0000000180070384  0f8506feffff             jne      0x180070190
000000018007038a  4c8d5c2450               lea      r11, [rsp + 0x50]
000000018007038f  8ac2                     mov      al, dl
0000000180070391  498b5b30                 mov      rbx, qword ptr [r11 + 0x30]
0000000180070395  498b7338                 mov      rsi, qword ptr [r11 + 0x38]
0000000180070399  498b7b40                 mov      rdi, qword ptr [r11 + 0x40]
000000018007039d  498be3                   mov      rsp, r11
00000001800703a0  415f                     pop      r15
00000001800703a2  415e                     pop      r14
00000001800703a4  415d                     pop      r13
00000001800703a6  415c                     pop      r12
00000001800703a8  5d                       pop      rbp
00000001800703a9  c3                       ret      
