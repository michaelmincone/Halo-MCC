; PE exception-table range 0x18007887c..0x180078e17 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018007887c  48895c2408               mov      qword ptr [rsp + 8], rbx
0000000180078881  48896c2410               mov      qword ptr [rsp + 0x10], rbp
0000000180078886  4889742418               mov      qword ptr [rsp + 0x18], rsi
000000018007888b  57                       push     rdi
000000018007888c  4154                     push     r12
000000018007888e  4155                     push     r13
0000000180078890  4156                     push     r14
0000000180078892  4157                     push     r15
0000000180078894  4883ec20                 sub      rsp, 0x20
0000000180078898  8b0d7af2b900             mov      ecx, dword ptr [rip + 0xb9f27a] ; 0x180c17b18
000000018007889e  33d2                     xor      edx, edx
00000001800788a0  65488b042558000000       mov      rax, qword ptr gs:[0x58]
00000001800788a9  41b830840000             mov      r8d, 0x8430
00000001800788af  bf20000000               mov      edi, 0x20
00000001800788b4  488b34c8                 mov      rsi, qword ptr [rax + rcx*8]
00000001800788b8  488b1c37                 mov      rbx, qword ptr [rdi + rsi]
00000001800788bc  488bcb                   mov      rcx, rbx
00000001800788bf  e8660a7100               call     0x18078932a
00000001800788c4  b890020000               mov      eax, 0x290
00000001800788c9  33d2                     xor      edx, edx
00000001800788cb  41b8e8dc0000             mov      r8d, 0xdce8
00000001800788d1  488b0c30                 mov      rcx, qword ptr [rax + rsi]
00000001800788d5  e8500a7100               call     0x18078932a
00000001800788da  4533ff                   xor      r15d, r15d
00000001800788dd  41ba48000000             mov      r10d, 0x48
00000001800788e3  4489bb1c840000           mov      dword ptr [rbx + 0x841c], r15d
00000001800788ea  4c8d2d0f77f8ff           lea      r13, [rip - 0x788f1] ; 0x180000000
00000001800788f1  4983ccff                 or       r12, 0xffffffffffffffff
00000001800788f5  498b1432                 mov      rdx, qword ptr [r10 + rsi]
00000001800788f9  458d7701                 lea      r14d, [r15 + 1]
00000001800788fd  458d4f02                 lea      r9d, [r15 + 2]
0000000180078901  418d6f03                 lea      ebp, [r15 + 3]
0000000180078905  8a4a10                   mov      cl, byte ptr [rdx + 0x10]
0000000180078908  8ac1                     mov      al, cl
000000018007890a  412ac6                   sub      al, r14b
000000018007890d  413ac1                   cmp      al, r9b
0000000180078910  0f8749030000             ja       0x180078c5f
0000000180078916  4c8d82e8140000           lea      r8, [rdx + 0x14e8]
000000018007891d  4d85c0                   test     r8, r8
0000000180078920  0f8439030000             je       0x180078c5f
0000000180078926  412ace                   sub      cl, r14b
0000000180078929  488d7b30                 lea      rdi, [rbx + 0x30]
000000018007892d  413ac9                   cmp      cl, r9b
0000000180078930  418bc7                   mov      eax, r15d
0000000180078933  8d4d15                   lea      ecx, [rbp + 0x15]
0000000180078936  490f46c0                 cmovbe   rax, r8
000000018007893a  8b00                     mov      eax, dword ptr [rax]
000000018007893c  89831c840000             mov      dword ptr [rbx + 0x841c], eax
0000000180078942  498bc4                   mov      rax, r12
0000000180078945  4489632c                 mov      dword ptr [rbx + 0x2c], r12d
0000000180078949  f3ab                     rep stosd dword ptr [rdi], eax
000000018007894b  4489a390000000           mov      dword ptr [rbx + 0x90], r12d
0000000180078952  8d4527                   lea      eax, [rbp + 0x27]
0000000180078955  6689836e2d0000           mov      word ptr [rbx + 0x2d6e], ax
000000018007895c  418d6f10                 lea      ebp, [r15 + 0x10]
0000000180078960  498bc4                   mov      rax, r12
0000000180078963  488dbb98000000           lea      rdi, [rbx + 0x98]
000000018007896a  8bcd                     mov      ecx, ebp
000000018007896c  f3ab                     rep stosd dword ptr [rdi], eax
000000018007896e  4489a394000000           mov      dword ptr [rbx + 0x94], r12d
0000000180078975  418bcf                   mov      ecx, r15d
0000000180078978  4c89631c                 mov      qword ptr [rbx + 0x1c], r12
000000018007897c  458be1                   mov      r12d, r9d
000000018007897f  8a4210                   mov      al, byte ptr [rdx + 0x10]
0000000180078982  412ac6                   sub      al, r14b
0000000180078985  413ac1                   cmp      al, r9b
0000000180078988  8b03                     mov      eax, dword ptr [rbx]
000000018007898a  490f46c8                 cmovbe   rcx, r8
000000018007898e  4484b1bc020000           test     byte ptr [rcx + 0x2bc], r14b
0000000180078995  7405                     je       0x18007899c
0000000180078997  83c808                   or       eax, 8
000000018007899a  eb03                     jmp      0x18007899f
000000018007899c  83e0f7                   and      eax, 0xfffffff7
000000018007899f  8903                     mov      dword ptr [rbx], eax
00000001800789a1  418bff                   mov      edi, r15d
00000001800789a4  498bdf                   mov      rbx, r15
00000001800789a7  41bd20000000             mov      r13d, 0x20
00000001800789ad  498b0c32                 mov      rcx, qword ptr [r10 + rsi]
00000001800789b1  498bd7                   mov      rdx, r15
00000001800789b4  8a0429                   mov      al, byte ptr [rcx + rbp]
00000001800789b7  412ac6                   sub      al, r14b
00000001800789ba  413ac4                   cmp      al, r12b
00000001800789bd  770a                     ja       0x1800789c9
00000001800789bf  488d95d8140000           lea      rdx, [rbp + 0x14d8]
00000001800789c6  4803d1                   add      rdx, rcx
00000001800789c9  488d4a04                 lea      rcx, [rdx + 4]
00000001800789cd  8bd7                     mov      edx, edi
00000001800789cf  488b01                   mov      rax, qword ptr [rcx]
00000001800789d2  ff5070                   call     qword ptr [rax + 0x70]
00000001800789d5  4a8b0c2e                 mov      rcx, qword ptr [rsi + r13]
00000001800789d9  4103fe                   add      edi, r14d
00000001800789dc  41ba48000000             mov      r10d, 0x48
00000001800789e2  8a4002                   mov      al, byte ptr [rax + 2]
00000001800789e5  88441924                 mov      byte ptr [rcx + rbx + 0x24], al
00000001800789e9  4903de                   add      rbx, r14
00000001800789ec  83ff07                   cmp      edi, 7
00000001800789ef  7cbc                     jl       0x1800789ad
00000001800789f1  bb48000000               mov      ebx, 0x48
00000001800789f6  4c8d2d0376f8ff           lea      r13, [rip - 0x789fd] ; 0x180000000
00000001800789fd  49c7c4ffffffff           mov      r12, 0xffffffffffffffff
0000000180078a04  488b1c33                 mov      rbx, qword ptr [rbx + rsi]
0000000180078a08  807b1104                 cmp      byte ptr [rbx + 0x11], 4
0000000180078a0c  7403                     je       0x180078a11
0000000180078a0e  830904                   or       dword ptr [rcx], 4
0000000180078a11  e81e7c0000               call     0x180080634
0000000180078a16  488bf8                   mov      rdi, rax
0000000180078a19  4885c0                   test     rax, rax
0000000180078a1c  7438                     je       0x180078a56
0000000180078a1e  41bec0000000             mov      r14d, 0xc0
0000000180078a24  33d2                     xor      edx, edx
0000000180078a26  458bc6                   mov      r8d, r14d
0000000180078a29  488bc8                   mov      rcx, rax
0000000180078a2c  e8f9087100               call     0x18078932a
0000000180078a31  488d8fc8000000           lea      rcx, [rdi + 0xc8]
0000000180078a38  458bc6                   mov      r8d, r14d
0000000180078a3b  33d2                     xor      edx, edx
0000000180078a3d  e8e8087100               call     0x18078932a
0000000180078a42  4488bfc0000000           mov      byte ptr [rdi + 0xc0], r15b
0000000180078a49  41be01000000             mov      r14d, 1
0000000180078a4f  4488bf88010000           mov      byte ptr [rdi + 0x188], r15b
0000000180078a56  807b1003                 cmp      byte ptr [rbx + 0x10], 3
0000000180078a5a  0f85a5000000             jne      0x180078b05
0000000180078a60  4881c3f3100100           add      rbx, 0x110f3
0000000180078a67  bf90020000               mov      edi, 0x290
0000000180078a6c  4883e3fc                 and      rbx, 0xfffffffffffffffc
0000000180078a70  488b3c37                 mov      rdi, qword ptr [rdi + rsi]
0000000180078a74  4881c70b030000           add      rdi, 0x30b
0000000180078a7b  4883e7fc                 and      rdi, 0xfffffffffffffffc
0000000180078a7f  4438bbe9020000           cmp      byte ptr [rbx + 0x2e9], r15b
0000000180078a86  7509                     jne      0x180078a91
0000000180078a88  4439bbe0020000           cmp      dword ptr [rbx + 0x2e0], r15d
0000000180078a8f  7513                     jne      0x180078aa4
0000000180078a91  4438bbea020000           cmp      byte ptr [rbx + 0x2ea], r15b
0000000180078a98  750a                     jne      0x180078aa4
0000000180078a9a  488bcf                   mov      rcx, rdi
0000000180078a9d  e87242ffff               call     0x18006cd14
0000000180078aa2  eb0e                     jmp      0x180078ab2
0000000180078aa4  4533c0                   xor      r8d, r8d
0000000180078aa7  488bd3                   mov      rdx, rbx
0000000180078aaa  488bcf                   mov      rcx, rdi
0000000180078aad  e8de37ffff               call     0x18006c290
0000000180078ab2  4439a3b4020000           cmp      dword ptr [rbx + 0x2b4], r12d
0000000180078ab9  7510                     jne      0x180078acb
0000000180078abb  488d8bb8020000           lea      rcx, [rbx + 0x2b8]
0000000180078ac2  e8dd45f9ff               call     0x18000d0a4
0000000180078ac7  84c0                     test     al, al
0000000180078ac9  753a                     jne      0x180078b05
0000000180078acb  488bcb                   mov      rcx, rbx
0000000180078ace  e80d3dffff               call     0x18006c7e0
0000000180078ad3  84c0                     test     al, al
0000000180078ad5  742e                     je       0x180078b05
0000000180078ad7  488d9380000000           lea      rdx, [rbx + 0x80]
0000000180078ade  488bcf                   mov      rcx, rdi
0000000180078ae1  e826a40800               call     0x180102f0c
0000000180078ae6  488d9380010000           lea      rdx, [rbx + 0x180]
0000000180078aed  664489bfe9020000         mov      word ptr [rdi + 0x2e9], r15w
0000000180078af5  488bcf                   mov      rcx, rdi
0000000180078af8  e84fa40800               call     0x180102f4c
0000000180078afd  664489bfe9020000         mov      word ptr [rdi + 0x2e9], r15w
0000000180078b05  bf20000000               mov      edi, 0x20
0000000180078b0a  488b1c37                 mov      rbx, qword ptr [rdi + rsi]
0000000180078b0e  48638b1c840000           movsxd   rcx, dword ptr [rbx + 0x841c]
0000000180078b15  8d41ff                   lea      eax, [rcx - 1]
0000000180078b18  83f803                   cmp      eax, 3
0000000180078b1b  770a                     ja       0x180078b27
0000000180078b1d  498b94cd785fb900         mov      rdx, qword ptr [r13 + rcx*8 + 0xb95f78]
0000000180078b25  eb03                     jmp      0x180078b2a
0000000180078b27  498bd7                   mov      rdx, r15
0000000180078b2a  4885d2                   test     rdx, rdx
0000000180078b2d  0f84fc000000             je       0x180078c2f
0000000180078b33  488b1dfe16ba00           mov      rbx, qword ptr [rip + 0xba16fe] ; 0x180c1a238
0000000180078b3a  8d41ff                   lea      eax, [rcx - 1]
0000000180078b3d  418aff                   mov      dil, r15b
0000000180078b40  83f803                   cmp      eax, 3
0000000180078b43  7715                     ja       0x180078b5a
0000000180078b45  498b8ccd785fb900         mov      rcx, qword ptr [r13 + rcx*8 + 0xb95f78]
0000000180078b4d  488b01                   mov      rax, qword ptr [rcx]
0000000180078b50  ff9000030000             call     qword ptr [rax + 0x300]
0000000180078b56  84c0                     test     al, al
0000000180078b58  7438                     je       0x180078b92
0000000180078b5a  8b83fc040000             mov      eax, dword ptr [rbx + 0x4fc]
0000000180078b60  413bc4                   cmp      eax, r12d
0000000180078b63  0f84b6000000             je       0x180078c1f
0000000180078b69  0fb7c8                   movzx    ecx, ax
0000000180078b6c  488b058d1aba00           mov      rax, qword ptr [rip + 0xba1a8d] ; 0x180c1a600
0000000180078b73  400fb6ff                 movzx    edi, dil
0000000180078b77  8b54c804                 mov      edx, dword ptr [rax + rcx*8 + 4]
0000000180078b7b  8bc2                     mov      eax, edx
0000000180078b7d  48c1e81c                 shr      rax, 0x1c
0000000180078b81  498b8cc5209fe304         mov      rcx, qword ptr [r13 + rax*8 + 0x4e39f20]
0000000180078b89  44397c910c               cmp      dword ptr [rcx + rdx*4 + 0xc], r15d
0000000180078b8e  410f44fe                 cmove    edi, r14d
0000000180078b92  4084ff                   test     dil, dil
0000000180078b95  0f8584000000             jne      0x180078c1f
0000000180078b9b  e8e8631100               call     0x18018ef88
0000000180078ba0  b820000000               mov      eax, 0x20
0000000180078ba5  488b3c30                 mov      rdi, qword ptr [rax + rsi]
0000000180078ba9  488d8fd4350000           lea      rcx, [rdi + 0x35d4]
0000000180078bb0  e8b7331000               call     0x18017bf6c
0000000180078bb5  48638f1c840000           movsxd   rcx, dword ptr [rdi + 0x841c]
0000000180078bbc  8d41ff                   lea      eax, [rcx - 1]
0000000180078bbf  83f803                   cmp      eax, 3
0000000180078bc2  770a                     ja       0x180078bce
0000000180078bc4  498b8ccd785fb900         mov      rcx, qword ptr [r13 + rcx*8 + 0xb95f78]
0000000180078bcc  eb03                     jmp      0x180078bd1
0000000180078bce  498bcf                   mov      rcx, r15
0000000180078bd1  488b01                   mov      rax, qword ptr [rcx]
0000000180078bd4  ff5040                   call     qword ptr [rax + 0x40]
0000000180078bd7  bf20000000               mov      edi, 0x20
0000000180078bdc  488b1c37                 mov      rbx, qword ptr [rdi + rsi]
0000000180078be0  84c0                     test     al, al
0000000180078be2  7507                     jne      0x180078beb
0000000180078be4  4489bb1c840000           mov      dword ptr [rbx + 0x841c], r15d
0000000180078beb  48638b1c840000           movsxd   rcx, dword ptr [rbx + 0x841c]
0000000180078bf2  8d41ff                   lea      eax, [rcx - 1]
0000000180078bf5  83f803                   cmp      eax, 3
0000000180078bf8  770a                     ja       0x180078c04
0000000180078bfa  498b8ccd785fb900         mov      rcx, qword ptr [r13 + rcx*8 + 0xb95f78]
0000000180078c02  eb03                     jmp      0x180078c07
0000000180078c04  498bcf                   mov      rcx, r15
0000000180078c07  4885c9                   test     rcx, rcx
0000000180078c0a  740c                     je       0x180078c18
0000000180078c0c  f60308                   test     byte ptr [rbx], 8
0000000180078c0f  7407                     je       0x180078c18
0000000180078c11  c74306ff01ff00           mov      dword ptr [rbx + 6], 0xff01ff
0000000180078c18  e827370000               call     0x18007c344
0000000180078c1d  eb10                     jmp      0x180078c2f
0000000180078c1f  bf20000000               mov      edi, 0x20
0000000180078c24  488b1c37                 mov      rbx, qword ptr [rdi + rsi]
0000000180078c28  4489bb1c840000           mov      dword ptr [rbx + 0x841c], r15d
0000000180078c2f  e8007a0000               call     0x180080634
0000000180078c34  4885c0                   test     rax, rax
0000000180078c37  7408                     je       0x180078c41
0000000180078c39  488bc8                   mov      rcx, rax
0000000180078c3c  e80b691100               call     0x18018f54c
0000000180078c41  b890020000               mov      eax, 0x290
0000000180078c46  488b0430                 mov      rax, qword ptr [rax + rsi]
0000000180078c4a  4883c044                 add      rax, 0x44
0000000180078c4e  448920                   mov      dword ptr [rax], r12d
0000000180078c51  488d400c                 lea      rax, [rax + 0xc]
0000000180078c55  492bee                   sub      rbp, r14
0000000180078c58  75f4                     jne      0x180078c4e
0000000180078c5a  bd03000000               mov      ebp, 3
0000000180078c5f  4881c3702d0000           add      rbx, 0x2d70
0000000180078c66  b840000000               mov      eax, 0x40
0000000180078c6b  448923                   mov      dword ptr [rbx], r12d
0000000180078c6e  488d5b14                 lea      rbx, [rbx + 0x14]
0000000180078c72  492bc6                   sub      rax, r14
0000000180078c75  75f4                     jne      0x180078c6b
0000000180078c77  e8746f1100               call     0x18018fbf0
0000000180078c7c  488b0437                 mov      rax, qword ptr [rdi + rsi]
0000000180078c80  4c8b0d7919ba00           mov      r9, qword ptr [rip + 0xba1979] ; 0x180c1a600
0000000180078c87  4c89b820840000           mov      qword ptr [rax + 0x8420], r15
0000000180078c8e  8b05a031a800             mov      eax, dword ptr [rip + 0xa831a0] ; 0x180afbe34
0000000180078c94  0fb7c8                   movzx    ecx, ax
0000000180078c97  418b54c904               mov      edx, dword ptr [r9 + rcx*8 + 4]
0000000180078c9c  8bc2                     mov      eax, edx
0000000180078c9e  48c1e81c                 shr      rax, 0x1c
0000000180078ca2  498b84c5209fe304         mov      rax, qword ptr [r13 + rax*8 + 0x4e39f20]
0000000180078caa  488d3c90                 lea      rdi, [rax + rdx*4]
0000000180078cae  4885ff                   test     rdi, rdi
0000000180078cb1  0f84fe000000             je       0x180078db5
0000000180078cb7  e800fffdff               call     0x180058bbc
0000000180078cbc  84c0                     test     al, al
0000000180078cbe  7434                     je       0x180078cf4
0000000180078cc0  8b870c050000             mov      eax, dword ptr [rdi + 0x50c]
0000000180078cc6  413bc4                   cmp      eax, r12d
0000000180078cc9  741c                     je       0x180078ce7
0000000180078ccb  0fb7c0                   movzx    eax, ax
0000000180078cce  418b4cc104               mov      ecx, dword ptr [r9 + rax*8 + 4]
0000000180078cd3  8bc1                     mov      eax, ecx
0000000180078cd5  48c1e81c                 shr      rax, 0x1c
0000000180078cd9  498b84c5209fe304         mov      rax, qword ptr [r13 + rax*8 + 0x4e39f20]
0000000180078ce1  488d1488                 lea      rdx, [rax + rcx*4]
0000000180078ce5  eb03                     jmp      0x180078cea
0000000180078ce7  498bd7                   mov      rdx, r15
0000000180078cea  4885d2                   test     rdx, rdx
0000000180078ced  7474                     je       0x180078d63
0000000180078cef  8b423c                   mov      eax, dword ptr [rdx + 0x3c]
0000000180078cf2  eb72                     jmp      0x180078d66
0000000180078cf4  b848000000               mov      eax, 0x48
0000000180078cf9  488b0430                 mov      rax, qword ptr [rax + rsi]
0000000180078cfd  40386810                 cmp      byte ptr [rax + 0x10], bpl
0000000180078d01  0f85ae000000             jne      0x180078db5
0000000180078d07  8b87fc040000             mov      eax, dword ptr [rdi + 0x4fc]
0000000180078d0d  413bc4                   cmp      eax, r12d
0000000180078d10  741c                     je       0x180078d2e
0000000180078d12  0fb7c0                   movzx    eax, ax
0000000180078d15  418b4cc104               mov      ecx, dword ptr [r9 + rax*8 + 4]
0000000180078d1a  8bc1                     mov      eax, ecx
0000000180078d1c  48c1e81c                 shr      rax, 0x1c
0000000180078d20  498b84c5209fe304         mov      rax, qword ptr [r13 + rax*8 + 0x4e39f20]
0000000180078d28  488d1488                 lea      rdx, [rax + rcx*4]
0000000180078d2c  eb03                     jmp      0x180078d31
0000000180078d2e  498bd7                   mov      rdx, r15
0000000180078d31  4885d2                   test     rdx, rdx
0000000180078d34  741d                     je       0x180078d53
0000000180078d36  44397a0c                 cmp      dword ptr [rdx + 0xc], r15d
0000000180078d3a  7e17                     jle      0x180078d53
0000000180078d3c  8b4a10                   mov      ecx, dword ptr [rdx + 0x10]
0000000180078d3f  8bc1                     mov      eax, ecx
0000000180078d41  48c1e81c                 shr      rax, 0x1c
0000000180078d45  498b84c5209fe304         mov      rax, qword ptr [r13 + rax*8 + 0x4e39f20]
0000000180078d4d  488d1488                 lea      rdx, [rax + rcx*4]
0000000180078d51  eb03                     jmp      0x180078d56
0000000180078d53  498bd7                   mov      rdx, r15
0000000180078d56  4885d2                   test     rdx, rdx
0000000180078d59  7408                     je       0x180078d63
0000000180078d5b  8b8264010000             mov      eax, dword ptr [rdx + 0x164]
0000000180078d61  eb03                     jmp      0x180078d66
0000000180078d63  418bc4                   mov      eax, r12d
0000000180078d66  413bc4                   cmp      eax, r12d
0000000180078d69  744a                     je       0x180078db5
0000000180078d6b  0fb7c8                   movzx    ecx, ax
0000000180078d6e  418b54c904               mov      edx, dword ptr [r9 + rcx*8 + 4]
0000000180078d73  8bc2                     mov      eax, edx
0000000180078d75  48c1e81c                 shr      rax, 0x1c
0000000180078d79  498b84c5209fe304         mov      rax, qword ptr [r13 + rax*8 + 0x4e39f20]
0000000180078d81  488d0c90                 lea      rcx, [rax + rdx*4]
0000000180078d85  4885c9                   test     rcx, rcx
0000000180078d88  742b                     je       0x180078db5
0000000180078d8a  0f1001                   movups   xmm0, xmmword ptr [rcx]
0000000180078d8d  0f110584247902           movups   xmmword ptr [rip + 0x2792484], xmm0 ; 0x18280b218
0000000180078d94  0f104910                 movups   xmm1, xmmword ptr [rcx + 0x10]
0000000180078d98  0f110d89247902           movups   xmmword ptr [rip + 0x2792489], xmm1 ; 0x18280b228
0000000180078d9f  0f104120                 movups   xmm0, xmmword ptr [rcx + 0x20]
0000000180078da3  0f11058e247902           movups   xmmword ptr [rip + 0x279248e], xmm0 ; 0x18280b238
0000000180078daa  8b4130                   mov      eax, dword ptr [rcx + 0x30]
0000000180078dad  890595247902             mov      dword ptr [rip + 0x2792495], eax ; 0x18280b248
0000000180078db3  eb45                     jmp      0x180078dfa
0000000180078db5  44213d70247902           and      dword ptr [rip + 0x2792470], r15d ; 0x18280b22c
0000000180078dbc  0f57c0                   xorps    xmm0, xmm0
0000000180078dbf  44213d6a247902           and      dword ptr [rip + 0x279246a], r15d ; 0x18280b230
0000000180078dc6  f30f7f0566247902         movdqu   xmmword ptr [rip + 0x2792466], xmm0 ; 0x18280b234
0000000180078dce  4c893d4f247902           mov      qword ptr [rip + 0x279244f], r15 ; 0x18280b224
0000000180078dd5  4c893d68247902           mov      qword ptr [rip + 0x2792468], r15 ; 0x18280b244
0000000180078ddc  c7053224790202000200     mov      dword ptr [rip + 0x2792432], 0x20002 ; 0x18280b218
0000000180078de6  c7052c24790203000200     mov      dword ptr [rip + 0x279242c], 0x20003 ; 0x18280b21c
0000000180078df0  c705262479020100ff0f     mov      dword ptr [rip + 0x2792426], 0xfff0001 ; 0x18280b220
0000000180078dfa  488b5c2450               mov      rbx, qword ptr [rsp + 0x50]
0000000180078dff  488b6c2458               mov      rbp, qword ptr [rsp + 0x58]
0000000180078e04  488b742460               mov      rsi, qword ptr [rsp + 0x60]
0000000180078e09  4883c420                 add      rsp, 0x20
0000000180078e0d  415f                     pop      r15
0000000180078e0f  415e                     pop      r14
0000000180078e11  415d                     pop      r13
0000000180078e13  415c                     pop      r12
0000000180078e15  5f                       pop      rdi
0000000180078e16  c3                       ret      
