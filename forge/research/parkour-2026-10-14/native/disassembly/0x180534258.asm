; PE exception-table range 0x180534258..0x1805342b5 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
0000000180534258  4883ec28                 sub      rsp, 0x28
000000018053425c  8b15b6386e00             mov      edx, dword ptr [rip + 0x6e38b6] ; 0x180c17b18
0000000180534262  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018053426b  41ba10000000             mov      r10d, 0x10
0000000180534271  488b04d0                 mov      rax, qword ptr [rax + rdx*8]
0000000180534275  0fb7d1                   movzx    edx, cx
0000000180534278  4e8b1410                 mov      r10, qword ptr [rax + r10]
000000018053427c  4c8d0c52                 lea      r9, [rdx + rdx*2]
0000000180534280  32d2                     xor      dl, dl
0000000180534282  498b4250                 mov      rax, qword ptr [r10 + 0x50]
0000000180534286  4e8b54c810               mov      r10, qword ptr [rax + r9*8 + 0x10]
000000018053428b  4183f801                 cmp      r8d, 1
000000018053428f  751d                     jne      0x1805342ae
0000000180534291  41837a14ff               cmp      dword ptr [r10 + 0x14], -1
0000000180534296  7516                     jne      0x1805342ae
0000000180534298  490fbf82b2010000         movsx    rax, word ptr [r10 + 0x1b2]
00000001805342a0  423854101c               cmp      byte ptr [rax + r10 + 0x1c], dl
00000001805342a5  7407                     je       0x1805342ae
00000001805342a7  e8884dfbff               call     0x1804e9034
00000001805342ac  b201                     mov      dl, 1
00000001805342ae  8ac2                     mov      al, dl
00000001805342b0  4883c428                 add      rsp, 0x28
00000001805342b4  c3                       ret      
