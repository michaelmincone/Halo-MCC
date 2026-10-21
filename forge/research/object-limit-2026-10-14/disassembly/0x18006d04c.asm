; PE exception-table range 0x18006d04c..0x18006d465 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006d04c  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018006d051  48896c2410               mov      qword ptr [rsp + 0x10], rbp
000000018006d056  4889742418               mov      qword ptr [rsp + 0x18], rsi
000000018006d05b  57                       push     rdi
000000018006d05c  4154                     push     r12
000000018006d05e  4155                     push     r13
000000018006d060  4156                     push     r14
000000018006d062  4157                     push     r15
000000018006d064  4883ec30                 sub      rsp, 0x30
000000018006d068  488bda                   mov      rbx, rdx
000000018006d06b  488bf9                   mov      rdi, rcx
000000018006d06e  e801610900               call     0x180103174
000000018006d073  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d076  41be40000000             mov      r14d, 0x40
000000018006d07c  0fbf97b0020000           movsx    edx, word ptr [rdi + 0x2b0]
000000018006d083  418bc6                   mov      eax, r14d
000000018006d086  2bc1                     sub      eax, ecx
000000018006d088  458d46c8                 lea      r8d, [r14 - 0x38]
000000018006d08c  413bc0                   cmp      eax, r8d
000000018006d08f  7c1b                     jl       0x18006d0ac
000000018006d091  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d095  4103c8                   add      ecx, r8d
000000018006d098  44014324                 add      dword ptr [rbx + 0x24], r8d
000000018006d09c  48c1e008                 shl      rax, 8
000000018006d0a0  480bc2                   or       rax, rdx
000000018006d0a3  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d0a6  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d0aa  eb0b                     jmp      0x18006d0b7
000000018006d0ac  488bcb                   mov      rcx, rbx
000000018006d0af  e810ff0600               call     0x1800dcfc4
000000018006d0b4  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d0b7  8b97ec020000             mov      edx, dword ptr [rdi + 0x2ec]
000000018006d0bd  418bc6                   mov      eax, r14d
000000018006d0c0  2bc1                     sub      eax, ecx
000000018006d0c2  41bd20000000             mov      r13d, 0x20
000000018006d0c8  413bc5                   cmp      eax, r13d
000000018006d0cb  7c1b                     jl       0x18006d0e8
000000018006d0cd  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d0d1  4103cd                   add      ecx, r13d
000000018006d0d4  44016b24                 add      dword ptr [rbx + 0x24], r13d
000000018006d0d8  48c1e020                 shl      rax, 0x20
000000018006d0dc  480bc2                   or       rax, rdx
000000018006d0df  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d0e2  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d0e6  eb0e                     jmp      0x18006d0f6
000000018006d0e8  458bc5                   mov      r8d, r13d
000000018006d0eb  488bcb                   mov      rcx, rbx
000000018006d0ee  e8d1fe0600               call     0x1800dcfc4
000000018006d0f3  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d0f6  8b97f0020000             mov      edx, dword ptr [rdi + 0x2f0]
000000018006d0fc  418bc6                   mov      eax, r14d
000000018006d0ff  2bc1                     sub      eax, ecx
000000018006d101  413bc5                   cmp      eax, r13d
000000018006d104  7c1b                     jl       0x18006d121
000000018006d106  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d10a  4103cd                   add      ecx, r13d
000000018006d10d  44016b24                 add      dword ptr [rbx + 0x24], r13d
000000018006d111  48c1e020                 shl      rax, 0x20
000000018006d115  480bc2                   or       rax, rdx
000000018006d118  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d11b  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d11f  eb0e                     jmp      0x18006d12f
000000018006d121  458bc5                   mov      r8d, r13d
000000018006d124  488bcb                   mov      rcx, rbx
000000018006d127  e898fe0600               call     0x1800dcfc4
000000018006d12c  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d12f  0fbf97b2020000           movsx    edx, word ptr [rdi + 0x2b2]
000000018006d136  418bc6                   mov      eax, r14d
000000018006d139  2bc1                     sub      eax, ecx
000000018006d13b  83f809                   cmp      eax, 9
000000018006d13e  7c1b                     jl       0x18006d15b
000000018006d140  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d144  83c109                   add      ecx, 9
000000018006d147  83432409                 add      dword ptr [rbx + 0x24], 9
000000018006d14b  48c1e009                 shl      rax, 9
000000018006d14f  480bc2                   or       rax, rdx
000000018006d152  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d155  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d159  eb11                     jmp      0x18006d16c
000000018006d15b  41b809000000             mov      r8d, 9
000000018006d161  488bcb                   mov      rcx, rbx
000000018006d164  e85bfe0600               call     0x1800dcfc4
000000018006d169  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d16c  8b97b4020000             mov      edx, dword ptr [rdi + 0x2b4]
000000018006d172  418bc6                   mov      eax, r14d
000000018006d175  2bc1                     sub      eax, ecx
000000018006d177  413bc5                   cmp      eax, r13d
000000018006d17a  7c1b                     jl       0x18006d197
000000018006d17c  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d180  4103cd                   add      ecx, r13d
000000018006d183  44016b24                 add      dword ptr [rbx + 0x24], r13d
000000018006d187  48c1e020                 shl      rax, 0x20
000000018006d18b  480bc2                   or       rax, rdx
000000018006d18e  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d191  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d195  eb0e                     jmp      0x18006d1a5
000000018006d197  458bc5                   mov      r8d, r13d
000000018006d19a  488bcb                   mov      rcx, rbx
000000018006d19d  e822fe0600               call     0x1800dcfc4
000000018006d1a2  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d1a5  0fb697e9020000           movzx    edx, byte ptr [rdi + 0x2e9]
000000018006d1ac  41bf01000000             mov      r15d, 1
000000018006d1b2  4923d7                   and      rdx, r15
000000018006d1b5  413bce                   cmp      ecx, r14d
000000018006d1b8  7319                     jae      0x18006d1d3
000000018006d1ba  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d1be  ffc1                     inc      ecx
000000018006d1c0  44017b24                 add      dword ptr [rbx + 0x24], r15d
000000018006d1c4  4803c0                   add      rax, rax
000000018006d1c7  480bc2                   or       rax, rdx
000000018006d1ca  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d1cd  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d1d1  eb0e                     jmp      0x18006d1e1
000000018006d1d3  458bc7                   mov      r8d, r15d
000000018006d1d6  488bcb                   mov      rcx, rbx
000000018006d1d9  e8e6fd0600               call     0x1800dcfc4
000000018006d1de  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d1e1  0fb697ea020000           movzx    edx, byte ptr [rdi + 0x2ea]
000000018006d1e8  4923d7                   and      rdx, r15
000000018006d1eb  413bce                   cmp      ecx, r14d
000000018006d1ee  7319                     jae      0x18006d209
000000018006d1f0  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d1f4  ffc1                     inc      ecx
000000018006d1f6  44017b24                 add      dword ptr [rbx + 0x24], r15d
000000018006d1fa  4803c0                   add      rax, rax
000000018006d1fd  480bc2                   or       rax, rdx
000000018006d200  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d203  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d207  eb0e                     jmp      0x18006d217
000000018006d209  458bc7                   mov      r8d, r15d
000000018006d20c  488bcb                   mov      rcx, rbx
000000018006d20f  e8b0fd0600               call     0x1800dcfc4
000000018006d214  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d217  33f6                     xor      esi, esi
000000018006d219  4c8da7c8020000           lea      r12, [rdi + 0x2c8]
000000018006d220  8bee                     mov      ebp, esi
000000018006d222  4d8bdc                   mov      r11, r12
000000018006d225  418b13                   mov      edx, dword ptr [r11]
000000018006d228  418bc6                   mov      eax, r14d
000000018006d22b  2bc1                     sub      eax, ecx
000000018006d22d  413bc5                   cmp      eax, r13d
000000018006d230  7c1b                     jl       0x18006d24d
000000018006d232  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d236  4103cd                   add      ecx, r13d
000000018006d239  44016b24                 add      dword ptr [rbx + 0x24], r13d
000000018006d23d  48c1e020                 shl      rax, 0x20
000000018006d241  480bc2                   or       rax, rdx
000000018006d244  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d247  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d24b  eb0e                     jmp      0x18006d25b
000000018006d24d  458bc5                   mov      r8d, r13d
000000018006d250  488bcb                   mov      rcx, rbx
000000018006d253  e86cfd0600               call     0x1800dcfc4
000000018006d258  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d25b  4103ef                   add      ebp, r15d
000000018006d25e  4983c304                 add      r11, 4
000000018006d262  448bc1                   mov      r8d, ecx
000000018006d265  83fd06                   cmp      ebp, 6
000000018006d268  72bb                     jb       0x18006d225
000000018006d26a  8b97e0020000             mov      edx, dword ptr [rdi + 0x2e0]
000000018006d270  418bc6                   mov      eax, r14d
000000018006d273  2bc1                     sub      eax, ecx
000000018006d275  413bc5                   cmp      eax, r13d
000000018006d278  7c1b                     jl       0x18006d295
000000018006d27a  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d27e  8d4920                   lea      ecx, [rcx + 0x20]
000000018006d281  44016b24                 add      dword ptr [rbx + 0x24], r13d
000000018006d285  48c1e020                 shl      rax, 0x20
000000018006d289  480bc2                   or       rax, rdx
000000018006d28c  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d28f  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d293  eb0e                     jmp      0x18006d2a3
000000018006d295  458bc5                   mov      r8d, r13d
000000018006d298  488bcb                   mov      rcx, rbx
000000018006d29b  e824fd0600               call     0x1800dcfc4
000000018006d2a0  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d2a3  8b97e4020000             mov      edx, dword ptr [rdi + 0x2e4]
000000018006d2a9  418bc6                   mov      eax, r14d
000000018006d2ac  2bc1                     sub      eax, ecx
000000018006d2ae  413bc5                   cmp      eax, r13d
000000018006d2b1  7c1b                     jl       0x18006d2ce
000000018006d2b3  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d2b7  4103cd                   add      ecx, r13d
000000018006d2ba  44016b24                 add      dword ptr [rbx + 0x24], r13d
000000018006d2be  48c1e020                 shl      rax, 0x20
000000018006d2c2  480bc2                   or       rax, rdx
000000018006d2c5  894b30                   mov      dword ptr [rbx + 0x30], ecx
000000018006d2c8  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d2cc  eb0e                     jmp      0x18006d2dc
000000018006d2ce  458bc5                   mov      r8d, r13d
000000018006d2d1  488bcb                   mov      rcx, rbx
000000018006d2d4  e8ebfc0600               call     0x1800dcfc4
000000018006d2d9  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d2dc  8b97f8140000             mov      edx, dword ptr [rdi + 0x14f8]
000000018006d2e2  418bc6                   mov      eax, r14d
000000018006d2e5  2bc1                     sub      eax, ecx
000000018006d2e7  83f809                   cmp      eax, 9
000000018006d2ea  7c1b                     jl       0x18006d307
000000018006d2ec  83432409                 add      dword ptr [rbx + 0x24], 9
000000018006d2f0  8d4109                   lea      eax, [rcx + 9]
000000018006d2f3  894330                   mov      dword ptr [rbx + 0x30], eax
000000018006d2f6  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d2fa  48c1e009                 shl      rax, 9
000000018006d2fe  480bc2                   or       rax, rdx
000000018006d301  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d305  eb0e                     jmp      0x18006d315
000000018006d307  41b809000000             mov      r8d, 9
000000018006d30d  488bcb                   mov      rcx, rbx
000000018006d310  e8affc0600               call     0x1800dcfc4
000000018006d315  8b87f8140000             mov      eax, dword ptr [rdi + 0x14f8]
000000018006d31b  448bfe                   mov      r15d, esi
000000018006d31e  85c0                     test     eax, eax
000000018006d320  0f8eaa000000             jle      0x18006d3d0
000000018006d326  4c8db7f8120000           lea      r14, [rdi + 0x12f8]
000000018006d32d  410fbf2e                 movsx    ebp, word ptr [r14]
000000018006d331  488bd6                   mov      rdx, rsi
000000018006d334  8b4330                   mov      eax, dword ptr [rbx + 0x30]
000000018006d337  83fdff                   cmp      ebp, -1
000000018006d33a  0f95c2                   setne    dl
000000018006d33d  83f840                   cmp      eax, 0x40
000000018006d340  7318                     jae      0x18006d35a
000000018006d342  ff4324                   inc      dword ptr [rbx + 0x24]
000000018006d345  ffc0                     inc      eax
000000018006d347  894330                   mov      dword ptr [rbx + 0x30], eax
000000018006d34a  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d34e  4803c0                   add      rax, rax
000000018006d351  480bc2                   or       rax, rdx
000000018006d354  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d358  eb0e                     jmp      0x18006d368
000000018006d35a  41b801000000             mov      r8d, 1
000000018006d360  488bcb                   mov      rcx, rbx
000000018006d363  e85cfc0600               call     0x1800dcfc4
000000018006d368  83fdff                   cmp      ebp, -1
000000018006d36b  743a                     je       0x18006d3a7
000000018006d36d  8b4b30                   mov      ecx, dword ptr [rbx + 0x30]
000000018006d370  b840000000               mov      eax, 0x40
000000018006d375  2bc1                     sub      eax, ecx
000000018006d377  8bd5                     mov      edx, ebp
000000018006d379  83f80c                   cmp      eax, 0xc
000000018006d37c  7c1b                     jl       0x18006d399
000000018006d37e  8343240c                 add      dword ptr [rbx + 0x24], 0xc
000000018006d382  8d410c                   lea      eax, [rcx + 0xc]
000000018006d385  894330                   mov      dword ptr [rbx + 0x30], eax
000000018006d388  488b4328                 mov      rax, qword ptr [rbx + 0x28]
000000018006d38c  48c1e00c                 shl      rax, 0xc
000000018006d390  480bc2                   or       rax, rdx
000000018006d393  48894328                 mov      qword ptr [rbx + 0x28], rax
000000018006d397  eb0e                     jmp      0x18006d3a7
000000018006d399  41b80c000000             mov      r8d, 0xc
000000018006d39f  488bcb                   mov      rcx, rbx
000000018006d3a2  e81dfc0600               call     0x1800dcfc4
000000018006d3a7  8b87f8140000             mov      eax, dword ptr [rdi + 0x14f8]
000000018006d3ad  41ffc7                   inc      r15d
000000018006d3b0  4983c602                 add      r14, 2
000000018006d3b4  443bf8                   cmp      r15d, eax
000000018006d3b7  0f8c70ffffff             jl       0x18006d32d
000000018006d3bd  85c0                     test     eax, eax
000000018006d3bf  7e0f                     jle      0x18006d3d0
000000018006d3c1  488bd3                   mov      rdx, rbx
000000018006d3c4  488d8ff4020000           lea      rcx, [rdi + 0x2f4]
000000018006d3cb  e870350000               call     0x180070940
000000018006d3d0  664439afb0020000         cmp      word ptr [rdi + 0x2b0], r13w
000000018006d3d8  7c1a                     jl       0x18006d3f4
000000018006d3da  0f1087b8020000           movups   xmm0, xmmword ptr [rdi + 0x2b8]
000000018006d3e1  4c8d442420               lea      r8, [rsp + 0x20]
000000018006d3e6  488bcb                   mov      rcx, rbx
000000018006d3e9  f30f7f442420             movdqu   xmmword ptr [rsp + 0x20], xmm0
000000018006d3ef  e8f4ff0600               call     0x1800dd3e8
000000018006d3f4  488daffc140000           lea      rbp, [rdi + 0x14fc]
000000018006d3fb  41be8b020000             mov      r14d, 0x28b
000000018006d401  4d8bc4                   mov      r8, r12
000000018006d404  488bd3                   mov      rdx, rbx
000000018006d407  488bcd                   mov      rcx, rbp
000000018006d40a  e82d280000               call     0x18006fc3c
000000018006d40f  4883c54c                 add      rbp, 0x4c
000000018006d413  4983ee01                 sub      r14, 1
000000018006d417  75e8                     jne      0x18006d401
000000018006d419  663bb7b2020000           cmp      si, word ptr [rdi + 0x2b2]
000000018006d420  7d26                     jge      0x18006d448
000000018006d422  4863ce                   movsxd   rcx, esi
000000018006d425  488d8740d60000           lea      rax, [rdi + 0xd640]
000000018006d42c  488bd3                   mov      rdx, rbx
000000018006d42f  488d0448                 lea      rax, [rax + rcx*2]
000000018006d433  4803c8                   add      rcx, rax
000000018006d436  e8e5e7ffff               call     0x18006bc20
000000018006d43b  0fbf87b2020000           movsx    eax, word ptr [rdi + 0x2b2]
000000018006d442  ffc6                     inc      esi
000000018006d444  3bf0                     cmp      esi, eax
000000018006d446  7cda                     jl       0x18006d422
000000018006d448  488b5c2460               mov      rbx, qword ptr [rsp + 0x60]
000000018006d44d  488b6c2468               mov      rbp, qword ptr [rsp + 0x68]
000000018006d452  488b742470               mov      rsi, qword ptr [rsp + 0x70]
000000018006d457  4883c430                 add      rsp, 0x30
000000018006d45b  415f                     pop      r15
000000018006d45d  415e                     pop      r14
000000018006d45f  415d                     pop      r13
000000018006d461  415c                     pop      r12
000000018006d463  5f                       pop      rdi
000000018006d464  c3                       ret      
