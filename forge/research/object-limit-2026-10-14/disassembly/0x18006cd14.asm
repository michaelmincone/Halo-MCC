; PE exception-table range 0x18006cd14..0x18006ce90 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006cd14  488bc4                   mov      rax, rsp
000000018006cd17  57                       push     rdi
000000018006cd18  4154                     push     r12
000000018006cd1a  4155                     push     r13
000000018006cd1c  4156                     push     r14
000000018006cd1e  4157                     push     r15
000000018006cd20  4883ec30                 sub      rsp, 0x30
000000018006cd24  48c740c8feffffff         mov      qword ptr [rax - 0x38], 0xfffffffffffffffe
000000018006cd2c  48895810                 mov      qword ptr [rax + 0x10], rbx
000000018006cd30  48896818                 mov      qword ptr [rax + 0x18], rbp
000000018006cd34  48897020                 mov      qword ptr [rax + 0x20], rsi
000000018006cd38  4c8be9                   mov      r13, rcx
000000018006cd3b  488b1d7e2fdc04           mov      rbx, qword ptr [rip + 0x4dc2f7e] ; 0x184e2fcc0
000000018006cd42  48895808                 mov      qword ptr [rax + 8], rbx
000000018006cd46  48890d732fdc04           mov      qword ptr [rip + 0x4dc2f73], rcx ; 0x184e2fcc0
000000018006cd4d  4c8b25dcd4ba00           mov      r12, qword ptr [rip + 0xbad4dc] ; 0x180c1a230
000000018006cd54  418b542410               mov      edx, dword ptr [r12 + 0x10]
000000018006cd59  e822f3ffff               call     0x18006c080
000000018006cd5e  be48000000               mov      esi, 0x48
000000018006cd63  8b15afadba00             mov      edx, dword ptr [rip + 0xbaadaf] ; 0x180c17b18
000000018006cd69  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018006cd72  488b14d0                 mov      rdx, qword ptr [rax + rdx*8]
000000018006cd76  488b3416                 mov      rsi, qword ptr [rsi + rdx]
000000018006cd7a  0f10463c                 movups   xmm0, xmmword ptr [rsi + 0x3c]
000000018006cd7e  f3410f7f85b8020000       movdqu   xmmword ptr [r13 + 0x2b8], xmm0
000000018006cd87  488b15a20c5502           mov      rdx, qword ptr [rip + 0x2550ca2] ; 0x1825bda30
000000018006cd8e  4881c2a8030000           add      rdx, 0x3a8
000000018006cd95  41b814000000             mov      r8d, 0x14
000000018006cd9b  83c9ff                   or       ecx, 0xffffffff
000000018006cd9e  e849270300               call     0x18009f4ec
000000018006cda3  418985ec020000           mov      dword ptr [r13 + 0x2ec], eax
000000018006cdaa  e891470000               call     0x180071540
000000018006cdaf  3401                     xor      al, 1
000000018006cdb1  418885e9020000           mov      byte ptr [r13 + 0x2e9], al
000000018006cdb8  0f2805d11db900           movaps   xmm0, xmmword ptr [rip + 0xb91dd1] ; 0x180bfeb90
000000018006cdbf  410f1185c8020000         movups   xmmword ptr [r13 + 0x2c8], xmm0
000000018006cdc7  f20f100dd11db900         movsd    xmm1, qword ptr [rip + 0xb91dd1] ; 0x180bfeba0
000000018006cdcf  f2410f118dd8020000       movsd    qword ptr [r13 + 0x2d8], xmm1
000000018006cdd8  488b3d51d4ba00           mov      rdi, qword ptr [rip + 0xbad451] ; 0x180c1a230
000000018006cddf  488bcf                   mov      rcx, rdi
000000018006cde2  e875efffff               call     0x18006bd5c
000000018006cde7  418985f0020000           mov      dword ptr [r13 + 0x2f0], eax
000000018006cdee  f30f2c4738               cvttss2si eax, dword ptr [rdi + 0x38]
000000018006cdf3  418985e0020000           mov      dword ptr [r13 + 0x2e0], eax
000000018006cdfa  488bcf                   mov      rcx, rdi
000000018006cdfd  e80ef9ffff               call     0x18006c710
000000018006ce02  66418985b2020000         mov      word ptr [r13 + 0x2b2], ax
000000018006ce0a  e831470000               call     0x180071540
000000018006ce0f  84c0                     test     al, al
000000018006ce11  740a                     je       0x18006ce1d
000000018006ce13  807e1104                 cmp      byte ptr [rsi + 0x11], 4
000000018006ce17  410f95c7                 setne    r15b
000000018006ce1b  eb03                     jmp      0x18006ce20
000000018006ce1d  41b701                   mov      r15b, 1
000000018006ce20  33ff                     xor      edi, edi
000000018006ce22  4c8d3517579e00           lea      r14, [rip + 0x9e5717] ; 0x180a52540
000000018006ce29  8bcf                     mov      ecx, edi
000000018006ce2b  b801000000               mov      eax, 1
000000018006ce30  d3e0                     shl      eax, cl
000000018006ce32  a9ce050000               test     eax, 0x5ce
000000018006ce37  7428                     je       0x18006ce61
000000018006ce39  498b06                   mov      rax, qword ptr [r14]
000000018006ce3c  480fbf700e               movsx    rsi, word ptr [rax + 0xe]
000000018006ce41  33ed                     xor      ebp, ebp
000000018006ce43  42392c26                 cmp      dword ptr [rsi + r12], ebp
000000018006ce47  7e18                     jle      0x18006ce61
000000018006ce49  458acf                   mov      r9b, r15b
000000018006ce4c  448bc5                   mov      r8d, ebp
000000018006ce4f  8bd7                     mov      edx, edi
000000018006ce51  498bcd                   mov      rcx, r13
000000018006ce54  e89b0c0000               call     0x18006daf4
000000018006ce59  ffc5                     inc      ebp
000000018006ce5b  423b2c26                 cmp      ebp, dword ptr [rsi + r12]
000000018006ce5f  7ce8                     jl       0x18006ce49
000000018006ce61  ffc7                     inc      edi
000000018006ce63  4983c608                 add      r14, 8
000000018006ce67  83ff0e                   cmp      edi, 0xe
000000018006ce6a  7cbd                     jl       0x18006ce29
000000018006ce6c  48891d4d2edc04           mov      qword ptr [rip + 0x4dc2e4d], rbx ; 0x184e2fcc0
000000018006ce73  488b5c2468               mov      rbx, qword ptr [rsp + 0x68]
000000018006ce78  488b6c2470               mov      rbp, qword ptr [rsp + 0x70]
000000018006ce7d  488b742478               mov      rsi, qword ptr [rsp + 0x78]
000000018006ce82  4883c430                 add      rsp, 0x30
000000018006ce86  415f                     pop      r15
000000018006ce88  415e                     pop      r14
000000018006ce8a  415d                     pop      r13
000000018006ce8c  415c                     pop      r12
000000018006ce8e  5f                       pop      rdi
000000018006ce8f  c3                       ret      
