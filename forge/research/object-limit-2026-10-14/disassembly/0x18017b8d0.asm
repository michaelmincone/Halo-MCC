; PE exception-table range 0x18017b8d0..0x18017b9df (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017b8d0  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018017b8d5  48896c2410               mov      qword ptr [rsp + 0x10], rbp
000000018017b8da  4889742418               mov      qword ptr [rsp + 0x18], rsi
000000018017b8df  57                       push     rdi
000000018017b8e0  4156                     push     r14
000000018017b8e2  4157                     push     r15
000000018017b8e4  4883ec20                 sub      rsp, 0x20
000000018017b8e8  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018017b8f1  8b1521c2a900             mov      edx, dword ptr [rip + 0xa9c221] ; 0x180c17b18
000000018017b8f7  8bf1                     mov      esi, ecx
000000018017b8f9  488b1cd0                 mov      rbx, qword ptr [rax + rdx*8]
000000018017b8fd  b848000000               mov      eax, 0x48
000000018017b902  488b0418                 mov      rax, qword ptr [rax + rbx]
000000018017b906  80781104                 cmp      byte ptr [rax + 0x11], 4
000000018017b90a  0f84b6000000             je       0x18017b9c6
000000018017b910  41be20000000             mov      r14d, 0x20
000000018017b916  498b041e                 mov      rax, qword ptr [r14 + rbx]
000000018017b91a  4863901c840000           movsxd   rdx, dword ptr [rax + 0x841c]
000000018017b921  8d42ff                   lea      eax, [rdx - 1]
000000018017b924  83f803                   cmp      eax, 3
000000018017b927  770d                     ja       0x18017b936
000000018017b929  488d0d48a6a100           lea      rcx, [rip + 0xa1a648] ; 0x180b95f78
000000018017b930  488b0cd1                 mov      rcx, qword ptr [rcx + rdx*8]
000000018017b934  eb02                     jmp      0x18017b938
000000018017b936  33c9                     xor      ecx, ecx
000000018017b938  4885c9                   test     rcx, rcx
000000018017b93b  0f8485000000             je       0x18017b9c6
000000018017b941  0fb7ce                   movzx    ecx, si
000000018017b944  41bf10000000             mov      r15d, 0x10
000000018017b94a  488d3c49                 lea      rdi, [rcx + rcx*2]
000000018017b94e  498b041f                 mov      rax, qword ptr [r15 + rbx]
000000018017b952  488b5050                 mov      rdx, qword ptr [rax + 0x50]
000000018017b956  b801000000               mov      eax, 1
000000018017b95b  8a4cfa04                 mov      cl, byte ptr [rdx + rdi*8 + 4]
000000018017b95f  d3e0                     shl      eax, cl
000000018017b961  a90e050000               test     eax, 0x50e
000000018017b966  745e                     je       0x18017b9c6
000000018017b968  488b44fa10               mov      rax, qword ptr [rdx + rdi*8 + 0x10]
000000018017b96d  83cdff                   or       ebp, 0xffffffff
000000018017b970  663ba892010000           cmp      bp, word ptr [rax + 0x192]
000000018017b977  744d                     je       0x18017b9c6
000000018017b979  e85e140000               call     0x18017cddc
000000018017b97e  84c0                     test     al, al
000000018017b980  7444                     je       0x18017b9c6
000000018017b982  498b041f                 mov      rax, qword ptr [r15 + rbx]
000000018017b986  488b4850                 mov      rcx, qword ptr [rax + 0x50]
000000018017b98a  488b54f910               mov      rdx, qword ptr [rcx + rdi*8 + 0x10]
000000018017b98f  480fbf8292010000         movsx    rax, word ptr [rdx + 0x192]
000000018017b997  8a4c1012                 mov      cl, byte ptr [rax + rdx + 0x12]
000000018017b99b  c0e904                   shr      cl, 4
000000018017b99e  f6c101                   test     cl, 1
000000018017b9a1  7523                     jne      0x18017b9c6
000000018017b9a3  663b6a1c                 cmp      bp, word ptr [rdx + 0x1c]
000000018017b9a7  7506                     jne      0x18017b9af
000000018017b9a9  663b6a1a                 cmp      bp, word ptr [rdx + 0x1a]
000000018017b9ad  7417                     je       0x18017b9c6
000000018017b9af  498b0c1e                 mov      rcx, qword ptr [r14 + rbx]
000000018017b9b3  448bc6                   mov      r8d, esi
000000018017b9b6  0fbf521c                 movsx    edx, word ptr [rdx + 0x1c]
000000018017b9ba  4881c1d4350000           add      rcx, 0x35d4
000000018017b9c1  e8e2080000               call     0x18017c2a8
000000018017b9c6  488b5c2440               mov      rbx, qword ptr [rsp + 0x40]
000000018017b9cb  488b6c2448               mov      rbp, qword ptr [rsp + 0x48]
000000018017b9d0  488b742450               mov      rsi, qword ptr [rsp + 0x50]
000000018017b9d5  4883c420                 add      rsp, 0x20
000000018017b9d9  415f                     pop      r15
000000018017b9db  415e                     pop      r14
000000018017b9dd  5f                       pop      rdi
000000018017b9de  c3                       ret      
