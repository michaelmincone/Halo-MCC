; PE exception-table range 0x18017c75c..0x18017c82e (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017c75c  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018017c761  48896c2410               mov      qword ptr [rsp + 0x10], rbp
000000018017c766  4889742418               mov      qword ptr [rsp + 0x18], rsi
000000018017c76b  57                       push     rdi
000000018017c76c  4154                     push     r12
000000018017c76e  4155                     push     r13
000000018017c770  4156                     push     r14
000000018017c772  4157                     push     r15
000000018017c774  4883ec20                 sub      rsp, 0x20
000000018017c778  4533ed                   xor      r13d, r13d
000000018017c77b  488be9                   mov      rbp, rcx
000000018017c77e  8bca                     mov      ecx, edx
000000018017c780  418bdd                   mov      ebx, r13d
000000018017c783  450fb7f5                 movzx    r14d, r13w
000000018017c787  498bf0                   mov      rsi, r8
000000018017c78a  e839fdffff               call     0x18017c4c8
000000018017c78f  448be0                   mov      r12d, eax
000000018017c792  488d7d0c                 lea      rdi, [rbp + 0xc]
000000018017c796  41bfcb020000             mov      r15d, 0x2cb
000000018017c79c  837ff8ff                 cmp      dword ptr [rdi - 8], -1
000000018017c7a0  741c                     je       0x18017c7be
000000018017c7a2  66443937                 cmp      word ptr [rdi], r14w
000000018017c7a6  7d16                     jge      0x18017c7be
000000018017c7a8  0fbf4ff8                 movsx    ecx, word ptr [rdi - 8]
000000018017c7ac  e817fdffff               call     0x18017c4c8
000000018017c7b1  413bc4                   cmp      eax, r12d
000000018017c7b4  7508                     jne      0x18017c7be
000000018017c7b6  440fb737                 movzx    r14d, word ptr [rdi]
000000018017c7ba  488d5ff4                 lea      rbx, [rdi - 0xc]
000000018017c7be  4883c710                 add      rdi, 0x10
000000018017c7c2  4983ef01                 sub      r15, 1
000000018017c7c6  75d4                     jne      0x18017c79c
000000018017c7c8  4885db                   test     rbx, rbx
000000018017c7cb  753c                     jne      0x18017c809
000000018017c7cd  4885f6                   test     rsi, rsi
000000018017c7d0  7405                     je       0x18017c7d7
000000018017c7d2  488bde                   mov      rbx, rsi
000000018017c7d5  eb2d                     jmp      0x18017c804
000000018017c7d7  418bc5                   mov      eax, r13d
000000018017c7da  488d4d04                 lea      rcx, [rbp + 4]
000000018017c7de  498bd5                   mov      rdx, r13
000000018017c7e1  8339ff                   cmp      dword ptr [rcx], -1
000000018017c7e4  7414                     je       0x18017c7fa
000000018017c7e6  ffc0                     inc      eax
000000018017c7e8  48ffc2                   inc      rdx
000000018017c7eb  4883c110                 add      rcx, 0x10
000000018017c7ef  4881facb020000           cmp      rdx, 0x2cb
000000018017c7f6  7ce9                     jl       0x18017c7e1
000000018017c7f8  eb17                     jmp      0x18017c811
000000018017c7fa  4863d8                   movsxd   rbx, eax
000000018017c7fd  48c1e304                 shl      rbx, 4
000000018017c801  4803dd                   add      rbx, rbp
000000018017c804  4885db                   test     rbx, rbx
000000018017c807  7408                     je       0x18017c811
000000018017c809  488bcb                   mov      rcx, rbx
000000018017c80c  e8e7f4ffff               call     0x18017bcf8
000000018017c811  488b5c2450               mov      rbx, qword ptr [rsp + 0x50]
000000018017c816  488b6c2458               mov      rbp, qword ptr [rsp + 0x58]
000000018017c81b  488b742460               mov      rsi, qword ptr [rsp + 0x60]
000000018017c820  4883c420                 add      rsp, 0x20
000000018017c824  415f                     pop      r15
000000018017c826  415e                     pop      r14
000000018017c828  415d                     pop      r13
000000018017c82a  415c                     pop      r12
000000018017c82c  5f                       pop      rdi
000000018017c82d  c3                       ret      
