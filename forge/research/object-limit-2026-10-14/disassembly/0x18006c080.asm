; PE exception-table range 0x18006c080..0x18006c243 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006c080  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018006c085  4889742418               mov      qword ptr [rsp + 0x18], rsi
000000018006c08a  55                       push     rbp
000000018006c08b  57                       push     rdi
000000018006c08c  4154                     push     r12
000000018006c08e  4156                     push     r14
000000018006c090  4157                     push     r15
000000018006c092  488bec                   mov      rbp, rsp
000000018006c095  4881ec80000000           sub      rsp, 0x80
000000018006c09c  448bf2                   mov      r14d, edx
000000018006c09f  488bd9                   mov      rbx, rcx
000000018006c0a2  33d2                     xor      edx, edx
000000018006c0a4  488d4db0                 lea      rcx, [rbp - 0x50]
000000018006c0a8  448d424c                 lea      r8d, [rdx + 0x4c]
000000018006c0ac  e879d27100               call     0x18078932a
000000018006c0b1  4533e4                   xor      r12d, r12d
000000018006c0b4  4983cfff                 or       r15, 0xffffffffffffffff
000000018006c0b8  33c0                     xor      eax, eax
000000018006c0ba  4c8965f1                 mov      qword ptr [rbp - 0xf], r12
000000018006c0be  66448965f9               mov      word ptr [rbp - 7], r12w
000000018006c0c3  33d2                     xor      edx, edx
000000018006c0c5  41b8bcd90000             mov      r8d, 0xd9bc
000000018006c0cb  488945e0                 mov      qword ptr [rbp - 0x20], rax
000000018006c0cf  488bcb                   mov      rcx, rbx
000000018006c0d2  488945e8                 mov      qword ptr [rbp - 0x18], rax
000000018006c0d6  448865f3                 mov      byte ptr [rbp - 0xd], r12b
000000018006c0da  44887dfa                 mov      byte ptr [rbp - 6], r15b
000000018006c0de  6644897df4               mov      word ptr [rbp - 0xc], r15w
000000018006c0e3  c645f708                 mov      byte ptr [rbp - 9], 8
000000018006c0e7  6644897db2               mov      word ptr [rbp - 0x4e], r15w
000000018006c0ec  44897db4                 mov      dword ptr [rbp - 0x4c], r15d
000000018006c0f0  6644897ddc               mov      word ptr [rbp - 0x24], r15w
000000018006c0f5  448865fb                 mov      byte ptr [rbp - 5], r12b
000000018006c0f9  448865f0                 mov      byte ptr [rbp - 0x10], r12b
000000018006c0fd  6644896538               mov      word ptr [rbp + 0x38], r12w
000000018006c102  e823d27100               call     0x18078932a
000000018006c107  44883b                   mov      byte ptr [rbx], r15b
000000018006c10a  418d4602                 lea      eax, [r14 + 2]
000000018006c10e  44887b28                 mov      byte ptr [rbx + 0x28], r15b
000000018006c112  44897b2c                 mov      dword ptr [rbx + 0x2c], r15d
000000018006c116  44887b30                 mov      byte ptr [rbx + 0x30], r15b
000000018006c11a  4489b3b4020000           mov      dword ptr [rbx + 0x2b4], r14d
000000018006c121  c683e902000001           mov      byte ptr [rbx + 0x2e9], 1
000000018006c128  83f801                   cmp      eax, 1
000000018006c12b  7709                     ja       0x18006c136
000000018006c12d  0f1005dc9a9100           movups   xmm0, xmmword ptr [rip + 0x919adc] ; 0x180985c10
000000018006c134  eb0f                     jmp      0x18006c145
000000018006c136  418bd6                   mov      edx, r14d
000000018006c139  488d4da0                 lea      rcx, [rbp - 0x60]
000000018006c13d  e8ba04fdff               call     0x18003c5fc
000000018006c142  0f1000                   movups   xmm0, xmmword ptr [rax]
000000018006c145  0f284dc0                 movaps   xmm1, xmmword ptr [rbp - 0x40]
000000018006c149  488db3fc140000           lea      rsi, [rbx + 0x14fc]
000000018006c150  488dbb40d90000           lea      rdi, [rbx + 0xd940]
000000018006c157  498bc7                   mov      rax, r15
000000018006c15a  b91f000000               mov      ecx, 0x1f
000000018006c15f  f30f7f83b8020000         movdqu   xmmword ptr [rbx + 0x2b8], xmm0
000000018006c167  0f2845b0                 movaps   xmm0, xmmword ptr [rbp - 0x50]
000000018006c16b  f3ab                     rep stosd dword ptr [rdi], eax
000000018006c16d  4489a3f8140000           mov      dword ptr [rbx + 0x14f8], r12d
000000018006c174  488dbbf8120000           lea      rdi, [rbx + 0x12f8]
000000018006c17b  490fbfc7                 movsx    rax, r15w
000000018006c17f  b900010000               mov      ecx, 0x100
000000018006c184  66f3ab                   rep stosw word ptr [rdi], ax
000000018006c187  8b45f8                   mov      eax, dword ptr [rbp - 8]
000000018006c18a  488d7e4c                 lea      rdi, [rsi + 0x4c]
000000018006c18e  4489a3f4120000           mov      dword ptr [rbx + 0x12f4], r12d
000000018006c195  b93e300000               mov      ecx, 0x303e
000000018006c19a  0f1106                   movups   xmmword ptr [rsi], xmm0
000000018006c19d  0f2845d0                 movaps   xmm0, xmmword ptr [rbp - 0x30]
000000018006c1a1  0f114e10                 movups   xmmword ptr [rsi + 0x10], xmm1
000000018006c1a5  0f284de0                 movaps   xmm1, xmmword ptr [rbp - 0x20]
000000018006c1a9  0f114620                 movups   xmmword ptr [rsi + 0x20], xmm0
000000018006c1ad  f20f1045f0               movsd    xmm0, qword ptr [rbp - 0x10]
000000018006c1b2  0f114e30                 movups   xmmword ptr [rsi + 0x30], xmm1
000000018006c1b6  f20f114640               movsd    qword ptr [rsi + 0x40], xmm0
000000018006c1bb  894648                   mov      dword ptr [rsi + 0x48], eax
000000018006c1be  0fb74538                 movzx    eax, word ptr [rbp + 0x38]
000000018006c1c2  f3a5                     rep movsd dword ptr [rdi], dword ptr [rsi]
000000018006c1c4  488db340d60000           lea      rsi, [rbx + 0xd640]
000000018006c1cb  b9fd020000               mov      ecx, 0x2fd
000000018006c1d0  668906                   mov      word ptr [rsi], ax
000000018006c1d3  488d7e03                 lea      rdi, [rsi + 3]
000000018006c1d7  44886602                 mov      byte ptr [rsi + 2], r12b
000000018006c1db  f3a4                     rep movsb byte ptr [rdi], byte ptr [rsi]
000000018006c1dd  c783b002000020000000     mov      dword ptr [rbx + 0x2b0], 0x20
000000018006c1e7  0f280522389200           movaps   xmm0, xmmword ptr [rip + 0x923822] ; 0x18098fa10
000000018006c1ee  0f1183c8020000           movups   xmmword ptr [rbx + 0x2c8], xmm0
000000018006c1f5  f20f100d23389200         movsd    xmm1, qword ptr [rip + 0x923823] ; 0x18098fa20
000000018006c1fd  f20f118bd8020000         movsd    qword ptr [rbx + 0x2d8], xmm1
000000018006c205  4c89a3e0020000           mov      qword ptr [rbx + 0x2e0], r12
000000018006c20c  4488a3e8020000           mov      byte ptr [rbx + 0x2e8], r12b
000000018006c213  4489bbec020000           mov      dword ptr [rbx + 0x2ec], r15d
000000018006c21a  453bf7                   cmp      r14d, r15d
000000018006c21d  7e08                     jle      0x18006c227
000000018006c21f  488bcb                   mov      rcx, rbx
000000018006c222  e80d420000               call     0x180070434
000000018006c227  4c8d9c2480000000         lea      r11, [rsp + 0x80]
000000018006c22f  498b5b30                 mov      rbx, qword ptr [r11 + 0x30]
000000018006c233  498b7340                 mov      rsi, qword ptr [r11 + 0x40]
000000018006c237  498be3                   mov      rsp, r11
000000018006c23a  415f                     pop      r15
000000018006c23c  415e                     pop      r14
000000018006c23e  415c                     pop      r12
000000018006c240  5f                       pop      rdi
000000018006c241  5d                       pop      rbp
000000018006c242  c3                       ret      
