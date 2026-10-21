; PE exception-table range 0x18006f070..0x18006f23d (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006f070  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018006f075  57                       push     rdi
000000018006f076  4883ec20                 sub      rsp, 0x20
000000018006f07a  4c8bc9                   mov      r9, rcx
000000018006f07d  4863c2                   movsxd   rax, edx
000000018006f080  4c6bd04c                 imul     r10, rax, 0x4c
000000018006f084  4d8d984b010000           lea      r11, [r8 + 0x14b]
000000018006f08b  4983e3fc                 and      r11, 0xfffffffffffffffc
000000018006f08f  490fbf9c0afe140000       movsx    rbx, word ptr [r10 + rcx + 0x14fe]
000000018006f098  410fbf840a40150000       movsx    eax, word ptr [r10 + rcx + 0x1540]
000000018006f0a1  418980a0010000           mov      dword ptr [r8 + 0x1a0], eax
000000018006f0a8  418a840a42150000         mov      al, byte ptr [r10 + rcx + 0x1542]
000000018006f0b0  488d3c59                 lea      rdi, [rcx + rbx*2]
000000018006f0b4  8ac8                     mov      cl, al
000000018006f0b6  c0e902                   shr      cl, 2
000000018006f0b9  c0e803                   shr      al, 3
000000018006f0bc  80e101                   and      cl, 1
000000018006f0bf  2401                     and      al, 1
000000018006f0c1  3ac8                     cmp      cl, al
000000018006f0c3  740a                     je       0x18006f0cf
000000018006f0c5  0fb6c1                   movzx    eax, cl
000000018006f0c8  83f001                   xor      eax, 1
000000018006f0cb  ffc0                     inc      eax
000000018006f0cd  eb02                     jmp      0x18006f0d1
000000018006f0cf  33c0                     xor      eax, eax
000000018006f0d1  41894320                 mov      dword ptr [r11 + 0x20], eax
000000018006f0d5  4380bc0a46150000ff       cmp      byte ptr [r10 + r9 + 0x1546], 0xff
000000018006f0de  7427                     je       0x18006f107
000000018006f0e0  4180487401               or       byte ptr [r8 + 0x74], 1
000000018006f0e5  430fbe8c0a46150000       movsx    ecx, byte ptr [r10 + r9 + 0x1546]
000000018006f0ee  e8bdceffff               call     0x18006bfb0
000000018006f0f3  f20f1000                 movsd    xmm0, qword ptr [rax]
000000018006f0f7  f2410f114078             movsd    qword ptr [r8 + 0x78], xmm0
000000018006f0fd  8b4008                   mov      eax, dword ptr [rax + 8]
000000018006f100  41898080000000           mov      dword ptr [r8 + 0x80], eax
000000018006f107  438a840a43150000         mov      al, byte ptr [r10 + r9 + 0x1543]
000000018006f10f  41884325                 mov      byte ptr [r11 + 0x25], al
000000018006f113  438a840a3d150000         mov      al, byte ptr [r10 + r9 + 0x153d]
000000018006f11b  41884328                 mov      byte ptr [r11 + 0x28], al
000000018006f11f  8a843b40d60000           mov      al, byte ptr [rbx + rdi + 0xd640]
000000018006f126  41884329                 mov      byte ptr [r11 + 0x29], al
000000018006f12a  8a843b41d60000           mov      al, byte ptr [rbx + rdi + 0xd641]
000000018006f131  4188432a                 mov      byte ptr [r11 + 0x2a], al
000000018006f135  418a4b2b                 mov      cl, byte ptr [r11 + 0x2b]
000000018006f139  438a940a42150000         mov      dl, byte ptr [r10 + r9 + 0x1542]
000000018006f141  8ac1                     mov      al, cl
000000018006f143  24fe                     and      al, 0xfe
000000018006f145  80c901                   or       cl, 1
000000018006f148  0fb6c0                   movzx    eax, al
000000018006f14b  80e201                   and      dl, 1
000000018006f14e  440fb6c1                 movzx    r8d, cl
000000018006f152  440f44c0                 cmove    r8d, eax
000000018006f156  4588432b                 mov      byte ptr [r11 + 0x2b], r8b
000000018006f15a  418ac0                   mov      al, r8b
000000018006f15d  438a8c0a42150000         mov      cl, byte ptr [r10 + r9 + 0x1542]
000000018006f165  24fd                     and      al, 0xfd
000000018006f167  0fb6c0                   movzx    eax, al
000000018006f16a  4180c802                 or       r8b, 2
000000018006f16e  80e102                   and      cl, 2
000000018006f171  410fb6d0                 movzx    edx, r8b
000000018006f175  0f44d0                   cmove    edx, eax
000000018006f178  4188532b                 mov      byte ptr [r11 + 0x2b], dl
000000018006f17c  8ac2                     mov      al, dl
000000018006f17e  438a8c0a42150000         mov      cl, byte ptr [r10 + r9 + 0x1542]
000000018006f186  24fb                     and      al, 0xfb
000000018006f188  0fb6c0                   movzx    eax, al
000000018006f18b  80ca04                   or       dl, 4
000000018006f18e  80e120                   and      cl, 0x20
000000018006f191  440fb6c2                 movzx    r8d, dl
000000018006f195  440f44c0                 cmove    r8d, eax
000000018006f199  4588432b                 mov      byte ptr [r11 + 0x2b], r8b
000000018006f19d  418ac0                   mov      al, r8b
000000018006f1a0  438a940a42150000         mov      dl, byte ptr [r10 + r9 + 0x1542]
000000018006f1a8  24f7                     and      al, 0xf7
000000018006f1aa  0fb6c0                   movzx    eax, al
000000018006f1ad  4180c808                 or       r8b, 8
000000018006f1b1  80e210                   and      dl, 0x10
000000018006f1b4  410fb6c8                 movzx    ecx, r8b
000000018006f1b8  0f44c8                   cmove    ecx, eax
000000018006f1bb  41884b2b                 mov      byte ptr [r11 + 0x2b], cl
000000018006f1bf  430fb6840a3e150000       movzx    eax, byte ptr [r10 + r9 + 0x153e]
000000018006f1c8  664189432c               mov      word ptr [r11 + 0x2c], ax
000000018006f1cd  430f10840a2c150000       movups   xmm0, xmmword ptr [r10 + r9 + 0x152c]
000000018006f1d6  410f114330               movups   xmmword ptr [r11 + 0x30], xmm0
000000018006f1db  438a840a3c150000         mov      al, byte ptr [r10 + r9 + 0x153c]
000000018006f1e3  4183634400               and      dword ptr [r11 + 0x44], 0
000000018006f1e8  41884340                 mov      byte ptr [r11 + 0x40], al
000000018006f1ec  664183634200             and      word ptr [r11 + 0x42], 0
000000018006f1f2  438a840a3f150000         mov      al, byte ptr [r10 + r9 + 0x153f]
000000018006f1fa  3c0c                     cmp      al, 0xc
000000018006f1fc  7c34                     jl       0x18006f232
000000018006f1fe  3c0e                     cmp      al, 0xe
000000018006f200  7e18                     jle      0x18006f21a
000000018006f202  3c13                     cmp      al, 0x13
000000018006f204  752c                     jne      0x18006f232
000000018006f206  430fb68c0a44150000       movzx    ecx, byte ptr [r10 + r9 + 0x1544]
000000018006f20f  e890380b00               call     0x180122aa4
000000018006f214  41894344                 mov      dword ptr [r11 + 0x44], eax
000000018006f218  eb18                     jmp      0x18006f232
000000018006f21a  438a840a44150000         mov      al, byte ptr [r10 + r9 + 0x1544]
000000018006f222  41884342                 mov      byte ptr [r11 + 0x42], al
000000018006f226  438a840a45150000         mov      al, byte ptr [r10 + r9 + 0x1545]
000000018006f22e  41884343                 mov      byte ptr [r11 + 0x43], al
000000018006f232  488b5c2430               mov      rbx, qword ptr [rsp + 0x30]
000000018006f237  4883c420                 add      rsp, 0x20
000000018006f23b  5f                       pop      rdi
000000018006f23c  c3                       ret      
