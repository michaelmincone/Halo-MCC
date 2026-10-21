; PE exception-table range 0x18006e6c8..0x18006e740 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006e6c8  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018006e6cd  4889742410               mov      qword ptr [rsp + 0x10], rsi
000000018006e6d2  57                       push     rdi
000000018006e6d3  4883ec20                 sub      rsp, 0x20
000000018006e6d7  4863c2                   movsxd   rax, edx
000000018006e6da  4183c9ff                 or       r9d, 0xffffffff
000000018006e6de  486bf04c                 imul     rsi, rax, 0x4c
000000018006e6e2  498bd8                   mov      rbx, r8
000000018006e6e5  488bf9                   mov      rdi, rcx
000000018006e6e8  0fbf940efe140000         movsx    edx, word ptr [rsi + rcx + 0x14fe]
000000018006e6f0  413bd1                   cmp      edx, r9d
000000018006e6f3  7438                     je       0x18006e72d
000000018006e6f5  e866e8ffff               call     0x18006cf60
000000018006e6fa  8b5008                   mov      edx, dword ptr [rax + 8]
000000018006e6fd  0fb6843e2a150000         movzx    eax, byte ptr [rsi + rdi + 0x152a]
000000018006e705  488d0c40                 lea      rcx, [rax + rax*2]
000000018006e709  4c8d044a                 lea      r8, [rdx + rcx*2]
000000018006e70d  48c1ea1c                 shr      rdx, 0x1c
000000018006e711  488d0d08b8dc04           lea      rcx, [rip + 0x4dcb808] ; 0x184e39f20
000000018006e718  488b0cd1                 mov      rcx, qword ptr [rcx + rdx*8]
000000018006e71c  4885db                   test     rbx, rbx
000000018006e71f  7407                     je       0x18006e728
000000018006e721  428b448114               mov      eax, dword ptr [rcx + r8*4 + 0x14]
000000018006e726  8903                     mov      dword ptr [rbx], eax
000000018006e728  468b4c8110               mov      r9d, dword ptr [rcx + r8*4 + 0x10]
000000018006e72d  488b5c2430               mov      rbx, qword ptr [rsp + 0x30]
000000018006e732  418bc1                   mov      eax, r9d
000000018006e735  488b742438               mov      rsi, qword ptr [rsp + 0x38]
000000018006e73a  4883c420                 add      rsp, 0x20
000000018006e73e  5f                       pop      rdi
000000018006e73f  c3                       ret      
