; PE exception-table range 0x180198f2c..0x18019909f (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
0000000180198f2c  48895c2408               mov      qword ptr [rsp + 8], rbx
0000000180198f31  48896c2410               mov      qword ptr [rsp + 0x10], rbp
0000000180198f36  4889742420               mov      qword ptr [rsp + 0x20], rsi
0000000180198f3b  57                       push     rdi
0000000180198f3c  4154                     push     r12
0000000180198f3e  4155                     push     r13
0000000180198f40  4156                     push     r14
0000000180198f42  4157                     push     r15
0000000180198f44  4883ec30                 sub      rsp, 0x30
0000000180198f48  480fbfc1                 movsx    rax, cx
0000000180198f4c  488d2dedfd8800           lea      rbp, [rip + 0x88fded] ; 0x180a28d40
0000000180198f53  0fb7ca                   movzx    ecx, dx
0000000180198f56  4533ed                   xor      r13d, r13d
0000000180198f59  b301                     mov      bl, 1
0000000180198f5b  410fb7fd                 movzx    edi, r13w
0000000180198f5f  488b6cc500               mov      rbp, qword ptr [rbp + rax*8]
0000000180198f64  488b05cd18a800           mov      rax, qword ptr [rip + 0xa818cd] ; 0x180c1a838
0000000180198f6b  4c8d2449                 lea      r12, [rcx + rcx*2]
0000000180198f6f  4c89642470               mov      qword ptr [rsp + 0x70], r12
0000000180198f74  488b5050                 mov      rdx, qword ptr [rax + 0x50]
0000000180198f78  420fb744e210             movzx    eax, word ptr [rdx + r12*8 + 0x10]
0000000180198f7e  4c8d25e7515a04           lea      r12, [rip + 0x45a51e7] ; 0x18473e16c
0000000180198f85  488d0c40                 lea      rcx, [rax + rax*2]
0000000180198f89  448b74ca08               mov      r14d, dword ptr [rdx + rcx*8 + 8]
0000000180198f8e  663b7d38                 cmp      di, word ptr [rbp + 0x38]
0000000180198f92  0f8d8c000000             jge      0x180199024
0000000180198f98  4183feff                 cmp      r14d, -1
0000000180198f9c  0f8482000000             je       0x180199024
0000000180198fa2  488b058f18a800           mov      rax, qword ptr [rip + 0xa8188f] ; 0x180c1a838
0000000180198fa9  410fb7ce                 movzx    ecx, r14w
0000000180198fad  4c8b7850                 mov      r15, qword ptr [rax + 0x50]
0000000180198fb1  480fbfc7                 movsx    rax, di
0000000180198fb5  488d3449                 lea      rsi, [rcx + rcx*2]
0000000180198fb9  418bce                   mov      ecx, r14d
0000000180198fbc  0fb754453a               movzx    edx, word ptr [rbp + rax*2 + 0x3a]
0000000180198fc1  e81ed3ffff               call     0x1801962e4
0000000180198fc6  84c0                     test     al, al
0000000180198fc8  7407                     je       0x180198fd1
0000000180198fca  458b74f708               mov      r14d, dword ptr [r15 + rsi*8 + 8]
0000000180198fcf  eb48                     jmp      0x180199019
0000000180198fd1  6641837cf7040b           cmp      word ptr [r15 + rsi*8 + 4], 0xb
0000000180198fd8  753c                     jne      0x180199016
0000000180198fda  488b055718a800           mov      rax, qword ptr [rip + 0xa81857] ; 0x180c1a838
0000000180198fe1  488b4850                 mov      rcx, qword ptr [rax + 0x50]
0000000180198fe5  f644f10601               test     byte ptr [rcx + rsi*8 + 6], 1
0000000180198fea  742a                     je       0x180199016
0000000180198fec  4c8b4d08                 mov      r9, qword ptr [rbp + 8]
0000000180198ff0  4c8d05d9f88400           lea      r8, [rip + 0x84f8d9] ; 0x1809e88d0
0000000180198ff7  ba00040000               mov      edx, 0x400
0000000180198ffc  498bcc                   mov      rcx, r12
0000000180198fff  e81489e7ff               call     0x180011918
0000000180199004  4c892555515a04           mov      qword ptr [rip + 0x45a5155], r12 ; 0x18473e160
000000018019900b  418b44f70c               mov      eax, dword ptr [r15 + rsi*8 + 0xc]
0000000180199010  890552515a04             mov      dword ptr [rip + 0x45a5152], eax ; 0x18473e168
0000000180199016  418add                   mov      bl, r13b
0000000180199019  66ffc7                   inc      di
000000018019901c  84db                     test     bl, bl
000000018019901e  0f856affffff             jne      0x180198f8e
0000000180199024  4c8b642470               mov      r12, qword ptr [rsp + 0x70]
0000000180199029  84db                     test     bl, bl
000000018019902b  7453                     je       0x180199080
000000018019902d  663b7d38                 cmp      di, word ptr [rbp + 0x38]
0000000180199031  7506                     jne      0x180199039
0000000180199033  4183feff                 cmp      r14d, -1
0000000180199037  7447                     je       0x180199080
0000000180199039  0fbf4538                 movsx    eax, word ptr [rbp + 0x38]
000000018019903d  488d3528515a04           lea      rsi, [rip + 0x45a5128] ; 0x18473e16c
0000000180199044  4c8b4d08                 mov      r9, qword ptr [rbp + 8]
0000000180199048  4c8d0501f98400           lea      r8, [rip + 0x84f901] ; 0x1809e8950
000000018019904f  488bce                   mov      rcx, rsi
0000000180199052  89442420                 mov      dword ptr [rsp + 0x20], eax
0000000180199056  ba00040000               mov      edx, 0x400
000000018019905b  e8b888e7ff               call     0x180011918
0000000180199060  488b05d117a800           mov      rax, qword ptr [rip + 0xa817d1] ; 0x180c1a838
0000000180199067  418add                   mov      bl, r13b
000000018019906a  488935ef505a04           mov      qword ptr [rip + 0x45a50ef], rsi ; 0x18473e160
0000000180199071  488b4850                 mov      rcx, qword ptr [rax + 0x50]
0000000180199075  428b44e10c               mov      eax, dword ptr [rcx + r12*8 + 0xc]
000000018019907a  8905e8505a04             mov      dword ptr [rip + 0x45a50e8], eax ; 0x18473e168
0000000180199080  488b6c2468               mov      rbp, qword ptr [rsp + 0x68]
0000000180199085  8ac3                     mov      al, bl
0000000180199087  488b5c2460               mov      rbx, qword ptr [rsp + 0x60]
000000018019908c  488b742478               mov      rsi, qword ptr [rsp + 0x78]
0000000180199091  4883c430                 add      rsp, 0x30
0000000180199095  415f                     pop      r15
0000000180199097  415e                     pop      r14
0000000180199099  415d                     pop      r13
000000018019909b  415c                     pop      r12
000000018019909d  5f                       pop      rdi
000000018019909e  c3                       ret      
