; PE exception-table range 0x18017c870..0x18017c97f (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017c870  488bc4                   mov      rax, rsp
000000018017c873  48895808                 mov      qword ptr [rax + 8], rbx
000000018017c877  48897010                 mov      qword ptr [rax + 0x10], rsi
000000018017c87b  48897818                 mov      qword ptr [rax + 0x18], rdi
000000018017c87f  4c897020                 mov      qword ptr [rax + 0x20], r14
000000018017c883  55                       push     rbp
000000018017c884  488bec                   mov      rbp, rsp
000000018017c887  4883ec70                 sub      rsp, 0x70
000000018017c88b  448bf1                   mov      r14d, ecx
000000018017c88e  33ff                     xor      edi, edi
000000018017c890  e857f4eeff               call     0x18006bcec
000000018017c895  4885c0                   test     rax, rax
000000018017c898  0f84c5000000             je       0x18017c963
000000018017c89e  e849f4eeff               call     0x18006bcec
000000018017c8a3  33d2                     xor      edx, edx
000000018017c8a5  448d474c                 lea      r8d, [rdi + 0x4c]
000000018017c8a9  488d4db0                 lea      rcx, [rbp - 0x50]
000000018017c8ad  488bd8                   mov      rbx, rax
000000018017c8b0  e875ca6000               call     0x18078932a
000000018017c8b5  83ceff                   or       esi, 0xffffffff
000000018017c8b8  48897df1                 mov      qword ptr [rbp - 0xf], rdi
000000018017c8bc  33c0                     xor      eax, eax
000000018017c8be  66897df9                 mov      word ptr [rbp - 7], di
000000018017c8c2  4c8d45b0                 lea      r8, [rbp - 0x50]
000000018017c8c6  488945e0                 mov      qword ptr [rbp - 0x20], rax
000000018017c8ca  418bd6                   mov      edx, r14d
000000018017c8cd  488945e8                 mov      qword ptr [rbp - 0x18], rax
000000018017c8d1  488bcb                   mov      rcx, rbx
000000018017c8d4  668975b2                 mov      word ptr [rbp - 0x4e], si
000000018017c8d8  8975b4                   mov      dword ptr [rbp - 0x4c], esi
000000018017c8db  668975dc                 mov      word ptr [rbp - 0x24], si
000000018017c8df  40887dfb                 mov      byte ptr [rbp - 5], dil
000000018017c8e3  40887df0                 mov      byte ptr [rbp - 0x10], dil
000000018017c8e7  40887df3                 mov      byte ptr [rbp - 0xd], dil
000000018017c8eb  408875fa                 mov      byte ptr [rbp - 6], sil
000000018017c8ef  668975f4                 mov      word ptr [rbp - 0xc], si
000000018017c8f3  c645f708                 mov      byte ptr [rbp - 9], 8
000000018017c8f7  e8541cefff               call     0x18006e550
000000018017c8fc  418bce                   mov      ecx, r14d
000000018017c8ff  e8c4fbffff               call     0x18017c4c8
000000018017c904  4c8d0515d6cb04           lea      r8, [rip + 0x4cbd615] ; 0x184e39f20
000000018017c90b  3bc6                     cmp      eax, esi
000000018017c90d  741e                     je       0x18017c92d
000000018017c90f  0fb7c8                   movzx    ecx, ax
000000018017c912  488b05e7dca900           mov      rax, qword ptr [rip + 0xa9dce7] ; 0x180c1a600
000000018017c919  8b54c804                 mov      edx, dword ptr [rax + rcx*8 + 4]
000000018017c91d  8bc2                     mov      eax, edx
000000018017c91f  48c1e81c                 shr      rax, 0x1c
000000018017c923  498b04c0                 mov      rax, qword ptr [r8 + rax*8]
000000018017c927  488d0c90                 lea      rcx, [rax + rdx*4]
000000018017c92b  eb03                     jmp      0x18017c930
000000018017c92d  488bcf                   mov      rcx, rdi
000000018017c930  4885c9                   test     rcx, rcx
000000018017c933  741d                     je       0x18017c952
000000018017c935  39b940010000             cmp      dword ptr [rcx + 0x140], edi
000000018017c93b  7e15                     jle      0x18017c952
000000018017c93d  8b8944010000             mov      ecx, dword ptr [rcx + 0x144]
000000018017c943  8bc1                     mov      eax, ecx
000000018017c945  48c1e81c                 shr      rax, 0x1c
000000018017c949  498b04c0                 mov      rax, qword ptr [r8 + rax*8]
000000018017c94d  0fbf748816               movsx    esi, word ptr [rax + rcx*4 + 0x16]
000000018017c952  f645b003                 test     byte ptr [rbp - 0x50], 3
000000018017c956  7406                     je       0x18017c95e
000000018017c958  0fb67df2                 movzx    edi, byte ptr [rbp - 0xe]
000000018017c95c  eb05                     jmp      0x18017c963
000000018017c95e  85f6                     test     esi, esi
000000018017c960  0f4ffe                   cmovg    edi, esi
000000018017c963  4c8d5c2470               lea      r11, [rsp + 0x70]
000000018017c968  8bc7                     mov      eax, edi
000000018017c96a  498b5b10                 mov      rbx, qword ptr [r11 + 0x10]
000000018017c96e  498b7318                 mov      rsi, qword ptr [r11 + 0x18]
000000018017c972  498b7b20                 mov      rdi, qword ptr [r11 + 0x20]
000000018017c976  4d8b7328                 mov      r14, qword ptr [r11 + 0x28]
000000018017c97a  498be3                   mov      rsp, r11
000000018017c97d  5d                       pop      rbp
000000018017c97e  c3                       ret      
