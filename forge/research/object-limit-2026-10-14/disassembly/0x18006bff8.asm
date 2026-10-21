; PE exception-table range 0x18006bff8..0x18006c080 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006bff8  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018006bffd  48896c2410               mov      qword ptr [rsp + 0x10], rbp
000000018006c002  4889742418               mov      qword ptr [rsp + 0x18], rsi
000000018006c007  57                       push     rdi
000000018006c008  4883ec20                 sub      rsp, 0x20
000000018006c00c  33ed                     xor      ebp, ebp
000000018006c00e  488db9fc140000           lea      rdi, [rcx + 0x14fc]
000000018006c015  33c0                     xor      eax, eax
000000018006c017  4889a9b8020000           mov      qword ptr [rcx + 0x2b8], rbp
000000018006c01e  488981c0020000           mov      qword ptr [rcx + 0x2c0], rax
000000018006c025  488bd9                   mov      rbx, rcx
000000018006c028  be8b020000               mov      esi, 0x28b
000000018006c02d  488bcf                   mov      rcx, rdi
000000018006c030  e8ebfaffff               call     0x18006bb20
000000018006c035  4883c74c                 add      rdi, 0x4c
000000018006c039  4883ee01                 sub      rsi, 1
000000018006c03d  75ee                     jne      0x18006c02d
000000018006c03f  488dbb40d60000           lea      rdi, [rbx + 0xd640]
000000018006c046  be00010000               mov      esi, 0x100
000000018006c04b  488bcf                   mov      rcx, rdi
000000018006c04e  e811fbffff               call     0x18006bb64
000000018006c053  4883c703                 add      rdi, 3
000000018006c057  4883ee01                 sub      rsi, 1
000000018006c05b  75ee                     jne      0x18006c04b
000000018006c05d  83caff                   or       edx, 0xffffffff
000000018006c060  488bcb                   mov      rcx, rbx
000000018006c063  e818000000               call     0x18006c080
000000018006c068  488b6c2438               mov      rbp, qword ptr [rsp + 0x38]
000000018006c06d  488bc3                   mov      rax, rbx
000000018006c070  488b5c2430               mov      rbx, qword ptr [rsp + 0x30]
000000018006c075  488b742440               mov      rsi, qword ptr [rsp + 0x40]
000000018006c07a  4883c420                 add      rsp, 0x20
000000018006c07e  5f                       pop      rdi
000000018006c07f  c3                       ret      
