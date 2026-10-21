; PE exception-table range 0x18053447c..0x1805344e9 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018053447c  4053                     push     rbx
000000018053447e  4883ec20                 sub      rsp, 0x20
0000000180534482  8bd9                     mov      ebx, ecx
0000000180534484  e88b440000               call     0x180538914
0000000180534489  448b0588366e00           mov      r8d, dword ptr [rip + 0x6e3688] ; 0x180c17b18
0000000180534490  65488b142558000000       mov      rdx, qword ptr gs:[0x58]
0000000180534499  41ba10000000             mov      r10d, 0x10
000000018053449f  4a8b14c2                 mov      rdx, qword ptr [rdx + r8*8]
00000001805344a3  440fb7c3                 movzx    r8d, bx
00000001805344a7  4e8b1412                 mov      r10, qword ptr [rdx + r10]
00000001805344ab  4f8d0c40                 lea      r9, [r8 + r8*2]
00000001805344af  498b5250                 mov      rdx, qword ptr [r10 + 0x50]
00000001805344b3  4e8b44ca10               mov      r8, qword ptr [rdx + r9*8 + 0x10]
00000001805344b8  84c0                     test     al, al
00000001805344ba  741a                     je       0x1805344d6
00000001805344bc  490fbf88b2010000         movsx    rcx, word ptr [r8 + 0x1b2]
00000001805344c4  8bd3                     mov      edx, ebx
00000001805344c6  4903c8                   add      rcx, r8
00000001805344c9  41b801000000             mov      r8d, 1
00000001805344cf  e83ccafdff               call     0x180510f10
00000001805344d4  eb0b                     jmp      0x1805344e1
00000001805344d6  41c780b40d00000000803f   mov      dword ptr [r8 + 0xdb4], 0x3f800000
00000001805344e1  b001                     mov      al, 1
00000001805344e3  4883c420                 add      rsp, 0x20
00000001805344e7  5b                       pop      rbx
00000001805344e8  c3                       ret      
