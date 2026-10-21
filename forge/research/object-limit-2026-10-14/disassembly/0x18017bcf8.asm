; PE exception-table range 0x18017bcf8..0x18017bf31 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017bcf8  488bc4                   mov      rax, rsp
000000018017bcfb  48895810                 mov      qword ptr [rax + 0x10], rbx
000000018017bcff  48897018                 mov      qword ptr [rax + 0x18], rsi
000000018017bd03  48897820                 mov      qword ptr [rax + 0x20], rdi
000000018017bd07  55                       push     rbp
000000018017bd08  4154                     push     r12
000000018017bd0a  4155                     push     r13
000000018017bd0c  4156                     push     r14
000000018017bd0e  4157                     push     r15
000000018017bd10  488d68a1                 lea      rbp, [rax - 0x5f]
000000018017bd14  4881ecb0000000           sub      rsp, 0xb0
000000018017bd1b  488b05eee29700           mov      rax, qword ptr [rip + 0x97e2ee] ; 0x180afa010
000000018017bd22  4833c4                   xor      rax, rsp
000000018017bd25  48894527                 mov      qword ptr [rbp + 0x27], rax
000000018017bd29  4c8bf1                   mov      r14, rcx
000000018017bd2c  4533e4                   xor      r12d, r12d
000000018017bd2f  e8b8ffeeff               call     0x18006bcec
000000018017bd34  418b5604                 mov      edx, dword ptr [r14 + 4]
000000018017bd38  4533c0                   xor      r8d, r8d
000000018017bd3b  488bc8                   mov      rcx, rax
000000018017bd3e  e88529efff               call     0x18006e6c8
000000018017bd43  83f8ff                   cmp      eax, -1
000000018017bd46  0f84b5010000             je       0x18017bf01
000000018017bd4c  8b35c6bda900             mov      esi, dword ptr [rip + 0xa9bdc6] ; 0x180c17b18
000000018017bd52  488d3dc7e1cb04           lea      rdi, [rip + 0x4cbe1c7] ; 0x184e39f20
000000018017bd59  0fb7c8                   movzx    ecx, ax
000000018017bd5c  458d7c2401               lea      r15d, [r12 + 1]
000000018017bd61  488b0598e8a900           mov      rax, qword ptr [rip + 0xa9e898] ; 0x180c1a600
000000018017bd68  41bd10000000             mov      r13d, 0x10
000000018017bd6e  8b5cc804                 mov      ebx, dword ptr [rax + rcx*8 + 4]
000000018017bd72  8bc3                     mov      eax, ebx
000000018017bd74  48c1e81c                 shr      rax, 0x1c
000000018017bd78  488b3cc7                 mov      rdi, qword ptr [rdi + rax*8]
000000018017bd7c  6644393c9f               cmp      word ptr [rdi + rbx*4], r15w
000000018017bd81  0f85cc000000             jne      0x18017be53
000000018017bd87  e860ffeeff               call     0x18006bcec
000000018017bd8c  418b5604                 mov      edx, dword ptr [r14 + 4]
000000018017bd90  4c8d45cf                 lea      r8, [rbp - 0x31]
000000018017bd94  488bc8                   mov      rcx, rax
000000018017bd97  4c89642420               mov      qword ptr [rsp + 0x20], r12
000000018017bd9c  4533c9                   xor      r9d, r9d
000000018017bd9f  e8c024efff               call     0x18006e264
000000018017bda4  f30f1045cf               movss    xmm0, dword ptr [rbp - 0x31]
000000018017bda9  488d55cf                 lea      rdx, [rbp - 0x31]
000000018017bdad  f30f58449f10             addss    xmm0, dword ptr [rdi + rbx*4 + 0x10]
000000018017bdb3  f30f104dd3               movss    xmm1, dword ptr [rbp - 0x2d]
000000018017bdb8  488d4dc7                 lea      rcx, [rbp - 0x39]
000000018017bdbc  f30f584c9f14             addss    xmm1, dword ptr [rdi + rbx*4 + 0x14]
000000018017bdc2  f30f1145cf               movss    dword ptr [rbp - 0x31], xmm0
000000018017bdc7  f30f1045d7               movss    xmm0, dword ptr [rbp - 0x29]
000000018017bdcc  f30f58449f18             addss    xmm0, dword ptr [rdi + rbx*4 + 0x18]
000000018017bdd2  f30f114dd3               movss    dword ptr [rbp - 0x2d], xmm1
000000018017bdd7  f30f1145d7               movss    dword ptr [rbp - 0x29], xmm0
000000018017bddc  e8e787e9ff               call     0x1800145c8
000000018017bde1  f30f10449f0c             movss    xmm0, dword ptr [rdi + rbx*4 + 0xc]
000000018017bde7  488d45e7                 lea      rax, [rbp - 0x19]
000000018017bdeb  c744243010000000         mov      dword ptr [rsp + 0x30], 0x10
000000018017bdf3  4c8d4dcf                 lea      r9, [rbp - 0x31]
000000018017bdf7  4889442428               mov      qword ptr [rsp + 0x28], rax
000000018017bdfc  4c8d45c7                 lea      r8, [rbp - 0x39]
000000018017be00  418bd7                   mov      edx, r15d
000000018017be03  f30f11442420             movss    dword ptr [rsp + 0x20], xmm0
000000018017be09  418bcf                   mov      ecx, r15d
000000018017be0c  e8bf802f00               call     0x180473ed0
000000018017be11  4c63c0                   movsxd   r8, eax
000000018017be14  85c0                     test     eax, eax
000000018017be16  7e3b                     jle      0x18017be53
000000018017be18  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018017be21  418bd4                   mov      edx, r12d
000000018017be24  488b04f0                 mov      rax, qword ptr [rax + rsi*8]
000000018017be28  4a8b0c28                 mov      rcx, qword ptr [rax + r13]
000000018017be2c  4c8b4950                 mov      r9, qword ptr [rcx + 0x50]
000000018017be30  0fb74495e7               movzx    eax, word ptr [rbp + rdx*4 - 0x19]
000000018017be35  488d0c40                 lea      rcx, [rax + rax*2]
000000018017be39  498b44c910               mov      rax, qword ptr [r9 + rcx*8 + 0x10]
000000018017be3e  83b820030000ff           cmp      dword ptr [rax + 0x320], -1
000000018017be45  0f84ac000000             je       0x18017bef7
000000018017be4b  4903d7                   add      rdx, r15
000000018017be4e  493bd0                   cmp      rdx, r8
000000018017be51  7cdd                     jl       0x18017be30
000000018017be53  e894feeeff               call     0x18006bcec
000000018017be58  418b5604                 mov      edx, dword ptr [r14 + 4]
000000018017be5c  458ac7                   mov      r8b, r15b
000000018017be5f  488bc8                   mov      rcx, rax
000000018017be62  e89d2eefff               call     0x18006ed04
000000018017be67  448bf8                   mov      r15d, eax
000000018017be6a  83f8ff                   cmp      eax, -1
000000018017be6d  0f8484000000             je       0x18017bef7
000000018017be73  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018017be7c  488bce                   mov      rcx, rsi
000000018017be7f  418bf5                   mov      esi, r13d
000000018017be82  33d2                     xor      edx, edx
000000018017be84  488b3cc8                 mov      rdi, qword ptr [rax + rcx*8]
000000018017be88  410fb7cf                 movzx    ecx, r15w
000000018017be8c  4a8b042f                 mov      rax, qword ptr [rdi + r13]
000000018017be90  488d1c49                 lea      rbx, [rcx + rcx*2]
000000018017be94  488b4850                 mov      rcx, qword ptr [rax + 0x50]
000000018017be98  4c8b6cd910               mov      r13, qword ptr [rcx + rbx*8 + 0x10]
000000018017be9d  418bcf                   mov      ecx, r15d
000000018017bea0  e853572f00               call     0x1804715f8
000000018017bea5  488b0437                 mov      rax, qword ptr [rdi + rsi]
000000018017bea9  488b4850                 mov      rcx, qword ptr [rax + 0x50]
000000018017bead  807cd90402               cmp      byte ptr [rcx + rbx*8 + 4], 2
000000018017beb2  7508                     jne      0x18017bebc
000000018017beb4  418bcf                   mov      ecx, r15d
000000018017beb7  e8801a3700               call     0x1804ed93c
000000018017bebc  490fbf8592010000         movsx    rax, word ptr [r13 + 0x192]
000000018017bec4  41c60601                 mov      byte ptr [r14], 1
000000018017bec8  420fbe4c281e             movsx    ecx, byte ptr [rax + r13 + 0x1e]
000000018017bece  85c9                     test     ecx, ecx
000000018017bed0  740b                     je       0x18017bedd
000000018017bed2  83f901                   cmp      ecx, 1
000000018017bed5  750a                     jne      0x18017bee1
000000018017bed7  41800e04                 or       byte ptr [r14], 4
000000018017bedb  eb04                     jmp      0x18017bee1
000000018017bedd  41800e08                 or       byte ptr [r14], 8
000000018017bee1  45897e08                 mov      dword ptr [r14 + 8], r15d
000000018017bee5  41b401                   mov      r12b, 1
000000018017bee8  41808d0001000002         or       byte ptr [r13 + 0x100], 2
000000018017bef0  b8ff7f0000               mov      eax, 0x7fff
000000018017bef5  eb05                     jmp      0x18017befc
000000018017bef7  b80a000000               mov      eax, 0xa
000000018017befc  664189460c               mov      word ptr [r14 + 0xc], ax
000000018017bf01  418ac4                   mov      al, r12b
000000018017bf04  488b4d27                 mov      rcx, qword ptr [rbp + 0x27]
000000018017bf08  4833cc                   xor      rcx, rsp
000000018017bf0b  e8f0be6000               call     0x180787e00
000000018017bf10  4c8d9c24b0000000         lea      r11, [rsp + 0xb0]
000000018017bf18  498b5b38                 mov      rbx, qword ptr [r11 + 0x38]
000000018017bf1c  498b7340                 mov      rsi, qword ptr [r11 + 0x40]
000000018017bf20  498b7b48                 mov      rdi, qword ptr [r11 + 0x48]
000000018017bf24  498be3                   mov      rsp, r11
000000018017bf27  415f                     pop      r15
000000018017bf29  415e                     pop      r14
000000018017bf2b  415d                     pop      r13
000000018017bf2d  415c                     pop      r12
000000018017bf2f  5d                       pop      rbp
000000018017bf30  c3                       ret      
