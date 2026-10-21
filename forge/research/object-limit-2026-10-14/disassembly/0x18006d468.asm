; PE exception-table range 0x18006d468..0x18006d857 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006d468  48895c2418               mov      qword ptr [rsp + 0x18], rbx
000000018006d46d  55                       push     rbp
000000018006d46e  56                       push     rsi
000000018006d46f  57                       push     rdi
000000018006d470  4154                     push     r12
000000018006d472  4155                     push     r13
000000018006d474  4156                     push     r14
000000018006d476  4157                     push     r15
000000018006d478  4883ec50                 sub      rsp, 0x50
000000018006d47c  488b058dcba800           mov      rax, qword ptr [rip + 0xa8cb8d] ; 0x180afa010
000000018006d483  4833c4                   xor      rax, rsp
000000018006d486  4889442448               mov      qword ptr [rsp + 0x48], rax
000000018006d48b  488bea                   mov      rbp, rdx
000000018006d48e  488bd9                   mov      rbx, rcx
000000018006d491  488bd1                   mov      rdx, rcx
000000018006d494  488bcd                   mov      rcx, rbp
000000018006d497  e89c610900               call     0x180103638
000000018006d49c  ba08000000               mov      edx, 8
000000018006d4a1  488bcd                   mov      rcx, rbp
000000018006d4a4  e863fc0600               call     0x1800dd10c
000000018006d4a9  4183ccff                 or       r12d, 0xffffffff
000000018006d4ad  668983b0020000           mov      word ptr [rbx + 0x2b0], ax
000000018006d4b4  41bd20000000             mov      r13d, 0x20
000000018006d4ba  6683f81f                 cmp      ax, 0x1f
000000018006d4be  0f8c43010000             jl       0x18006d607
000000018006d4c4  418bd5                   mov      edx, r13d
000000018006d4c7  488bcd                   mov      rcx, rbp
000000018006d4ca  e83dfc0600               call     0x1800dd10c
000000018006d4cf  418bd5                   mov      edx, r13d
000000018006d4d2  8983ec020000             mov      dword ptr [rbx + 0x2ec], eax
000000018006d4d8  488bcd                   mov      rcx, rbp
000000018006d4db  e82cfc0600               call     0x1800dd10c
000000018006d4e0  418d55e9                 lea      edx, [r13 - 0x17]
000000018006d4e4  8983f0020000             mov      dword ptr [rbx + 0x2f0], eax
000000018006d4ea  488bcd                   mov      rcx, rbp
000000018006d4ed  e81afc0600               call     0x1800dd10c
000000018006d4f2  b900010000               mov      ecx, 0x100
000000018006d4f7  668983b2020000           mov      word ptr [rbx + 0x2b2], ax
000000018006d4fe  663bc1                   cmp      ax, cx
000000018006d501  418bd5                   mov      edx, r13d
000000018006d504  488bcd                   mov      rcx, rbp
000000018006d507  410f96c7                 setbe    r15b
000000018006d50b  44887c2430               mov      byte ptr [rsp + 0x30], r15b
000000018006d510  e8f7fb0600               call     0x1800dd10c
000000018006d515  488bcd                   mov      rcx, rbp
000000018006d518  8983b4020000             mov      dword ptr [rbx + 0x2b4], eax
000000018006d51e  e8f16cfeff               call     0x180054214
000000018006d523  488bcd                   mov      rcx, rbp
000000018006d526  8883e9020000             mov      byte ptr [rbx + 0x2e9], al
000000018006d52c  e8e36cfeff               call     0x180054214
000000018006d531  33f6                     xor      esi, esi
000000018006d533  8883ea020000             mov      byte ptr [rbx + 0x2ea], al
000000018006d539  8bfe                     mov      edi, esi
000000018006d53b  4c8db3c8020000           lea      r14, [rbx + 0x2c8]
000000018006d542  418bd5                   mov      edx, r13d
000000018006d545  488bcd                   mov      rcx, rbp
000000018006d548  e8bffb0600               call     0x1800dd10c
000000018006d54d  ffc7                     inc      edi
000000018006d54f  418906                   mov      dword ptr [r14], eax
000000018006d552  4d8d7604                 lea      r14, [r14 + 4]
000000018006d556  83ff06                   cmp      edi, 6
000000018006d559  72e7                     jb       0x18006d542
000000018006d55b  418bd5                   mov      edx, r13d
000000018006d55e  488bcd                   mov      rcx, rbp
000000018006d561  e8a6fb0600               call     0x1800dd10c
000000018006d566  418bd5                   mov      edx, r13d
000000018006d569  8983e0020000             mov      dword ptr [rbx + 0x2e0], eax
000000018006d56f  488bcd                   mov      rcx, rbp
000000018006d572  e895fb0600               call     0x1800dd10c
000000018006d577  8983e4020000             mov      dword ptr [rbx + 0x2e4], eax
000000018006d57d  4c8db3f4020000           lea      r14, [rbx + 0x2f4]
000000018006d584  490fbfc4                 movsx    rax, r12w
000000018006d588  498dbe04100000           lea      rdi, [r14 + 0x1004]
000000018006d58f  4189b604120000           mov      dword ptr [r14 + 0x1204], esi
000000018006d596  b900010000               mov      ecx, 0x100
000000018006d59b  66f3ab                   rep stosw word ptr [rdi], ax
000000018006d59e  488bcd                   mov      rcx, rbp
000000018006d5a1  4189b600100000           mov      dword ptr [r14 + 0x1000], esi
000000018006d5a8  ba09000000               mov      edx, 9
000000018006d5ad  e85afb0600               call     0x1800dd10c
000000018006d5b2  41898604120000           mov      dword ptr [r14 + 0x1204], eax
000000018006d5b9  448be6                   mov      r12d, esi
000000018006d5bc  85c0                     test     eax, eax
000000018006d5be  7e51                     jle      0x18006d611
000000018006d5c0  bf04100000               mov      edi, 0x1004
000000018006d5c5  488bcd                   mov      rcx, rbp
000000018006d5c8  e8476cfeff               call     0x180054214
000000018006d5cd  84c0                     test     al, al
000000018006d5cf  7412                     je       0x18006d5e3
000000018006d5d1  ba0c000000               mov      edx, 0xc
000000018006d5d6  488bcd                   mov      rcx, rbp
000000018006d5d9  e82efb0600               call     0x1800dd10c
000000018006d5de  664189043e               mov      word ptr [r14 + rdi], ax
000000018006d5e3  418b8604120000           mov      eax, dword ptr [r14 + 0x1204]
000000018006d5ea  41ffc4                   inc      r12d
000000018006d5ed  4883c702                 add      rdi, 2
000000018006d5f1  443be0                   cmp      r12d, eax
000000018006d5f4  7ccf                     jl       0x18006d5c5
000000018006d5f6  85c0                     test     eax, eax
000000018006d5f8  7e17                     jle      0x18006d611
000000018006d5fa  488bd5                   mov      rdx, rbp
000000018006d5fd  498bce                   mov      rcx, r14
000000018006d600  e8f3340000               call     0x180070af8
000000018006d605  eb0a                     jmp      0x18006d611
000000018006d607  33f6                     xor      esi, esi
000000018006d609  448afe                   mov      r15b, sil
000000018006d60c  4088742430               mov      byte ptr [rsp + 0x30], sil
000000018006d611  4584ff                   test     r15b, r15b
000000018006d614  0f8415020000             je       0x18006d82f
000000018006d61a  664439abb0020000         cmp      word ptr [rbx + 0x2b0], r13w
000000018006d622  7c3e                     jl       0x18006d662
000000018006d624  33c0                     xor      eax, eax
000000018006d626  89742438                 mov      dword ptr [rsp + 0x38], esi
000000018006d62a  4c8d442438               lea      r8, [rsp + 0x38]
000000018006d62f  488944243e               mov      qword ptr [rsp + 0x3e], rax
000000018006d634  488bcd                   mov      rcx, rbp
000000018006d637  6689442446               mov      word ptr [rsp + 0x46], ax
000000018006d63c  668974243c               mov      word ptr [rsp + 0x3c], si
000000018006d641  e846ff0600               call     0x1800dd58c
000000018006d646  0f10442438               movups   xmm0, xmmword ptr [rsp + 0x38]
000000018006d64b  488d8bb8020000           lea      rcx, [rbx + 0x2b8]
000000018006d652  f30f7f01                 movdqu   xmmword ptr [rcx], xmm0
000000018006d656  e8b9faf9ff               call     0x18000d114
000000018006d65b  448af8                   mov      r15b, al
000000018006d65e  88442430                 mov      byte ptr [rsp + 0x30], al
000000018006d662  4584ff                   test     r15b, r15b
000000018006d665  0f84c4010000             je       0x18006d82f
000000018006d66b  664439abb0020000         cmp      word ptr [rbx + 0x2b0], r13w
000000018006d673  7d39                     jge      0x18006d6ae
000000018006d675  8b93b4020000             mov      edx, dword ptr [rbx + 0x2b4]
000000018006d67b  488d4c2438               lea      rcx, [rsp + 0x38]
000000018006d680  e877effcff               call     0x18003c5fc
000000018006d685  488d8bb8020000           lea      rcx, [rbx + 0x2b8]
000000018006d68c  0f1000                   movups   xmm0, xmmword ptr [rax]
000000018006d68f  f30f7f01                 movdqu   xmmword ptr [rcx], xmm0
000000018006d693  e87cfaf9ff               call     0x18000d114
000000018006d698  84c0                     test     al, al
000000018006d69a  7412                     je       0x18006d6ae
000000018006d69c  664439abb0020000         cmp      word ptr [rbx + 0x2b0], r13w
000000018006d6a4  7408                     je       0x18006d6ae
000000018006d6a6  664489abb0020000         mov      word ptr [rbx + 0x2b0], r13w
000000018006d6ae  488dbb3f150000           lea      rdi, [rbx + 0x153f]
000000018006d6b5  41be8b020000             mov      r14d, 0x28b
000000018006d6bb  4183cfff                 or       r15d, 0xffffffff
000000018006d6bf  33d2                     xor      edx, edx
000000018006d6c1  488d4fbd                 lea      rcx, [rdi - 0x43]
000000018006d6c5  448d424c                 lea      r8d, [rdx + 0x4c]
000000018006d6c9  e85cbc7100               call     0x18078932a
000000018006d6ce  6644897fbf               mov      word ptr [rdi - 0x41], r15w
000000018006d6d3  488bcd                   mov      rcx, rbp
000000018006d6d6  44897fc1                 mov      dword ptr [rdi - 0x3f], r15d
000000018006d6da  6644897fe9               mov      word ptr [rdi - 0x17], r15w
000000018006d6df  44887f07                 mov      byte ptr [rdi + 7], r15b
000000018006d6e3  6644897f01               mov      word ptr [rdi + 1], r15w
000000018006d6e8  c6470408                 mov      byte ptr [rdi + 4], 8
000000018006d6ec  e8236bfeff               call     0x180054214
000000018006d6f1  84c0                     test     al, al
000000018006d6f3  0f84b2000000             je       0x18006d7ab
000000018006d6f9  ba02000000               mov      edx, 2
000000018006d6fe  488bcd                   mov      rcx, rbp
000000018006d701  e806fa0600               call     0x1800dd10c
000000018006d706  488bcd                   mov      rcx, rbp
000000018006d709  668947bd                 mov      word ptr [rdi - 0x43], ax
000000018006d70d  e8026bfeff               call     0x180054214
000000018006d712  84c0                     test     al, al
000000018006d714  7405                     je       0x18006d71b
000000018006d716  418bc7                   mov      eax, r15d
000000018006d719  eb0d                     jmp      0x18006d728
000000018006d71b  ba08000000               mov      edx, 8
000000018006d720  488bcd                   mov      rcx, rbp
000000018006d723  e8e4f90600               call     0x1800dd10c
000000018006d728  488bcd                   mov      rcx, rbp
000000018006d72b  668947bf                 mov      word ptr [rdi - 0x41], ax
000000018006d72f  e8e06afeff               call     0x180054214
000000018006d734  84c0                     test     al, al
000000018006d736  7405                     je       0x18006d73d
000000018006d738  418bc7                   mov      eax, r15d
000000018006d73b  eb0d                     jmp      0x18006d74a
000000018006d73d  ba05000000               mov      edx, 5
000000018006d742  488bcd                   mov      rcx, rbp
000000018006d745  e8c2f90600               call     0x1800dd10c
000000018006d74a  41bc01000000             mov      r12d, 1
000000018006d750  8847eb                   mov      byte ptr [rdi - 0x15], al
000000018006d753  488d83c8020000           lea      rax, [rbx + 0x2c8]
000000018006d75a  4533c9                   xor      r9d, r9d
000000018006d75d  4889442428               mov      qword ptr [rsp + 0x28], rax
000000018006d762  488d57c5                 lea      rdx, [rdi - 0x3b]
000000018006d766  488bcd                   mov      rcx, rbp
000000018006d769  4488642420               mov      byte ptr [rsp + 0x20], r12b
000000018006d76e  458d442414               lea      r8d, [r12 + 0x14]
000000018006d773  e80c913500               call     0x1803c6884
000000018006d778  4c8d4fdd                 lea      r9, [rdi - 0x23]
000000018006d77c  488bcd                   mov      rcx, rbp
000000018006d77f  4c8d47d1                 lea      r8, [rdi - 0x2f]
000000018006d783  e81c310000               call     0x1800708a4
000000018006d788  418d542409               lea      edx, [r12 + 9]
000000018006d78d  488bcd                   mov      rcx, rbp
000000018006d790  e877f90600               call     0x1800dd10c
000000018006d795  66412bc4                 sub      ax, r12w
000000018006d799  488d4fed                 lea      rcx, [rdi - 0x13]
000000018006d79d  488bd5                   mov      rdx, rbp
000000018006d7a0  668947e9                 mov      word ptr [rdi - 0x17], ax
000000018006d7a4  e8f3220000               call     0x18006fa9c
000000018006d7a9  eb06                     jmp      0x18006d7b1
000000018006d7ab  41bc01000000             mov      r12d, 1
000000018006d7b1  4883c74c                 add      rdi, 0x4c
000000018006d7b5  4d2bf4                   sub      r14, r12
000000018006d7b8  0f8501ffffff             jne      0x18006d6bf
000000018006d7be  448a7c2430               mov      r15b, byte ptr [rsp + 0x30]
000000018006d7c3  448bf6                   mov      r14d, esi
000000018006d7c6  488bfe                   mov      rdi, rsi
000000018006d7c9  0fbf83b2020000           movsx    eax, word ptr [rbx + 0x2b2]
000000018006d7d0  443bf0                   cmp      r14d, eax
000000018006d7d3  7d37                     jge      0x18006d80c
000000018006d7d5  41bd08000000             mov      r13d, 8
000000018006d7db  488bcd                   mov      rcx, rbp
000000018006d7de  418bd5                   mov      edx, r13d
000000018006d7e1  e826f90600               call     0x1800dd10c
000000018006d7e6  418bd5                   mov      edx, r13d
000000018006d7e9  88841f40d60000           mov      byte ptr [rdi + rbx + 0xd640], al
000000018006d7f0  488bcd                   mov      rcx, rbp
000000018006d7f3  e814f90600               call     0x1800dd10c
000000018006d7f8  418bd5                   mov      edx, r13d
000000018006d7fb  88841f41d60000           mov      byte ptr [rdi + rbx + 0xd641], al
000000018006d802  488bcd                   mov      rcx, rbp
000000018006d805  e802f90600               call     0x1800dd10c
000000018006d80a  eb0c                     jmp      0x18006d818
000000018006d80c  6683a41f40d6000000       and      word ptr [rdi + rbx + 0xd640], 0
000000018006d815  408ac6                   mov      al, sil
000000018006d818  88841f42d60000           mov      byte ptr [rdi + rbx + 0xd642], al
000000018006d81f  4503f4                   add      r14d, r12d
000000018006d822  4883c703                 add      rdi, 3
000000018006d826  4881ff00030000           cmp      rdi, 0x300
000000018006d82d  7c9a                     jl       0x18006d7c9
000000018006d82f  418ac7                   mov      al, r15b
000000018006d832  488b4c2448               mov      rcx, qword ptr [rsp + 0x48]
000000018006d837  4833cc                   xor      rcx, rsp
000000018006d83a  e8c1a57100               call     0x180787e00
000000018006d83f  488b9c24a0000000         mov      rbx, qword ptr [rsp + 0xa0]
000000018006d847  4883c450                 add      rsp, 0x50
000000018006d84b  415f                     pop      r15
000000018006d84d  415e                     pop      r14
000000018006d84f  415d                     pop      r13
000000018006d851  415c                     pop      r12
000000018006d853  5f                       pop      rdi
000000018006d854  5e                       pop      rsi
000000018006d855  5d                       pop      rbp
000000018006d856  c3                       ret      
