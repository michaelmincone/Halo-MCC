; PE exception-table range 0x18017c4fc..0x18017c64a (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017c4fc  488bc4                   mov      rax, rsp
000000018017c4ff  48895808                 mov      qword ptr [rax + 8], rbx
000000018017c503  48897010                 mov      qword ptr [rax + 0x10], rsi
000000018017c507  48897818                 mov      qword ptr [rax + 0x18], rdi
000000018017c50b  4c896020                 mov      qword ptr [rax + 0x20], r12
000000018017c50f  55                       push     rbp
000000018017c510  4156                     push     r14
000000018017c512  4157                     push     r15
000000018017c514  488bec                   mov      rbp, rsp
000000018017c517  4883ec40                 sub      rsp, 0x40
000000018017c51b  33db                     xor      ebx, ebx
000000018017c51d  418bf8                   mov      edi, r8d
000000018017c520  4183caff                 or       r10d, 0xffffffff
000000018017c524  8bf2                     mov      esi, edx
000000018017c526  4c8bf1                   mov      r14, rcx
000000018017c529  453bc2                   cmp      r8d, r10d
000000018017c52c  0f84f8000000             je       0x18017c62a
000000018017c532  488b05c7e0a900           mov      rax, qword ptr [rip + 0xa9e0c7] ; 0x180c1a600
000000018017c539  488d0de0d9cb04           lea      rcx, [rip + 0x4cbd9e0] ; 0x184e39f20
000000018017c540  440fb7cf                 movzx    r9d, di
000000018017c544  468b44c804               mov      r8d, dword ptr [rax + r9*8 + 4]
000000018017c549  418bc0                   mov      eax, r8d
000000018017c54c  48c1e81c                 shr      rax, 0x1c
000000018017c550  488b04c1                 mov      rax, qword ptr [rcx + rax*8]
000000018017c554  420fbf0c80               movsx    ecx, word ptr [rax + r8*4]
000000018017c559  83f90d                   cmp      ecx, 0xd
000000018017c55c  0f87c8000000             ja       0x18017c62a
000000018017c562  48215de0                 and      qword ptr [rbp - 0x20], rbx
000000018017c566  8d5301                   lea      edx, [rbx + 1]
000000018017c569  d3e2                     shl      edx, cl
000000018017c56b  83c8ff                   or       eax, 0xffffffff
000000018017c56e  85d2                     test     edx, edx
000000018017c570  c745fc86868686           mov      dword ptr [rbp - 4], 0x86868686
000000018017c577  488d4de0                 lea      rcx, [rbp - 0x20]
000000018017c57b  448955f8                 mov      dword ptr [rbp - 8], r10d
000000018017c57f  0f45c2                   cmovne   eax, edx
000000018017c582  215dec                   and      dword ptr [rbp - 0x14], ebx
000000018017c585  215df0                   and      dword ptr [rbp - 0x10], ebx
000000018017c588  215df4                   and      dword ptr [rbp - 0xc], ebx
000000018017c58b  8945e8                   mov      dword ptr [rbp - 0x18], eax
000000018017c58e  e8e5742f00               call     0x180473a78
000000018017c593  84c0                     test     al, al
000000018017c595  0f848f000000             je       0x18017c62a
000000018017c59b  448b3d76b5a900           mov      r15d, dword ptr [rip + 0xa9b576] ; 0x180c17b18
000000018017c5a2  654c8b242558000000       mov      r12, qword ptr gs:[0x58]
000000018017c5ab  b910000000               mov      ecx, 0x10
000000018017c5b0  4c8b5de0                 mov      r11, qword ptr [rbp - 0x20]
000000018017c5b4  413b3b                   cmp      edi, dword ptr [r11]
000000018017c5b7  755f                     jne      0x18017c618
000000018017c5b9  4b8b04fc                 mov      rax, qword ptr [r12 + r15*8]
000000018017c5bd  488b1408                 mov      rdx, qword ptr [rax + rcx]
000000018017c5c1  0fb745f8                 movzx    eax, word ptr [rbp - 8]
000000018017c5c5  488d0c40                 lea      rcx, [rax + rax*2]
000000018017c5c9  488b4250                 mov      rax, qword ptr [rdx + 0x50]
000000018017c5cd  488b54c810               mov      rdx, qword ptr [rax + rcx*8 + 0x10]
000000018017c5d2  83c8ff                   or       eax, 0xffffffff
000000018017c5d5  663b8292010000           cmp      ax, word ptr [rdx + 0x192]
000000018017c5dc  7433                     je       0x18017c611
000000018017c5de  8b55f8                   mov      edx, dword ptr [rbp - 8]
000000018017c5e1  498bce                   mov      rcx, r14
000000018017c5e4  e847020000               call     0x18017c830
000000018017c5e9  4885c0                   test     rax, rax
000000018017c5ec  7423                     je       0x18017c611
000000018017c5ee  490fbf8392010000         movsx    rax, word ptr [r11 + 0x192]
000000018017c5f6  428a4c1812               mov      cl, byte ptr [rax + r11 + 0x12]
000000018017c5fb  c0e907                   shr      cl, 7
000000018017c5fe  f6c101                   test     cl, 1
000000018017c601  740e                     je       0x18017c611
000000018017c603  410fbf431c               movsx    eax, word ptr [r11 + 0x1c]
000000018017c608  33c9                     xor      ecx, ecx
000000018017c60a  3bc6                     cmp      eax, esi
000000018017c60c  0f94c1                   sete     cl
000000018017c60f  eb05                     jmp      0x18017c616
000000018017c611  b901000000               mov      ecx, 1
000000018017c616  03d9                     add      ebx, ecx
000000018017c618  488d4de0                 lea      rcx, [rbp - 0x20]
000000018017c61c  e857742f00               call     0x180473a78
000000018017c621  b910000000               mov      ecx, 0x10
000000018017c626  84c0                     test     al, al
000000018017c628  7586                     jne      0x18017c5b0
000000018017c62a  488b742468               mov      rsi, qword ptr [rsp + 0x68]
000000018017c62f  8bc3                     mov      eax, ebx
000000018017c631  488b5c2460               mov      rbx, qword ptr [rsp + 0x60]
000000018017c636  488b7c2470               mov      rdi, qword ptr [rsp + 0x70]
000000018017c63b  4c8b642478               mov      r12, qword ptr [rsp + 0x78]
000000018017c640  4883c440                 add      rsp, 0x40
000000018017c644  415f                     pop      r15
000000018017c646  415e                     pop      r14
000000018017c648  5d                       pop      rbp
000000018017c649  c3                       ret      
