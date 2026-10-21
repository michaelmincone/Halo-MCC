; PE exception-table range 0x14043eaac..0x14043ecaf (exclusive)
; SHA256 be70d6dcd1a884f10ceb342a7a2dcb35ee0fa43181b66a1d19c3d830e9834691
000000014043eaac  48895c2418               mov      qword ptr [rsp + 0x18], rbx
000000014043eab1  55                       push     rbp
000000014043eab2  56                       push     rsi
000000014043eab3  57                       push     rdi
000000014043eab4  4154                     push     r12
000000014043eab6  4155                     push     r13
000000014043eab8  4156                     push     r14
000000014043eaba  4157                     push     r15
000000014043eabc  4881ec30020000           sub      rsp, 0x230
000000014043eac3  488b058ee28303           mov      rax, qword ptr [rip + 0x383e28e] ; 0x143c7cd58
000000014043eaca  4833c4                   xor      rax, rsp
000000014043eacd  4889842420020000         mov      qword ptr [rsp + 0x220], rax
000000014043ead5  488bb42490020000         mov      rsi, qword ptr [rsp + 0x290]
000000014043eadd  4533f6                   xor      r14d, r14d
000000014043eae0  4d2131                   and      qword ptr [r9], r14
000000014043eae3  418bd8                   mov      ebx, r8d
000000014043eae6  488bfa                   mov      rdi, rdx
000000014043eae9  4889742440               mov      qword ptr [rsp + 0x40], rsi
000000014043eaee  4c8be1                   mov      r12, rcx
000000014043eaf1  33d2                     xor      edx, edx
000000014043eaf3  41b8d0010000             mov      r8d, 0x1d0
000000014043eaf9  488d4c2450               lea      rcx, [rsp + 0x50]
000000014043eafe  4d8be9                   mov      r13, r9
000000014043eb01  e81a612102               call     0x142654c20
000000014043eb06  418d5603                 lea      edx, [r14 + 3]
000000014043eb0a  488bc6                   mov      rax, rsi
000000014043eb0d  488d4c2450               lea      rcx, [rsp + 0x50]
000000014043eb12  448d427d                 lea      r8d, [rdx + 0x7d]
000000014043eb16  0f1001                   movups   xmm0, xmmword ptr [rcx]
000000014043eb19  0f104910                 movups   xmm1, xmmword ptr [rcx + 0x10]
000000014043eb1d  0f1100                   movups   xmmword ptr [rax], xmm0
000000014043eb20  0f104120                 movups   xmm0, xmmword ptr [rcx + 0x20]
000000014043eb24  0f114810                 movups   xmmword ptr [rax + 0x10], xmm1
000000014043eb28  0f104930                 movups   xmm1, xmmword ptr [rcx + 0x30]
000000014043eb2c  0f114020                 movups   xmmword ptr [rax + 0x20], xmm0
000000014043eb30  0f104140                 movups   xmm0, xmmword ptr [rcx + 0x40]
000000014043eb34  0f114830                 movups   xmmword ptr [rax + 0x30], xmm1
000000014043eb38  0f104950                 movups   xmm1, xmmword ptr [rcx + 0x50]
000000014043eb3c  0f114040                 movups   xmmword ptr [rax + 0x40], xmm0
000000014043eb40  0f104160                 movups   xmm0, xmmword ptr [rcx + 0x60]
000000014043eb44  0f114850                 movups   xmmword ptr [rax + 0x50], xmm1
000000014043eb48  0f104970                 movups   xmm1, xmmword ptr [rcx + 0x70]
000000014043eb4c  4903c8                   add      rcx, r8
000000014043eb4f  0f114060                 movups   xmmword ptr [rax + 0x60], xmm0
000000014043eb53  4903c0                   add      rax, r8
000000014043eb56  0f1148f0                 movups   xmmword ptr [rax - 0x10], xmm1
000000014043eb5a  4883ea01                 sub      rdx, 1
000000014043eb5e  75b6                     jne      0x14043eb16
000000014043eb60  0f1001                   movups   xmm0, xmmword ptr [rcx]
000000014043eb63  0f104910                 movups   xmm1, xmmword ptr [rcx + 0x10]
000000014043eb67  0f1100                   movups   xmmword ptr [rax], xmm0
000000014043eb6a  0f104120                 movups   xmm0, xmmword ptr [rcx + 0x20]
000000014043eb6e  0f114810                 movups   xmmword ptr [rax + 0x10], xmm1
000000014043eb72  0f104930                 movups   xmm1, xmmword ptr [rcx + 0x30]
000000014043eb76  0f114020                 movups   xmmword ptr [rax + 0x20], xmm0
000000014043eb7a  0f104140                 movups   xmm0, xmmword ptr [rcx + 0x40]
000000014043eb7e  0f114830                 movups   xmmword ptr [rax + 0x30], xmm1
000000014043eb82  0f114040                 movups   xmmword ptr [rax + 0x40], xmm0
000000014043eb86  4d85e4                   test     r12, r12
000000014043eb89  0f84f2000000             je       0x14043ec81
000000014043eb8f  8d6a01                   lea      ebp, [rdx + 1]
000000014043eb92  488bcf                   mov      rcx, rdi
000000014043eb95  8bd5                     mov      edx, ebp
000000014043eb97  e8b83d4700               call     0x1408b2954
000000014043eb9c  4c8bf8                   mov      r15, rax
000000014043eb9f  4885c0                   test     rax, rax
000000014043eba2  0f84d9000000             je       0x14043ec81
000000014043eba8  488bc8                   mov      rcx, rax
000000014043ebab  e848414700               call     0x1408b2cf8
000000014043ebb0  4533c0                   xor      r8d, r8d
000000014043ebb3  488d1576d3e602           lea      rdx, [rip + 0x2e6d376] ; 0x1432abf30: 'CreateMapVariantFromFile'
000000014043ebba  488bc8                   mov      rcx, rax
000000014043ebbd  488bf0                   mov      rsi, rax
000000014043ebc0  e84bf44400               call     0x14088e010
000000014043ebc5  4533c9                   xor      r9d, r9d
000000014043ebc8  896c2420                 mov      dword ptr [rsp + 0x20], ebp
000000014043ebcc  4c8bc6                   mov      r8, rsi
000000014043ebcf  488bd0                   mov      rdx, rax
000000014043ebd2  498bcf                   mov      rcx, r15
000000014043ebd5  488bf8                   mov      rdi, rax
000000014043ebd8  e8cf414700               call     0x1408b2dac
000000014043ebdd  498bcf                   mov      rcx, r15
000000014043ebe0  e8cb3f4700               call     0x1408b2bb0
000000014043ebe5  b173                     mov      cl, 0x73
000000014043ebe7  e850dcdeff               call     0x14022c83c
000000014043ebec  84c0                     test     al, al
000000014043ebee  745c                     je       0x14043ec4c
000000014043ebf0  8bcb                     mov      ecx, ebx
000000014043ebf2  e815fcffff               call     0x14043e80c
000000014043ebf7  4533c0                   xor      r8d, r8d
000000014043ebfa  40886c2430               mov      byte ptr [rsp + 0x30], bpl
000000014043ebff  4c89442438               mov      qword ptr [rsp + 0x38], r8
000000014043ec04  4885c0                   test     rax, rax
000000014043ec07  742b                     je       0x14043ec34
000000014043ec09  488d4c2430               lea      rcx, [rsp + 0x30]
000000014043ec0e  89742428                 mov      dword ptr [rsp + 0x28], esi
000000014043ec12  48894c2420               mov      qword ptr [rsp + 0x20], rcx
000000014043ec17  4c8d4c2438               lea      r9, [rsp + 0x38]
000000014043ec1c  488bcf                   mov      rcx, rdi
000000014043ec1f  448bc5                   mov      r8d, ebp
000000014043ec22  488bd0                   mov      rdx, rax
000000014043ec25  e8427df4ff               call     0x14038696c
000000014043ec2a  4c8b442438               mov      r8, qword ptr [rsp + 0x38]
000000014043ec2f  408a6c2430               mov      bpl, byte ptr [rsp + 0x30]
000000014043ec34  488b442440               mov      rax, qword ptr [rsp + 0x40]
000000014043ec39  448acd                   mov      r9b, bpl
000000014043ec3c  488bd6                   mov      rdx, rsi
000000014043ec3f  4889442420               mov      qword ptr [rsp + 0x20], rax
000000014043ec44  488bcf                   mov      rcx, rdi
000000014043ec47  e8d480f7ff               call     0x1403b6d20
000000014043ec4c  4885ff                   test     rdi, rdi
000000014043ec4f  7418                     je       0x14043ec69
000000014043ec51  4885f6                   test     rsi, rsi
000000014043ec54  7413                     je       0x14043ec69
000000014043ec56  498b0424                 mov      rax, qword ptr [r12]
000000014043ec5a  448bc6                   mov      r8d, esi
000000014043ec5d  488bd7                   mov      rdx, rdi
000000014043ec60  498bcc                   mov      rcx, r12
000000014043ec63  ff5008                   call     qword ptr [rax + 8]
000000014043ec66  4c8bf0                   mov      r14, rax
000000014043ec69  49897500                 mov      qword ptr [r13], rsi
000000014043ec6d  4885ff                   test     rdi, rdi
000000014043ec70  740f                     je       0x14043ec81
000000014043ec72  488b0d7f2fbc03           mov      rcx, qword ptr [rip + 0x3bc2f7f] ; 0x144001bf8
000000014043ec79  488bd7                   mov      rdx, rdi
000000014043ec7c  e85ff14400               call     0x14088dde0
000000014043ec81  498bc6                   mov      rax, r14
000000014043ec84  488b8c2420020000         mov      rcx, qword ptr [rsp + 0x220]
000000014043ec8c  4833cc                   xor      rcx, rsp
000000014043ec8f  e83c482102               call     0x1426534d0
000000014043ec94  488b9c2480020000         mov      rbx, qword ptr [rsp + 0x280]
000000014043ec9c  4881c430020000           add      rsp, 0x230
000000014043eca3  415f                     pop      r15
000000014043eca5  415e                     pop      r14
000000014043eca7  415d                     pop      r13
000000014043eca9  415c                     pop      r12
000000014043ecab  5f                       pop      rdi
000000014043ecac  5e                       pop      rsi
000000014043ecad  5d                       pop      rbp
000000014043ecae  c3                       ret      
