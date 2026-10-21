; PE exception-table range 0x1805342b8..0x180534335 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
00000001805342b8  48895c2408               mov      qword ptr [rsp + 8], rbx
00000001805342bd  57                       push     rdi
00000001805342be  4883ec20                 sub      rsp, 0x20
00000001805342c2  8bf9                     mov      edi, ecx
00000001805342c4  33db                     xor      ebx, ebx
00000001805342c6  e8e929f9ff               call     0x1804c6cb4
00000001805342cb  8b5004                   mov      edx, dword ptr [rax + 4]
00000001805342ce  8d42df                   lea      eax, [rdx - 0x21]
00000001805342d1  83f801                   cmp      eax, 1
00000001805342d4  7608                     jbe      0x1805342de
00000001805342d6  81fae2020000             cmp      edx, 0x2e2
00000001805342dc  754a                     jne      0x180534328
00000001805342de  8b0d34386e00             mov      ecx, dword ptr [rip + 0x6e3834] ; 0x180c17b18
00000001805342e4  65488b042558000000       mov      rax, qword ptr gs:[0x58]
00000001805342ed  41b810000000             mov      r8d, 0x10
00000001805342f3  488b04c8                 mov      rax, qword ptr [rax + rcx*8]
00000001805342f7  0fb7cf                   movzx    ecx, di
00000001805342fa  4e8b0400                 mov      r8, qword ptr [rax + r8]
00000001805342fe  488d1449                 lea      rdx, [rcx + rcx*2]
0000000180534302  498b4050                 mov      rax, qword ptr [r8 + 0x50]
0000000180534306  488b4cd010               mov      rcx, qword ptr [rax + rdx*8 + 0x10]
000000018053430b  83caff                   or       edx, 0xffffffff
000000018053430e  480fbf81b2010000         movsx    rax, word ptr [rcx + 0x1b2]
0000000180534316  66895c0822               mov      word ptr [rax + rcx + 0x22], bx
000000018053431b  6689540820               mov      word ptr [rax + rcx + 0x20], dx
0000000180534320  8999a00d0000             mov      dword ptr [rcx + 0xda0], ebx
0000000180534326  b301                     mov      bl, 1
0000000180534328  8ac3                     mov      al, bl
000000018053432a  488b5c2430               mov      rbx, qword ptr [rsp + 0x30]
000000018053432f  4883c420                 add      rsp, 0x20
0000000180534333  5f                       pop      rdi
0000000180534334  c3                       ret      
