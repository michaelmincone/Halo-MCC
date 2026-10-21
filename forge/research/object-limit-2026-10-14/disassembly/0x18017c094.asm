; PE exception-table range 0x18017c094..0x18017c2a6 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017c094  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018017c099  48896c2410               mov      qword ptr [rsp + 0x10], rbp
000000018017c09e  4889742418               mov      qword ptr [rsp + 0x18], rsi
000000018017c0a3  57                       push     rdi
000000018017c0a4  4154                     push     r12
000000018017c0a6  4155                     push     r13
000000018017c0a8  4156                     push     r14
000000018017c0aa  4157                     push     r15
000000018017c0ac  4883ec20                 sub      rsp, 0x20
000000018017c0b0  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018017c0b9  488bf1                   mov      rsi, rcx
000000018017c0bc  8b1556baa900             mov      edx, dword ptr [rip + 0xa9ba56] ; 0x180c17b18
000000018017c0c2  4c8b34d0                 mov      r14, qword ptr [rax + rdx*8]
000000018017c0c6  b848000000               mov      eax, 0x48
000000018017c0cb  4a8b0430                 mov      rax, qword ptr [rax + r14]
000000018017c0cf  80781104                 cmp      byte ptr [rax + 0x11], 4
000000018017c0d3  0f84b0010000             je       0x18017c289
000000018017c0d9  b820000000               mov      eax, 0x20
000000018017c0de  4c8d05939ea100           lea      r8, [rip + 0xa19e93] ; 0x180b95f78
000000018017c0e5  4533ed                   xor      r13d, r13d
000000018017c0e8  4a8b0430                 mov      rax, qword ptr [rax + r14]
000000018017c0ec  4863901c840000           movsxd   rdx, dword ptr [rax + 0x841c]
000000018017c0f3  488bca                   mov      rcx, rdx
000000018017c0f6  8d42ff                   lea      eax, [rdx - 1]
000000018017c0f9  83f803                   cmp      eax, 3
000000018017c0fc  7706                     ja       0x18017c104
000000018017c0fe  498b04d0                 mov      rax, qword ptr [r8 + rdx*8]
000000018017c102  eb03                     jmp      0x18017c107
000000018017c104  498bc5                   mov      rax, r13
000000018017c107  4885c0                   test     rax, rax
000000018017c10a  0f8479010000             je       0x18017c289
000000018017c110  8d42ff                   lea      eax, [rdx - 1]
000000018017c113  83f803                   cmp      eax, 3
000000018017c116  7706                     ja       0x18017c11e
000000018017c118  498b0cc8                 mov      rcx, qword ptr [r8 + rcx*8]
000000018017c11c  eb03                     jmp      0x18017c121
000000018017c11e  498bcd                   mov      rcx, r13
000000018017c121  488b01                   mov      rax, qword ptr [rcx]
000000018017c124  ff9018030000             call     qword ptr [rax + 0x318]
000000018017c12a  84c0                     test     al, al
000000018017c12c  0f8457010000             je       0x18017c289
000000018017c132  b8a0000000               mov      eax, 0xa0
000000018017c137  418bdd                   mov      ebx, r13d
000000018017c13a  488bfe                   mov      rdi, rsi
000000018017c13d  bd01000000               mov      ebp, 1
000000018017c142  4a8b0430                 mov      rax, qword ptr [rax + r14]
000000018017c146  440fbf7806               movsx    r15d, word ptr [rax + 6]
000000018017c14b  8b400c                   mov      eax, dword ptr [rax + 0xc]
000000018017c14e  99                       cdq      
000000018017c14f  41f7ff                   idiv     r15d
000000018017c152  448be2                   mov      r12d, edx
000000018017c155  8bc3                     mov      eax, ebx
000000018017c157  99                       cdq      
000000018017c158  41f7ff                   idiv     r15d
000000018017c15b  413bd4                   cmp      edx, r12d
000000018017c15e  7508                     jne      0x18017c168
000000018017c160  488bcf                   mov      rcx, rdi
000000018017c163  e8ecf9ffff               call     0x18017bb54
000000018017c168  03dd                     add      ebx, ebp
000000018017c16a  4883c710                 add      rdi, 0x10
000000018017c16e  81fbcb020000             cmp      ebx, 0x2cb
000000018017c174  7cdf                     jl       0x18017c155
000000018017c176  488d9eb42c0000           lea      rbx, [rsi + 0x2cb4]
000000018017c17d  418bed                   mov      ebp, r13d
000000018017c180  be01000000               mov      esi, 1
000000018017c185  8bc5                     mov      eax, ebp
000000018017c187  99                       cdq      
000000018017c188  41f7ff                   idiv     r15d
000000018017c18b  413bd4                   cmp      edx, r12d
000000018017c18e  0f85e3000000             jne      0x18017c277
000000018017c194  8b7bfc                   mov      edi, dword ptr [rbx - 4]
000000018017c197  83ffff                   cmp      edi, -1
000000018017c19a  0f84d7000000             je       0x18017c277
000000018017c1a0  44386b02                 cmp      byte ptr [rbx + 2], r13b
000000018017c1a4  7418                     je       0x18017c1be
000000018017c1a6  33d2                     xor      edx, edx
000000018017c1a8  8bcf                     mov      ecx, edi
000000018017c1aa  e80953efff               call     0x1800714b8
000000018017c1af  84c0                     test     al, al
000000018017c1b1  750b                     jne      0x18017c1be
000000018017c1b3  8bcf                     mov      ecx, edi
000000018017c1b5  e87652efff               call     0x180071430
000000018017c1ba  84c0                     test     al, al
000000018017c1bc  740f                     je       0x18017c1cd
000000018017c1be  8bcf                     mov      ecx, edi
000000018017c1c0  e83f090000               call     0x18017cb04
000000018017c1c5  84c0                     test     al, al
000000018017c1c7  740f                     je       0x18017c1d8
000000018017c1c9  40887302                 mov      byte ptr [rbx + 2], sil
000000018017c1cd  8bcf                     mov      ecx, edi
000000018017c1cf  e8ac0a0000               call     0x18017cc80
000000018017c1d4  84c0                     test     al, al
000000018017c1d6  750e                     jne      0x18017c1e6
000000018017c1d8  8bcf                     mov      ecx, edi
000000018017c1da  e8b10f0000               call     0x18017d190
000000018017c1df  418acd                   mov      cl, r13b
000000018017c1e2  84c0                     test     al, al
000000018017c1e4  7403                     je       0x18017c1e9
000000018017c1e6  408ace                   mov      cl, sil
000000018017c1e9  0fb703                   movzx    eax, word ptr [rbx]
000000018017c1ec  6685c0                   test     ax, ax
000000018017c1ef  7f04                     jg       0x18017c1f5
000000018017c1f1  84c9                     test     cl, cl
000000018017c1f3  7425                     je       0x18017c21a
000000018017c1f5  41b8ff7f0000             mov      r8d, 0x7fff
000000018017c1fb  66413bc0                 cmp      ax, r8w
000000018017c1ff  7506                     jne      0x18017c207
000000018017c201  410fb7c0                 movzx    eax, r8w
000000018017c205  eb03                     jmp      0x18017c20a
000000018017c207  6603c6                   add      ax, si
000000018017c20a  668903                   mov      word ptr [rbx], ax
000000018017c20d  84c9                     test     cl, cl
000000018017c20f  7409                     je       0x18017c21a
000000018017c211  663b4306                 cmp      ax, word ptr [rbx + 6]
000000018017c215  0f9dc0                   setge    al
000000018017c218  eb51                     jmp      0x18017c26b
000000018017c21a  83ffff                   cmp      edi, -1
000000018017c21d  7458                     je       0x18017c277
000000018017c21f  0fb7cf                   movzx    ecx, di
000000018017c222  ba10000000               mov      edx, 0x10
000000018017c227  4c8d0449                 lea      r8, [rcx + rcx*2]
000000018017c22b  4a8b1432                 mov      rdx, qword ptr [rdx + r14]
000000018017c22f  488b4a50                 mov      rcx, qword ptr [rdx + 0x50]
000000018017c233  4a8b44c110               mov      rax, qword ptr [rcx + r8*8 + 0x10]
000000018017c238  837814ff                 cmp      dword ptr [rax + 0x14], -1
000000018017c23c  7526                     jne      0x18017c264
000000018017c23e  420fb64cc104             movzx    ecx, byte ptr [rcx + r8*8 + 4]
000000018017c244  2bce                     sub      ecx, esi
000000018017c246  7411                     je       0x18017c259
000000018017c248  2bce                     sub      ecx, esi
000000018017c24a  7404                     je       0x18017c250
000000018017c24c  3bce                     cmp      ecx, esi
000000018017c24e  7527                     jne      0x18017c277
000000018017c250  8bcf                     mov      ecx, edi
000000018017c252  e885562f00               call     0x1804718dc
000000018017c257  eb07                     jmp      0x18017c260
000000018017c259  8bcf                     mov      ecx, edi
000000018017c25b  e89c0e0000               call     0x18017d0fc
000000018017c260  84c0                     test     al, al
000000018017c262  7413                     je       0x18017c277
000000018017c264  6644892b                 mov      word ptr [rbx], r13w
000000018017c268  418ac5                   mov      al, r13b
000000018017c26b  84c0                     test     al, al
000000018017c26d  7408                     je       0x18017c277
000000018017c26f  8b4bfc                   mov      ecx, dword ptr [rbx - 4]
000000018017c272  e8392e2f00               call     0x18046f0b0
000000018017c277  03ee                     add      ebp, esi
000000018017c279  4883c30c                 add      rbx, 0xc
000000018017c27d  81fdcb020000             cmp      ebp, 0x2cb
000000018017c283  0f8cfcfeffff             jl       0x18017c185
000000018017c289  488b5c2450               mov      rbx, qword ptr [rsp + 0x50]
000000018017c28e  488b6c2458               mov      rbp, qword ptr [rsp + 0x58]
000000018017c293  488b742460               mov      rsi, qword ptr [rsp + 0x60]
000000018017c298  4883c420                 add      rsp, 0x20
000000018017c29c  415f                     pop      r15
000000018017c29e  415e                     pop      r14
000000018017c2a0  415d                     pop      r13
000000018017c2a2  415c                     pop      r12
000000018017c2a4  5f                       pop      rdi
000000018017c2a5  c3                       ret      
