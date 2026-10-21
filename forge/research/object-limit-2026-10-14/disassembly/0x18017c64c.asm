; PE exception-table range 0x18017c64c..0x18017c75a (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017c64c  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018017c651  4889742410               mov      qword ptr [rsp + 0x10], rsi
000000018017c656  48897c2418               mov      qword ptr [rsp + 0x18], rdi
000000018017c65b  55                       push     rbp
000000018017c65c  4154                     push     r12
000000018017c65e  4155                     push     r13
000000018017c660  4156                     push     r14
000000018017c662  4157                     push     r15
000000018017c664  488bec                   mov      rbp, rsp
000000018017c667  4883ec70                 sub      rsp, 0x70
000000018017c66b  4d8bf8                   mov      r15, r8
000000018017c66e  448be2                   mov      r12d, edx
000000018017c671  4c8be9                   mov      r13, rcx
000000018017c674  33f6                     xor      esi, esi
000000018017c676  e871f6eeff               call     0x18006bcec
000000018017c67b  4c8bf0                   mov      r14, rax
000000018017c67e  4885c0                   test     rax, rax
000000018017c681  0f84b2000000             je       0x18017c739
000000018017c687  33d2                     xor      edx, edx
000000018017c689  448d464c                 lea      r8d, [rsi + 0x4c]
000000018017c68d  488d4db0                 lea      rcx, [rbp - 0x50]
000000018017c691  e894cc6000               call     0x18078932a
000000018017c696  83cbff                   or       ebx, 0xffffffff
000000018017c699  488975f1                 mov      qword ptr [rbp - 0xf], rsi
000000018017c69d  33c0                     xor      eax, eax
000000018017c69f  668975f9                 mov      word ptr [rbp - 7], si
000000018017c6a3  4c8d45b0                 lea      r8, [rbp - 0x50]
000000018017c6a7  488945e0                 mov      qword ptr [rbp - 0x20], rax
000000018017c6ab  418bd4                   mov      edx, r12d
000000018017c6ae  488945e8                 mov      qword ptr [rbp - 0x18], rax
000000018017c6b2  498bce                   mov      rcx, r14
000000018017c6b5  66895db2                 mov      word ptr [rbp - 0x4e], bx
000000018017c6b9  895db4                   mov      dword ptr [rbp - 0x4c], ebx
000000018017c6bc  66895ddc                 mov      word ptr [rbp - 0x24], bx
000000018017c6c0  408875fb                 mov      byte ptr [rbp - 5], sil
000000018017c6c4  408875f0                 mov      byte ptr [rbp - 0x10], sil
000000018017c6c8  408875f3                 mov      byte ptr [rbp - 0xd], sil
000000018017c6cc  885dfa                   mov      byte ptr [rbp - 6], bl
000000018017c6cf  66895df4                 mov      word ptr [rbp - 0xc], bx
000000018017c6d3  c645f708                 mov      byte ptr [rbp - 9], 8
000000018017c6d7  418837                   mov      byte ptr [r15], sil
000000018017c6da  e8711eefff               call     0x18006e550
000000018017c6df  84c0                     test     al, al
000000018017c6e1  7456                     je       0x18017c739
000000018017c6e3  663b5db2                 cmp      bx, word ptr [rbp - 0x4e]
000000018017c6e7  7450                     je       0x18017c739
000000018017c6e9  480fbf7db2               movsx    rdi, word ptr [rbp - 0x4e]
000000018017c6ee  4533c0                   xor      r8d, r8d
000000018017c6f1  418bd4                   mov      edx, r12d
000000018017c6f4  498bce                   mov      rcx, r14
000000018017c6f7  498d1c7e                 lea      rbx, [r14 + rdi*2]
000000018017c6fb  e8c81fefff               call     0x18006e6c8
000000018017c700  448bc0                   mov      r8d, eax
000000018017c703  418bd4                   mov      edx, r12d
000000018017c706  498bcd                   mov      rcx, r13
000000018017c709  e8eefdffff               call     0x18017c4fc
000000018017c70e  0fb68c1f40d60000         movzx    ecx, byte ptr [rdi + rbx + 0xd640]
000000018017c716  0fb6941f41d60000         movzx    edx, byte ptr [rdi + rbx + 0xd641]
000000018017c71e  85c9                     test     ecx, ecx
000000018017c720  7408                     je       0x18017c72a
000000018017c722  3bc1                     cmp      eax, ecx
000000018017c724  0f9cc1                   setl     cl
000000018017c727  41880f                   mov      byte ptr [r15], cl
000000018017c72a  85d2                     test     edx, edx
000000018017c72c  7408                     je       0x18017c736
000000018017c72e  3bc2                     cmp      eax, edx
000000018017c730  400f9cc6                 setl     sil
000000018017c734  eb03                     jmp      0x18017c739
000000018017c736  40b601                   mov      sil, 1
000000018017c739  4c8d5c2470               lea      r11, [rsp + 0x70]
000000018017c73e  408ac6                   mov      al, sil
000000018017c741  498b5b30                 mov      rbx, qword ptr [r11 + 0x30]
000000018017c745  498b7338                 mov      rsi, qword ptr [r11 + 0x38]
000000018017c749  498b7b40                 mov      rdi, qword ptr [r11 + 0x40]
000000018017c74d  498be3                   mov      rsp, r11
000000018017c750  415f                     pop      r15
000000018017c752  415e                     pop      r14
000000018017c754  415d                     pop      r13
000000018017c756  415c                     pop      r12
000000018017c758  5d                       pop      rbp
000000018017c759  c3                       ret      
