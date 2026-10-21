; PE exception-table range 0x18006ed04..0x18006eef4 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006ed04  48895c2418               mov      qword ptr [rsp + 0x18], rbx
000000018006ed09  4889742420               mov      qword ptr [rsp + 0x20], rsi
000000018006ed0e  55                       push     rbp
000000018006ed0f  57                       push     rdi
000000018006ed10  4155                     push     r13
000000018006ed12  4156                     push     r14
000000018006ed14  4157                     push     r15
000000018006ed16  488dac2430ffffff         lea      rbp, [rsp - 0xd0]
000000018006ed1e  4881ecd0010000           sub      rsp, 0x1d0
000000018006ed25  488b05e4b2a800           mov      rax, qword ptr [rip + 0xa8b2e4] ; 0x180afa010
000000018006ed2c  4833c4                   xor      rax, rsp
000000018006ed2f  488985c8000000           mov      qword ptr [rbp + 0xc8], rax
000000018006ed36  66814d84ffff             or       word ptr [rbp - 0x7c], 0xffff
000000018006ed3c  4533ed                   xor      r13d, r13d
000000018006ed3f  66814d90ffff             or       word ptr [rbp - 0x70], 0xffff
000000018006ed45  458af8                   mov      r15b, r8b
000000018006ed48  4863f2                   movsxd   rsi, edx
000000018006ed4b  4c8bf1                   mov      r14, rcx
000000018006ed4e  486bde4c                 imul     rbx, rsi, 0x4c
000000018006ed52  44896c2438               mov      dword ptr [rsp + 0x38], r13d
000000018006ed57  83cfff                   or       edi, 0xffffffff
000000018006ed5a  44886d94                 mov      byte ptr [rbp - 0x6c], r13b
000000018006ed5e  6644896d4c               mov      word ptr [rbp + 0x4c], r13w
000000018006ed63  0fbf940bfe140000         movsx    edx, word ptr [rbx + rcx + 0x14fe]
000000018006ed6b  e8f0e1ffff               call     0x18006cf60
000000018006ed70  4533c9                   xor      r9d, r9d
000000018006ed73  448b4008                 mov      r8d, dword ptr [rax + 8]
000000018006ed77  420fb684332a150000       movzx    eax, byte ptr [rbx + r14 + 0x152a]
000000018006ed80  488d1d99b1dc04           lea      rbx, [rip + 0x4dcb199] ; 0x184e39f20
000000018006ed87  488d0c40                 lea      rcx, [rax + rax*2]
000000018006ed8b  498d1448                 lea      rdx, [r8 + rcx*2]
000000018006ed8f  49c1e81c                 shr      r8, 0x1c
000000018006ed93  488d4c2420               lea      rcx, [rsp + 0x20]
000000018006ed98  4a8b04c3                 mov      rax, qword ptr [rbx + r8*8]
000000018006ed9c  440bc7                   or       r8d, edi
000000018006ed9f  8b549010                 mov      edx, dword ptr [rax + rdx*4 + 0x10]
000000018006eda3  e87cde4200               call     0x18049cc24
000000018006eda8  397c2420                 cmp      dword ptr [rsp + 0x20], edi
000000018006edac  0f8415010000             je       0x18006eec7
000000018006edb2  4c8d442420               lea      r8, [rsp + 0x20]
000000018006edb7  8bd6                     mov      edx, esi
000000018006edb9  498bce                   mov      rcx, r14
000000018006edbc  e8df010000               call     0x18006efa0
000000018006edc1  488d542454               lea      rdx, [rsp + 0x54]
000000018006edc6  488d4c2448               lea      rcx, [rsp + 0x48]
000000018006edcb  e8181f0000               call     0x180070ce8
000000018006edd0  84c0                     test     al, al
000000018006edd2  7530                     jne      0x18006ee04
000000018006edd4  f20f1005980c9200         movsd    xmm0, qword ptr [rip + 0x920c98] ; 0x18098fa74
000000018006eddc  8b059a0c9200             mov      eax, dword ptr [rip + 0x920c9a] ; 0x18098fa7c
000000018006ede2  f20f11442448             movsd    qword ptr [rsp + 0x48], xmm0
000000018006ede8  f20f10059c0c9200         movsd    xmm0, qword ptr [rip + 0x920c9c] ; 0x18098fa8c
000000018006edf0  89442450                 mov      dword ptr [rsp + 0x50], eax
000000018006edf4  8b059a0c9200             mov      eax, dword ptr [rip + 0x920c9a] ; 0x18098fa94
000000018006edfa  f20f11442454             movsd    qword ptr [rsp + 0x54], xmm0
000000018006ee00  8944245c                 mov      dword ptr [rsp + 0x5c], eax
000000018006ee04  488d4c2420               lea      rcx, [rsp + 0x20]
000000018006ee09  e8a6da4200               call     0x18049c8b4
000000018006ee0e  84c0                     test     al, al
000000018006ee10  0f84b1000000             je       0x18006eec7
000000018006ee16  8b4c2420                 mov      ecx, dword ptr [rsp + 0x20]
000000018006ee1a  e8b1d94200               call     0x18049c7d0
000000018006ee1f  89442420                 mov      dword ptr [rsp + 0x20], eax
000000018006ee23  83f8ff                   cmp      eax, -1
000000018006ee26  0f849b000000             je       0x18006eec7
000000018006ee2c  0fb7c8                   movzx    ecx, ax
000000018006ee2f  488b05cab7ba00           mov      rax, qword ptr [rip + 0xbab7ca] ; 0x180c1a600
000000018006ee36  8b54c804                 mov      edx, dword ptr [rax + rcx*8 + 4]
000000018006ee3a  8bc2                     mov      eax, edx
000000018006ee3c  48c1e81c                 shr      rax, 0x1c
000000018006ee40  488b04c3                 mov      rax, qword ptr [rbx + rax*8]
000000018006ee44  837c9070ff               cmp      dword ptr [rax + rdx*4 + 0x70], -1
000000018006ee49  747c                     je       0x18006eec7
000000018006ee4b  4584ff                   test     r15b, r15b
000000018006ee4e  7408                     je       0x18006ee58
000000018006ee50  0fba6c243809             bts      dword ptr [rsp + 0x38], 9
000000018006ee56  eb06                     jmp      0x18006ee5e
000000018006ee58  0fba74243809             btr      dword ptr [rsp + 0x38], 9
000000018006ee5e  488d4c2420               lea      rcx, [rsp + 0x20]
000000018006ee63  e878e83f00               call     0x18046d6e0
000000018006ee68  8bf8                     mov      edi, eax
000000018006ee6a  83f8ff                   cmp      eax, -1
000000018006ee6d  7458                     je       0x18006eec7
000000018006ee6f  448b05a28cba00           mov      r8d, dword ptr [rip + 0xba8ca2] ; 0x180c17b18
000000018006ee76  498bce                   mov      rcx, r14
000000018006ee79  65488b142558000000       mov      rdx, qword ptr gs:[0x58]
000000018006ee82  41b910000000             mov      r9d, 0x10
000000018006ee88  4a8b14c2                 mov      rdx, qword ptr [rdx + r8*8]
000000018006ee8c  440fb7c7                 movzx    r8d, di
000000018006ee90  4e8b0c0a                 mov      r9, qword ptr [rdx + r9]
000000018006ee94  4f8d0440                 lea      r8, [r8 + r8*2]
000000018006ee98  498b5150                 mov      rdx, qword ptr [r9 + 0x50]
000000018006ee9c  4e8b44c210               mov      r8, qword ptr [rdx + r8*8 + 0x10]
000000018006eea1  8bd7                     mov      edx, edi
000000018006eea3  664189701c               mov      word ptr [r8 + 0x1c], si
000000018006eea8  e893030000               call     0x18006f240
000000018006eead  8bcf                     mov      ecx, edi
000000018006eeaf  e81cca1000               call     0x18017b8d0
000000018006eeb4  8bcf                     mov      ecx, edi
000000018006eeb6  e8a1753300               call     0x1803a645c
000000018006eebb  ba07000000               mov      edx, 7
000000018006eec0  8bce                     mov      ecx, esi
000000018006eec2  e88d713300               call     0x1803a6054
000000018006eec7  8bc7                     mov      eax, edi
000000018006eec9  488b8dc8000000           mov      rcx, qword ptr [rbp + 0xc8]
000000018006eed0  4833cc                   xor      rcx, rsp
000000018006eed3  e8288f7100               call     0x180787e00
000000018006eed8  4c8d9c24d0010000         lea      r11, [rsp + 0x1d0]
000000018006eee0  498b5b40                 mov      rbx, qword ptr [r11 + 0x40]
000000018006eee4  498b7348                 mov      rsi, qword ptr [r11 + 0x48]
000000018006eee8  498be3                   mov      rsp, r11
000000018006eeeb  415f                     pop      r15
000000018006eeed  415e                     pop      r14
000000018006eeef  415d                     pop      r13
000000018006eef1  5f                       pop      rdi
000000018006eef2  5d                       pop      rbp
000000018006eef3  c3                       ret      
