; PE exception-table range 0x18017bb54..0x18017bcf5 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017bb54  48895c2410               mov      qword ptr [rsp + 0x10], rbx
000000018017bb59  48896c2418               mov      qword ptr [rsp + 0x18], rbp
000000018017bb5e  4889742420               mov      qword ptr [rsp + 0x20], rsi
000000018017bb63  57                       push     rdi
000000018017bb64  4155                     push     r13
000000018017bb66  4157                     push     r15
000000018017bb68  4883ec20                 sub      rsp, 0x20
000000018017bb6c  837904ff                 cmp      dword ptr [rcx + 4], -1
000000018017bb70  488bd9                   mov      rbx, rcx
000000018017bb73  0f8463010000             je       0x18017bcdc
000000018017bb79  8b5108                   mov      edx, dword ptr [rcx + 8]
000000018017bb7c  4533ff                   xor      r15d, r15d
000000018017bb7f  41bd20000000             mov      r13d, 0x20
000000018017bb85  83faff                   cmp      edx, -1
000000018017bb88  7429                     je       0x18017bbb3
000000018017bb8a  448b0587bfa900           mov      r8d, dword ptr [rip + 0xa9bf87] ; 0x180c17b18
000000018017bb91  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018017bb9a  4a8b04c0                 mov      rax, qword ptr [rax + r8*8]
000000018017bb9e  4a8b0c28                 mov      rcx, qword ptr [rax + r13]
000000018017bba2  4881c1d4350000           add      rcx, 0x35d4
000000018017bba9  e8820c0000               call     0x18017c830
000000018017bbae  488bf8                   mov      rdi, rax
000000018017bbb1  eb03                     jmp      0x18017bbb6
000000018017bbb3  498bff                   mov      rdi, r15
000000018017bbb6  4885ff                   test     rdi, rdi
000000018017bbb9  7409                     je       0x18017bbc4
000000018017bbbb  40b501                   mov      bpl, 1
000000018017bbbe  44387f06                 cmp      byte ptr [rdi + 6], r15b
000000018017bbc2  7503                     jne      0x18017bbc7
000000018017bbc4  418aef                   mov      bpl, r15b
000000018017bbc7  4885ff                   test     rdi, rdi
000000018017bbca  743c                     je       0x18017bc08
000000018017bbcc  8b0d46bfa900             mov      ecx, dword ptr [rip + 0xa9bf46] ; 0x180c17b18
000000018017bbd2  40b601                   mov      sil, 1
000000018017bbd5  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018017bbde  ba10000000               mov      edx, 0x10
000000018017bbe3  488b04c8                 mov      rax, qword ptr [rax + rcx*8]
000000018017bbe7  488b1410                 mov      rdx, qword ptr [rax + rdx]
000000018017bbeb  0fb707                   movzx    eax, word ptr [rdi]
000000018017bbee  488d0c40                 lea      rcx, [rax + rax*2]
000000018017bbf2  488b4250                 mov      rax, qword ptr [rdx + 0x50]
000000018017bbf6  488b4cc810               mov      rcx, qword ptr [rax + rcx*8 + 0x10]
000000018017bbfb  8b8138010000             mov      eax, dword ptr [rcx + 0x138]
000000018017bc01  c1e802                   shr      eax, 2
000000018017bc04  a801                     test     al, 1
000000018017bc06  7503                     jne      0x18017bc0b
000000018017bc08  418af7                   mov      sil, r15b
000000018017bc0b  b9ff7f0000               mov      ecx, 0x7fff
000000018017bc10  4885ff                   test     rdi, rdi
000000018017bc13  7421                     je       0x18017bc36
000000018017bc15  66394b0c                 cmp      word ptr [rbx + 0xc], cx
000000018017bc19  751b                     jne      0x18017bc36
000000018017bc1b  4084ed                   test     bpl, bpl
000000018017bc1e  7405                     je       0x18017bc25
000000018017bc20  f60304                   test     byte ptr [rbx], 4
000000018017bc23  7511                     jne      0x18017bc36
000000018017bc25  4084f6                   test     sil, sil
000000018017bc28  7405                     je       0x18017bc2f
000000018017bc2a  f60308                   test     byte ptr [rbx], 8
000000018017bc2d  7507                     jne      0x18017bc36
000000018017bc2f  44887c2440               mov      byte ptr [rsp + 0x40], r15b
000000018017bc34  eb42                     jmp      0x18017bc78
000000018017bc36  0fb7430c                 movzx    eax, word ptr [rbx + 0xc]
000000018017bc3a  44887c2440               mov      byte ptr [rsp + 0x40], r15b
000000018017bc3f  663bc1                   cmp      ax, cx
000000018017bc42  7523                     jne      0x18017bc67
000000018017bc44  8b4b04                   mov      ecx, dword ptr [rbx + 4]
000000018017bc47  e8240c0000               call     0x18017c870
000000018017bc4c  6689430c                 mov      word ptr [rbx + 0xc], ax
000000018017bc50  6685c0                   test     ax, ax
000000018017bc53  7523                     jne      0x18017bc78
000000018017bc55  834b04ff                 or       dword ptr [rbx + 4], 0xffffffff
000000018017bc59  834b08ff                 or       dword ptr [rbx + 8], 0xffffffff
000000018017bc5d  44883b                   mov      byte ptr [rbx], r15b
000000018017bc60  6644897b0c               mov      word ptr [rbx + 0xc], r15w
000000018017bc65  eb11                     jmp      0x18017bc78
000000018017bc67  b90080ffff               mov      ecx, 0xffff8000
000000018017bc6c  663bc1                   cmp      ax, cx
000000018017bc6f  7403                     je       0x18017bc74
000000018017bc71  8d48ff                   lea      ecx, [rax - 1]
000000018017bc74  66894b0c                 mov      word ptr [rbx + 0xc], cx
000000018017bc78  8b5304                   mov      edx, dword ptr [rbx + 4]
000000018017bc7b  83faff                   cmp      edx, -1
000000018017bc7e  745c                     je       0x18017bcdc
000000018017bc80  4885ff                   test     rdi, rdi
000000018017bc83  740a                     je       0x18017bc8f
000000018017bc85  4084ed                   test     bpl, bpl
000000018017bc88  7505                     jne      0x18017bc8f
000000018017bc8a  4084f6                   test     sil, sil
000000018017bc8d  744d                     je       0x18017bcdc
000000018017bc8f  448b0582bea900           mov      r8d, dword ptr [rip + 0xa9be82] ; 0x180c17b18
000000018017bc96  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018017bc9f  4a8b04c0                 mov      rax, qword ptr [rax + r8*8]
000000018017bca3  4c8d442440               lea      r8, [rsp + 0x40]
000000018017bca8  4a8b3c28                 mov      rdi, qword ptr [rax + r13]
000000018017bcac  488d8fd4350000           lea      rcx, [rdi + 0x35d4]
000000018017bcb3  e894090000               call     0x18017c64c
000000018017bcb8  84c0                     test     al, al
000000018017bcba  7420                     je       0x18017bcdc
000000018017bcbc  6644397b0c               cmp      word ptr [rbx + 0xc], r15w
000000018017bcc1  7e07                     jle      0x18017bcca
000000018017bcc3  44387c2440               cmp      byte ptr [rsp + 0x40], r15b
000000018017bcc8  7412                     je       0x18017bcdc
000000018017bcca  8b5304                   mov      edx, dword ptr [rbx + 4]
000000018017bccd  488d8fd4350000           lea      rcx, [rdi + 0x35d4]
000000018017bcd4  4c8bc3                   mov      r8, rbx
000000018017bcd7  e8800a0000               call     0x18017c75c
000000018017bcdc  488b5c2448               mov      rbx, qword ptr [rsp + 0x48]
000000018017bce1  488b6c2450               mov      rbp, qword ptr [rsp + 0x50]
000000018017bce6  488b742458               mov      rsi, qword ptr [rsp + 0x58]
000000018017bceb  4883c420                 add      rsp, 0x20
000000018017bcef  415f                     pop      r15
000000018017bcf1  415d                     pop      r13
000000018017bcf3  5f                       pop      rdi
000000018017bcf4  c3                       ret      
