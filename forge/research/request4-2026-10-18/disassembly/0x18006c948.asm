; PE exception-table range 0x18006c948..0x18006cb4f (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006c948  48895c2410               mov      qword ptr [rsp + 0x10], rbx
000000018006c94d  48896c2418               mov      qword ptr [rsp + 0x18], rbp
000000018006c952  4889742420               mov      qword ptr [rsp + 0x20], rsi
000000018006c957  57                       push     rdi
000000018006c958  4154                     push     r12
000000018006c95a  4155                     push     r13
000000018006c95c  4156                     push     r14
000000018006c95e  4157                     push     r15
000000018006c960  4883ec20                 sub      rsp, 0x20
000000018006c964  6683b9b002000020         cmp      word ptr [rcx + 0x2b0], 0x20
000000018006c96c  448bea                   mov      r13d, edx
000000018006c96f  4c8b35bad8ba00           mov      r14, qword ptr [rip + 0xbad8ba] ; 0x180c1a230
000000018006c976  488bf9                   mov      rdi, rcx
000000018006c979  740a                     je       0x18006c985
000000018006c97b  33db                     xor      ebx, ebx
000000018006c97d  408af3                   mov      sil, bl
000000018006c980  e98a010000               jmp      0x18006cb0f
000000018006c985  488d542450               lea      rdx, [rsp + 0x50]
000000018006c98a  e8b9feffff               call     0x18006c848
000000018006c98f  33db                     xor      ebx, ebx
000000018006c991  84c0                     test     al, al
000000018006c993  400f94c6                 sete     sil
000000018006c997  83bfb4020000ff           cmp      dword ptr [rdi + 0x2b4], -1
000000018006c99e  7514                     jne      0x18006c9b4
000000018006c9a0  488d8fb8020000           lea      rcx, [rdi + 0x2b8]
000000018006c9a7  e8f806faff               call     0x18000d0a4
000000018006c9ac  84c0                     test     al, al
000000018006c9ae  0f8556010000             jne      0x18006cb0a
000000018006c9b4  389fea020000             cmp      byte ptr [rdi + 0x2ea], bl
000000018006c9ba  0f854a010000             jne      0x18006cb0a
000000018006c9c0  389fe9020000             cmp      byte ptr [rdi + 0x2e9], bl
000000018006c9c6  0f853e010000             jne      0x18006cb0a
000000018006c9cc  e80fbffeff               call     0x1800588e0
000000018006c9d1  84c0                     test     al, al
000000018006c9d3  7452                     je       0x18006ca27
000000018006c9d5  8b0d3db1ba00             mov      ecx, dword ptr [rip + 0xbab13d] ; 0x180c17b18
000000018006c9db  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018006c9e4  ba48000000               mov      edx, 0x48
000000018006c9e9  488b04c8                 mov      rax, qword ptr [rax + rcx*8]
000000018006c9ed  488b0c10                 mov      rcx, qword ptr [rax + rdx]
000000018006c9f1  80791004                 cmp      byte ptr [rcx + 0x10], 4
000000018006c9f5  7430                     je       0x18006ca27
000000018006c9f7  488b1532105502           mov      rdx, qword ptr [rip + 0x2551032] ; 0x1825bda30
000000018006c9fe  41b814000000             mov      r8d, 0x14
000000018006ca04  4881c2a8030000           add      rdx, 0x3a8
000000018006ca0b  83c9ff                   or       ecx, 0xffffffff
000000018006ca0e  e8d92a0300               call     0x18009f4ec
000000018006ca13  8b8fec020000             mov      ecx, dword ptr [rdi + 0x2ec]
000000018006ca19  83f9ff                   cmp      ecx, -1
000000018006ca1c  7409                     je       0x18006ca27
000000018006ca1e  3bc1                     cmp      eax, ecx
000000018006ca20  400fb6f6                 movzx    esi, sil
000000018006ca24  0f45f3                   cmovne   esi, ebx
000000018006ca27  4d85f6                   test     r14, r14
000000018006ca2a  0f84da000000             je       0x18006cb0a
000000018006ca30  8b87b4020000             mov      eax, dword ptr [rdi + 0x2b4]
000000018006ca36  41394610                 cmp      dword ptr [r14 + 0x10], eax
000000018006ca3a  0f85ca000000             jne      0x18006cb0a
000000018006ca40  498bce                   mov      rcx, r14
000000018006ca43  e8c8fcffff               call     0x18006c710
000000018006ca48  0fb78fb2020000           movzx    ecx, word ptr [rdi + 0x2b2]
000000018006ca4f  6685c9                   test     cx, cx
000000018006ca52  750a                     jne      0x18006ca5e
000000018006ca54  0fb7c8                   movzx    ecx, ax
000000018006ca57  668987b2020000           mov      word ptr [rdi + 0x2b2], ax
000000018006ca5e  0fbfd1                   movsx    edx, cx
000000018006ca61  3bc2                     cmp      eax, edx
000000018006ca63  7426                     je       0x18006ca8b
000000018006ca65  488b442450               mov      rax, qword ptr [rsp + 0x50]
000000018006ca6a  408af3                   mov      sil, bl
000000018006ca6d  4885c0                   test     rax, rax
000000018006ca70  0f8499000000             je       0x18006cb0f
000000018006ca76  395804                   cmp      dword ptr [rax + 4], ebx
000000018006ca79  0f8e90000000             jle      0x18006cb0f
000000018006ca7f  395004                   cmp      dword ptr [rax + 4], edx
000000018006ca82  0f8587000000             jne      0x18006cb0f
000000018006ca88  40b601                   mov      sil, 1
000000018006ca8b  4084f6                   test     sil, sil
000000018006ca8e  747f                     je       0x18006cb0f
000000018006ca90  488daf3f150000           lea      rbp, [rdi + 0x153f]
000000018006ca97  41bc8b020000             mov      r12d, 0x28b
000000018006ca9d  4c8d7dbd                 lea      r15, [rbp - 0x43]
000000018006caa1  41f60701                 test     byte ptr [r15], 1
000000018006caa5  7459                     je       0x18006cb00
000000018006caa7  0fb745bf                 movzx    eax, word ptr [rbp - 0x41]
000000018006caab  6685c0                   test     ax, ax
000000018006caae  781e                     js       0x18006cace
000000018006cab0  663b87b2020000           cmp      ax, word ptr [rdi + 0x2b2]
000000018006cab7  7d15                     jge      0x18006cace
000000018006cab9  0fbfd0                   movsx    edx, ax
000000018006cabc  e89f040000               call     0x18006cf60
000000018006cac1  0fb655eb                 movzx    edx, byte ptr [rbp - 0x15]
000000018006cac5  48634004                 movsxd   rax, dword ptr [rax + 4]
000000018006cac9  483bd0                   cmp      rdx, rax
000000018006cacc  7c32                     jl       0x18006cb00
000000018006cace  41b84c000000             mov      r8d, 0x4c
000000018006cad4  33d2                     xor      edx, edx
000000018006cad6  498bcf                   mov      rcx, r15
000000018006cad9  408af3                   mov      sil, bl
000000018006cadc  e849c87100               call     0x18078932a
000000018006cae1  4183cbff                 or       r11d, 0xffffffff
000000018006cae5  6644895dbf               mov      word ptr [rbp - 0x41], r11w
000000018006caea  44895dc1                 mov      dword ptr [rbp - 0x3f], r11d
000000018006caee  6644895de9               mov      word ptr [rbp - 0x17], r11w
000000018006caf3  c6450408                 mov      byte ptr [rbp + 4], 8
000000018006caf7  6644895d01               mov      word ptr [rbp + 1], r11w
000000018006cafc  44885d07                 mov      byte ptr [rbp + 7], r11b
000000018006cb00  4883c54c                 add      rbp, 0x4c
000000018006cb04  4983ec01                 sub      r12, 1
000000018006cb08  7593                     jne      0x18006ca9d
000000018006cb0a  4084f6                   test     sil, sil
000000018006cb0d  7520                     jne      0x18006cb2f
000000018006cb0f  4d85f6                   test     r14, r14
000000018006cb12  7410                     je       0x18006cb24
000000018006cb14  45396e10                 cmp      dword ptr [r14 + 0x10], r13d
000000018006cb18  750a                     jne      0x18006cb24
000000018006cb1a  488bcf                   mov      rcx, rdi
000000018006cb1d  e8f2010000               call     0x18006cd14
000000018006cb22  eb0b                     jmp      0x18006cb2f
000000018006cb24  418bd5                   mov      edx, r13d
000000018006cb27  488bcf                   mov      rcx, rdi
000000018006cb2a  e851f5ffff               call     0x18006c080
000000018006cb2f  488b5c2458               mov      rbx, qword ptr [rsp + 0x58]
000000018006cb34  408ac6                   mov      al, sil
000000018006cb37  488b742468               mov      rsi, qword ptr [rsp + 0x68]
000000018006cb3c  488b6c2460               mov      rbp, qword ptr [rsp + 0x60]
000000018006cb41  4883c420                 add      rsp, 0x20
000000018006cb45  415f                     pop      r15
000000018006cb47  415e                     pop      r14
000000018006cb49  415d                     pop      r13
000000018006cb4b  415c                     pop      r12
000000018006cb4d  5f                       pop      rdi
000000018006cb4e  c3                       ret      
