; PE exception-table range 0x14043ce28..0x14043da36 (exclusive)
; SHA256 be70d6dcd1a884f10ceb342a7a2dcb35ee0fa43181b66a1d19c3d830e9834691
000000014043ce28  488bc4                   mov      rax, rsp
000000014043ce2b  55                       push     rbp
000000014043ce2c  56                       push     rsi
000000014043ce2d  57                       push     rdi
000000014043ce2e  4154                     push     r12
000000014043ce30  4155                     push     r13
000000014043ce32  4156                     push     r14
000000014043ce34  4157                     push     r15
000000014043ce36  488da8e8feffff           lea      rbp, [rax - 0x118]
000000014043ce3d  4881ece0010000           sub      rsp, 0x1e0
000000014043ce44  48c7442448feffffff       mov      qword ptr [rsp + 0x48], 0xfffffffffffffffe
000000014043ce4d  48895818                 mov      qword ptr [rax + 0x18], rbx
000000014043ce51  0f2970b8                 movaps   xmmword ptr [rax - 0x48], xmm6
000000014043ce55  488b05fcfe8303           mov      rax, qword ptr [rip + 0x383fefc] ; 0x143c7cd58
000000014043ce5c  4833c4                   xor      rax, rsp
000000014043ce5f  488985c8000000           mov      qword ptr [rbp + 0xc8], rax
000000014043ce66  8bda                     mov      ebx, edx
000000014043ce68  4c8bf1                   mov      r14, rcx
000000014043ce6b  48894c2440               mov      qword ptr [rsp + 0x40], rcx
000000014043ce70  895568                   mov      dword ptr [rbp + 0x68], edx
000000014043ce73  8bca                     mov      ecx, edx
000000014043ce75  e80e3eddff               call     0x140210c88
000000014043ce7a  448bc8                   mov      r9d, eax
000000014043ce7d  4183cfff                 or       r15d, 0xffffffff
000000014043ce81  458d6702                 lea      r12d, [r15 + 2]
000000014043ce85  4533ed                   xor      r13d, r13d
000000014043ce88  4584c0                   test     r8b, r8b
000000014043ce8b  0f856f030000             jne      0x14043d200
000000014043ce91  41f6868001000004         test     byte ptr [r14 + 0x180], 4
000000014043ce99  0f95c1                   setne    cl
000000014043ce9c  4102cc                   add      cl, r12b
000000014043ce9f  888d98000000             mov      byte ptr [rbp + 0x98], cl
000000014043cea5  4488ad99000000           mov      byte ptr [rbp + 0x99], r13b
000000014043ceac  0f57c0                   xorps    xmm0, xmm0
000000014043ceaf  f30f7f85a0000000         movdqu   xmmword ptr [rbp + 0xa0], xmm0
000000014043ceb7  4c8d8598000000           lea      r8, [rbp + 0x98]
000000014043cebe  8bd0                     mov      edx, eax
000000014043cec0  488b0d793dbc03           mov      rcx, qword ptr [rip + 0x3bc3d79] ; 0x144000c40
000000014043cec7  e8843bddff               call     0x140210a50
000000014043cecc  be10040000               mov      esi, 0x410
000000014043ced1  488b9da0000000           mov      rbx, qword ptr [rbp + 0xa0]
000000014043ced8  4885db                   test     rbx, rbx
000000014043cedb  0f8492000000             je       0x14043cf73
000000014043cee1  488bbda8000000           mov      rdi, qword ptr [rbp + 0xa8]
000000014043cee8  4885ff                   test     rdi, rdi
000000014043ceeb  0f8482000000             je       0x14043cf73
000000014043cef1  488b0d8898b203           mov      rcx, qword ptr [rip + 0x3b29888] ; 0x143f66780
000000014043cef8  488b4920                 mov      rcx, qword ptr [rcx + 0x20]
000000014043cefc  e80b0f7f00               call     0x140c2de0c
000000014043cf01  483bdf                   cmp      rbx, rdi
000000014043cf04  746d                     je       0x14043cf73
000000014043cf06  4883c304                 add      rbx, 4
000000014043cf0a  4c637d68                 movsxd   r15, dword ptr [rbp + 0x68]
000000014043cf0e  49c1e704                 shl      r15, 4
000000014043cf12  4981c708010000           add      r15, 0x108
000000014043cf19  4d03fe                   add      r15, r14
000000014043cf1c  488bce                   mov      rcx, rsi
000000014043cf1f  e8d0314f00               call     0x1409300f4
000000014043cf24  48898580000000           mov      qword ptr [rbp + 0x80], rax
000000014043cf2b  4885c0                   test     rax, rax
000000014043cf2e  740d                     je       0x14043cf3d
000000014043cf30  488bc8                   mov      rcx, rax
000000014043cf33  e8c8f2ffff               call     0x14043c200
000000014043cf38  488bc8                   mov      rcx, rax
000000014043cf3b  eb03                     jmp      0x14043cf40
000000014043cf3d  498bcd                   mov      rcx, r13
000000014043cf40  498b07                   mov      rax, qword ptr [r15]
000000014043cf43  48894808                 mov      qword ptr [rax + 8], rcx
000000014043cf47  488901                   mov      qword ptr [rcx], rax
000000014043cf4a  4c897908                 mov      qword ptr [rcx + 8], r15
000000014043cf4e  49890f                   mov      qword ptr [r15], rcx
000000014043cf51  440fbf03                 movsx    r8d, word ptr [rbx]
000000014043cf55  440fb74b02               movzx    r9d, word ptr [rbx + 2]
000000014043cf5a  8b5568                   mov      edx, dword ptr [rbp + 0x68]
000000014043cf5d  e8c2f3ffff               call     0x14043c324
000000014043cf62  4883c310                 add      rbx, 0x10
000000014043cf66  488d43fc                 lea      rax, [rbx - 4]
000000014043cf6a  483bc7                   cmp      rax, rdi
000000014043cf6d  759b                     jne      0x14043cf0a
000000014043cf6f  4183cfff                 or       r15d, 0xffffffff
000000014043cf73  41f6868001000004         test     byte ptr [r14 + 0x180], 4
000000014043cf7b  0f857c030000             jne      0x14043d2fd
000000014043cf81  498bd5                   mov      rdx, r13
000000014043cf84  4c634d68                 movsxd   r9, dword ptr [rbp + 0x68]
000000014043cf88  418bc9                   mov      ecx, r9d
000000014043cf8b  4585c9                   test     r9d, r9d
000000014043cf8e  7454                     je       0x14043cfe4
000000014043cf90  412bcc                   sub      ecx, r12d
000000014043cf93  7446                     je       0x14043cfdb
000000014043cf95  412bcc                   sub      ecx, r12d
000000014043cf98  7438                     je       0x14043cfd2
000000014043cf9a  412bcc                   sub      ecx, r12d
000000014043cf9d  742a                     je       0x14043cfc9
000000014043cf9f  412bcc                   sub      ecx, r12d
000000014043cfa2  741c                     je       0x14043cfc0
000000014043cfa4  412bcc                   sub      ecx, r12d
000000014043cfa7  740e                     je       0x14043cfb7
000000014043cfa9  413bcc                   cmp      ecx, r12d
000000014043cfac  753d                     jne      0x14043cfeb
000000014043cfae  488d152bf0e602           lea      rdx, [rip + 0x2e6f02b] ; 0x1432abfe0: 'haloreach\\map_variants'
000000014043cfb5  eb34                     jmp      0x14043cfeb
000000014043cfb7  488d15f2efe602           lea      rdx, [rip + 0x2e6eff2] ; 0x1432abfb0: 'halo3odst\\map_variants'
000000014043cfbe  eb2b                     jmp      0x14043cfeb
000000014043cfc0  488d15d1efe602           lea      rdx, [rip + 0x2e6efd1] ; 0x1432abf98: 'groundhog\\map_variants'
000000014043cfc7  eb22                     jmp      0x14043cfeb
000000014043cfc9  488d1558f0e602           lea      rdx, [rip + 0x2e6f058] ; 0x1432ac028: 'halo4\\map_variants'
000000014043cfd0  eb19                     jmp      0x14043cfeb
000000014043cfd2  488d1567f0e602           lea      rdx, [rip + 0x2e6f067] ; 0x1432ac040: 'halo3\\map_variants'
000000014043cfd9  eb10                     jmp      0x14043cfeb
000000014043cfdb  488d1516f0e602           lea      rdx, [rip + 0x2e6f016] ; 0x1432abff8: 'halo2\\map_variants'
000000014043cfe2  eb07                     jmp      0x14043cfeb
000000014043cfe4  488d1525f0e602           lea      rdx, [rip + 0x2e6f025] ; 0x1432ac010: 'halo1\\map_variants'
000000014043cfeb  498bc1                   mov      rax, r9
000000014043cfee  48c1e004                 shl      rax, 4
000000014043cff2  498d8e08010000           lea      rcx, [r14 + 0x108]
000000014043cff9  4803c8                   add      rcx, rax
000000014043cffc  4c8d05bd89e702           lea      r8, [rip + 0x2e789bd] ; 0x1432b59c0: '*.mvar'
000000014043d003  e898600000               call     0x1404430a0
000000014043d008  4c897570                 mov      qword ptr [rbp + 0x70], r14
000000014043d00c  488d4568                 lea      rax, [rbp + 0x68]
000000014043d010  48894578                 mov      qword ptr [rbp + 0x78], rax
000000014043d014  488d05edf6e602           lea      rax, [rip + 0x2e6f6ed] ; 0x1432ac708
000000014043d01b  48894590                 mov      qword ptr [rbp - 0x70], rax
000000014043d01f  0f104570                 movups   xmm0, xmmword ptr [rbp + 0x70]
000000014043d023  f30f7f4598               movdqu   xmmword ptr [rbp - 0x68], xmm0
000000014043d028  488d4590                 lea      rax, [rbp - 0x70]
000000014043d02c  488945c8                 mov      qword ptr [rbp - 0x38], rax
000000014043d030  488d4590                 lea      rax, [rbp - 0x70]
000000014043d034  4889442428               mov      qword ptr [rsp + 0x28], rax
000000014043d039  4c896c2420               mov      qword ptr [rsp + 0x20], r13
000000014043d03e  458bcc                   mov      r9d, r12d
000000014043d041  448b4568                 mov      r8d, dword ptr [rbp + 0x68]
000000014043d045  ba03000000               mov      edx, 3
000000014043d04a  488b0d6f46bc03           mov      rcx, qword ptr [rip + 0x3bc466f] ; 0x1440016c0
000000014043d051  e8e60f0400               call     0x14047e03c
000000014043d056  4c896d50                 mov      qword ptr [rbp + 0x50], r13
000000014043d05a  4c89ad80000000           mov      qword ptr [rbp + 0x80], r13
000000014043d061  488d4550                 lea      rax, [rbp + 0x50]
000000014043d065  48894570                 mov      qword ptr [rbp + 0x70], rax
000000014043d069  488d8580000000           lea      rax, [rbp + 0x80]
000000014043d070  48894578                 mov      qword ptr [rbp + 0x78], rax
000000014043d074  488d05bdf6e602           lea      rax, [rip + 0x2e6f6bd] ; 0x1432ac738
000000014043d07b  488945d0                 mov      qword ptr [rbp - 0x30], rax
000000014043d07f  0f104570                 movups   xmm0, xmmword ptr [rbp + 0x70]
000000014043d083  f30f7f45d8               movdqu   xmmword ptr [rbp - 0x28], xmm0
000000014043d088  488d45d0                 lea      rax, [rbp - 0x30]
000000014043d08c  48894508                 mov      qword ptr [rbp + 8], rax
000000014043d090  488d45d0                 lea      rax, [rbp - 0x30]
000000014043d094  4889442428               mov      qword ptr [rsp + 0x28], rax
000000014043d099  4c896c2420               mov      qword ptr [rsp + 0x20], r13
000000014043d09e  458bcc                   mov      r9d, r12d
000000014043d0a1  448b4568                 mov      r8d, dword ptr [rbp + 0x68]
000000014043d0a5  33d2                     xor      edx, edx
000000014043d0a7  488b0d1246bc03           mov      rcx, qword ptr [rip + 0x3bc4612] ; 0x1440016c0
000000014043d0ae  e8890f0400               call     0x14047e03c
000000014043d0b3  488b4550                 mov      rax, qword ptr [rbp + 0x50]
000000014043d0b7  4885c0                   test     rax, rax
000000014043d0ba  7470                     je       0x14043d12c
000000014043d0bc  4c396810                 cmp      qword ptr [rax + 0x10], r13
000000014043d0c0  746a                     je       0x14043d12c
000000014043d0c2  48635d68                 movsxd   rbx, dword ptr [rbp + 0x68]
000000014043d0c6  48c1e304                 shl      rbx, 4
000000014043d0ca  4881c308010000           add      rbx, 0x108
000000014043d0d1  4903de                   add      rbx, r14
000000014043d0d4  488bce                   mov      rcx, rsi
000000014043d0d7  e818304f00               call     0x1409300f4
000000014043d0dc  4889442438               mov      qword ptr [rsp + 0x38], rax
000000014043d0e1  4885c0                   test     rax, rax
000000014043d0e4  740d                     je       0x14043d0f3
000000014043d0e6  488bc8                   mov      rcx, rax
000000014043d0e9  e812f1ffff               call     0x14043c200
000000014043d0ee  488bd0                   mov      rdx, rax
000000014043d0f1  eb03                     jmp      0x14043d0f6
000000014043d0f3  498bd5                   mov      rdx, r13
000000014043d0f6  488b03                   mov      rax, qword ptr [rbx]
000000014043d0f9  48895008                 mov      qword ptr [rax + 8], rdx
000000014043d0fd  488902                   mov      qword ptr [rdx], rax
000000014043d100  48895a08                 mov      qword ptr [rdx + 8], rbx
000000014043d104  488913                   mov      qword ptr [rbx], rdx
000000014043d107  488b4550                 mov      rax, qword ptr [rbp + 0x50]
000000014043d10b  488b4810                 mov      rcx, qword ptr [rax + 0x10]
000000014043d10f  8b4568                   mov      eax, dword ptr [rbp + 0x68]
000000014043d112  894218                   mov      dword ptr [rdx + 0x18], eax
000000014043d115  0f104124                 movups   xmm0, xmmword ptr [rcx + 0x24]
000000014043d119  f30f7f82d8030000         movdqu   xmmword ptr [rdx + 0x3d8], xmm0
000000014043d121  c7421404000000           mov      dword ptr [rdx + 0x14], 4
000000014043d128  44896210                 mov      dword ptr [rdx + 0x10], r12d
000000014043d12c  8b5d68                   mov      ebx, dword ptr [rbp + 0x68]
000000014043d12f  413bdc                   cmp      ebx, r12d
000000014043d132  0f87c8010000             ja       0x14043d300
000000014043d138  488b0d4144bc03           mov      rcx, qword ptr [rip + 0x3bc4441] ; 0x144001580
000000014043d13f  e8903bf5ff               call     0x140390cd4
000000014043d144  4885c0                   test     rax, rax
000000014043d147  0f84b0010000             je       0x14043d2fd
000000014043d14d  488d98a0020000           lea      rbx, [rax + 0x2a0]
000000014043d154  488bcb                   mov      rcx, rbx
000000014043d157  e824c3d8ff               call     0x1401c9480
000000014043d15c  84c0                     test     al, al
000000014043d15e  7416                     je       0x14043d176
000000014043d160  8b03                     mov      eax, dword ptr [rbx]
000000014043d162  0fb74b04                 movzx    ecx, word ptr [rbx + 4]
000000014043d166  6689442430               mov      word ptr [rsp + 0x30], ax
000000014043d16b  66894c2432               mov      word ptr [rsp + 0x32], cx
000000014043d170  8b442430                 mov      eax, dword ptr [rsp + 0x30]
000000014043d174  eb10                     jmp      0x14043d186
000000014043d176  6644897c2438             mov      word ptr [rsp + 0x38], r15w
000000014043d17c  6644896c243a             mov      word ptr [rsp + 0x3a], r13w
000000014043d182  8b442438                 mov      eax, dword ptr [rsp + 0x38]
000000014043d186  0fbff8                   movsx    edi, ax
000000014043d189  413bff                   cmp      edi, r15d
000000014043d18c  0f846b010000             je       0x14043d2fd
000000014043d192  8bcf                     mov      ecx, edi
000000014043d194  e8b73addff               call     0x140210c50
000000014043d199  8bc8                     mov      ecx, eax
000000014043d19b  e83c3bddff               call     0x140210cdc
000000014043d1a0  48635d68                 movsxd   rbx, dword ptr [rbp + 0x68]
000000014043d1a4  3bc3                     cmp      eax, ebx
000000014043d1a6  0f8554010000             jne      0x14043d300
000000014043d1ac  488bc3                   mov      rax, rbx
000000014043d1af  48c1e004                 shl      rax, 4
000000014043d1b3  498d9e08010000           lea      rbx, [r14 + 0x108]
000000014043d1ba  4803d8                   add      rbx, rax
000000014043d1bd  488bce                   mov      rcx, rsi
000000014043d1c0  e82f2f4f00               call     0x1409300f4
000000014043d1c5  4889442438               mov      qword ptr [rsp + 0x38], rax
000000014043d1ca  4885c0                   test     rax, rax
000000014043d1cd  740d                     je       0x14043d1dc
000000014043d1cf  488bc8                   mov      rcx, rax
000000014043d1d2  e829f0ffff               call     0x14043c200
000000014043d1d7  488bc8                   mov      rcx, rax
000000014043d1da  eb03                     jmp      0x14043d1df
000000014043d1dc  498bcd                   mov      rcx, r13
000000014043d1df  488b03                   mov      rax, qword ptr [rbx]
000000014043d1e2  48894808                 mov      qword ptr [rax + 8], rcx
000000014043d1e6  488901                   mov      qword ptr [rcx], rax
000000014043d1e9  48895908                 mov      qword ptr [rcx + 8], rbx
000000014043d1ed  48890b                   mov      qword ptr [rbx], rcx
000000014043d1f0  448bc7                   mov      r8d, edi
000000014043d1f3  8b5568                   mov      edx, dword ptr [rbp + 0x68]
000000014043d1f6  e8c1f1ffff               call     0x14043c3bc
000000014043d1fb  e9fd000000               jmp      0x14043d2fd
000000014043d200  488b050997b203           mov      rax, qword ptr [rip + 0x3b29709] ; 0x143f66910
000000014043d207  4885c0                   test     rax, rax
000000014043d20a  0f84f0000000             je       0x14043d300
000000014043d210  8b00                     mov      eax, dword ptr [rax]
000000014043d212  83f802                   cmp      eax, 2
000000014043d215  0f85e2000000             jne      0x14043d2fd
000000014043d21b  488b1dee96b203           mov      rbx, qword ptr [rip + 0x3b296ee] ; 0x143f66910
000000014043d222  418bc9                   mov      ecx, r9d
000000014043d225  e85a3bddff               call     0x140210d84
000000014043d22a  83f806                   cmp      eax, 6
000000014043d22d  0f87ca000000             ja       0x14043d2fd
000000014043d233  8ac8                     mov      cl, al
000000014043d235  418bd4                   mov      edx, r12d
000000014043d238  d2e2                     shl      dl, cl
000000014043d23a  845316                   test     byte ptr [rbx + 0x16], dl
000000014043d23d  0f84ba000000             je       0x14043d2fd
000000014043d243  8bd0                     mov      edx, eax
000000014043d245  488bcb                   mov      rcx, rbx
000000014043d248  e817e3c401               call     0x14208b564
000000014043d24d  4885c0                   test     rax, rax
000000014043d250  0f84a7000000             je       0x14043d2fd
000000014043d256  488b7818                 mov      rdi, qword ptr [rax + 0x18]
000000014043d25a  488b1f                   mov      rbx, qword ptr [rdi]
000000014043d25d  483bdf                   cmp      rbx, rdi
000000014043d260  0f8497000000             je       0x14043d2fd
000000014043d266  be10040000               mov      esi, 0x410
000000014043d26b  488b4320                 mov      rax, qword ptr [rbx + 0x20]
000000014043d26f  41f6868001000004         test     byte ptr [r14 + 0x180], 4
000000014043d277  7406                     je       0x14043d27f
000000014043d279  80783102                 cmp      byte ptr [rax + 0x31], 2
000000014043d27d  eb04                     jmp      0x14043d283
000000014043d27f  44386031                 cmp      byte ptr [rax + 0x31], r12b
000000014043d283  756c                     jne      0x14043d2f1
000000014043d285  0f107310                 movups   xmm6, xmmword ptr [rbx + 0x10]
000000014043d289  4c637d68                 movsxd   r15, dword ptr [rbp + 0x68]
000000014043d28d  49c1e704                 shl      r15, 4
000000014043d291  4981c708010000           add      r15, 0x108
000000014043d298  4d03fe                   add      r15, r14
000000014043d29b  488bce                   mov      rcx, rsi
000000014043d29e  e8512e4f00               call     0x1409300f4
000000014043d2a3  4889442438               mov      qword ptr [rsp + 0x38], rax
000000014043d2a8  4885c0                   test     rax, rax
000000014043d2ab  740d                     je       0x14043d2ba
000000014043d2ad  488bc8                   mov      rcx, rax
000000014043d2b0  e84befffff               call     0x14043c200
000000014043d2b5  488bc8                   mov      rcx, rax
000000014043d2b8  eb03                     jmp      0x14043d2bd
000000014043d2ba  498bcd                   mov      rcx, r13
000000014043d2bd  498b07                   mov      rax, qword ptr [r15]
000000014043d2c0  48894808                 mov      qword ptr [rax + 8], rcx
000000014043d2c4  488901                   mov      qword ptr [rcx], rax
000000014043d2c7  4c897908                 mov      qword ptr [rcx + 8], r15
000000014043d2cb  49890f                   mov      qword ptr [r15], rcx
000000014043d2ce  8b4568                   mov      eax, dword ptr [rbp + 0x68]
000000014043d2d1  894118                   mov      dword ptr [rcx + 0x18], eax
000000014043d2d4  c7411405000000           mov      dword ptr [rcx + 0x14], 5
000000014043d2db  f30f7fb1e8030000         movdqu   xmmword ptr [rcx + 0x3e8], xmm6
000000014043d2e3  c781f8030000fdffffff     mov      dword ptr [rcx + 0x3f8], 0xfffffffd
000000014043d2ed  44896110                 mov      dword ptr [rcx + 0x10], r12d
000000014043d2f1  488b1b                   mov      rbx, qword ptr [rbx]
000000014043d2f4  483bdf                   cmp      rbx, rdi
000000014043d2f7  0f856effffff             jne      0x14043d26b
000000014043d2fd  8b5d68                   mov      ebx, dword ptr [rbp + 0x68]
000000014043d300  4863cb                   movsxd   rcx, ebx
000000014043d303  488d4111                 lea      rax, [rcx + 0x11]
000000014043d307  4803c0                   add      rax, rax
000000014043d30a  498b3cc6                 mov      rdi, qword ptr [r14 + rax*8]
000000014043d30e  48c1e104                 shl      rcx, 4
000000014043d312  498d8608010000           lea      rax, [r14 + 0x108]
000000014043d319  4803c1                   add      rax, rcx
000000014043d31c  eb20                     jmp      0x14043d33e
000000014043d31e  488bcf                   mov      rcx, rdi
000000014043d321  e82ef1ffff               call     0x14043c454
000000014043d326  488b7f08                 mov      rdi, qword ptr [rdi + 8]
000000014043d32a  48635d68                 movsxd   rbx, dword ptr [rbp + 0x68]
000000014043d32e  488bc3                   mov      rax, rbx
000000014043d331  48c1e004                 shl      rax, 4
000000014043d335  480508010000             add      rax, 0x108
000000014043d33b  4903c6                   add      rax, r14
000000014043d33e  483bf8                   cmp      rdi, rax
000000014043d341  75db                     jne      0x14043d31e
000000014043d343  498bfd                   mov      rdi, r13
000000014043d346  8bcb                     mov      ecx, ebx
000000014043d348  85db                     test     ebx, ebx
000000014043d34a  7454                     je       0x14043d3a0
000000014043d34c  412bcc                   sub      ecx, r12d
000000014043d34f  7446                     je       0x14043d397
000000014043d351  412bcc                   sub      ecx, r12d
000000014043d354  7438                     je       0x14043d38e
000000014043d356  412bcc                   sub      ecx, r12d
000000014043d359  742a                     je       0x14043d385
000000014043d35b  412bcc                   sub      ecx, r12d
000000014043d35e  741c                     je       0x14043d37c
000000014043d360  412bcc                   sub      ecx, r12d
000000014043d363  740e                     je       0x14043d373
000000014043d365  413bcc                   cmp      ecx, r12d
000000014043d368  753d                     jne      0x14043d3a7
000000014043d36a  488d3de7ece602           lea      rdi, [rip + 0x2e6ece7] ; 0x1432ac058: 'haloreach\\game_variants'
000000014043d371  eb34                     jmp      0x14043d3a7
000000014043d373  488d3d7eede602           lea      rdi, [rip + 0x2e6ed7e] ; 0x1432ac0f8: 'halo3odst\\game_variants'
000000014043d37a  eb2b                     jmp      0x14043d3a7
000000014043d37c  488d3dedece602           lea      rdi, [rip + 0x2e6eced] ; 0x1432ac070: 'groundhog\\game_variants'
000000014043d383  eb22                     jmp      0x14043d3a7
000000014043d385  488d3d84ede602           lea      rdi, [rip + 0x2e6ed84] ; 0x1432ac110: 'halo4\\game_variants'
000000014043d38c  eb19                     jmp      0x14043d3a7
000000014043d38e  488d3d33ede602           lea      rdi, [rip + 0x2e6ed33] ; 0x1432ac0c8: 'halo3\\game_variants'
000000014043d395  eb10                     jmp      0x14043d3a7
000000014043d397  488d3d42ede602           lea      rdi, [rip + 0x2e6ed42] ; 0x1432ac0e0: 'halo2\\game_variants'
000000014043d39e  eb07                     jmp      0x14043d3a7
000000014043d3a0  488d3d21ece602           lea      rdi, [rip + 0x2e6ec21] ; 0x1432abfc8: 'halo1\\game_variants'
000000014043d3a7  4863c3                   movsxd   rax, ebx
000000014043d3aa  48c1e004                 shl      rax, 4
000000014043d3ae  4d8d7e28                 lea      r15, [r14 + 0x28]
000000014043d3b2  4c03f8                   add      r15, rax
000000014043d3b5  4885ff                   test     rdi, rdi
000000014043d3b8  0f84e9000000             je       0x14043d4a7
000000014043d3be  488bcf                   mov      rcx, rdi
000000014043d3c1  e8225c4700               call     0x1408b2fe8
000000014043d3c6  84c0                     test     al, al
000000014043d3c8  0f84d6000000             je       0x14043d4a4
000000014043d3ce  488d8588000000           lea      rax, [rbp + 0x88]
000000014043d3d5  48898588000000           mov      qword ptr [rbp + 0x88], rax
000000014043d3dc  488d8588000000           lea      rax, [rbp + 0x88]
000000014043d3e3  48898590000000           mov      qword ptr [rbp + 0x90], rax
000000014043d3ea  4c8d0de785e702           lea      r9, [rip + 0x2e785e7] ; 0x1432b59d8: '*.bin'
000000014043d3f1  4533c0                   xor      r8d, r8d
000000014043d3f4  488bd7                   mov      rdx, rdi
000000014043d3f7  488d8d88000000           lea      rcx, [rbp + 0x88]
000000014043d3fe  e8555e4700               call     0x1408b3258
000000014043d403  488bb590000000           mov      rsi, qword ptr [rbp + 0x90]
000000014043d40a  eb7c                     jmp      0x14043d488
000000014043d40c  488b4e18                 mov      rcx, qword ptr [rsi + 0x18]
000000014043d410  33c0                     xor      eax, eax
000000014043d412  48894570                 mov      qword ptr [rbp + 0x70], rax
000000014043d416  48894578                 mov      qword ptr [rbp + 0x78], rax
000000014043d41a  4885c9                   test     rcx, rcx
000000014043d41d  7409                     je       0x14043d428
000000014043d41f  488d5570                 lea      rdx, [rbp + 0x70]
000000014043d423  e888180000               call     0x14043ecb0
000000014043d428  b958040000               mov      ecx, 0x458
000000014043d42d  e8c22c4f00               call     0x1409300f4
000000014043d432  4889442438               mov      qword ptr [rsp + 0x38], rax
000000014043d437  4885c0                   test     rax, rax
000000014043d43a  740d                     je       0x14043d449
000000014043d43c  488bc8                   mov      rcx, rax
000000014043d43f  e830d9ffff               call     0x14043ad74
000000014043d444  488bf8                   mov      rdi, rax
000000014043d447  eb03                     jmp      0x14043d44c
000000014043d449  498bfd                   mov      rdi, r13
000000014043d44c  498b07                   mov      rax, qword ptr [r15]
000000014043d44f  48897808                 mov      qword ptr [rax + 8], rdi
000000014043d453  488907                   mov      qword ptr [rdi], rax
000000014043d456  4c897f08                 mov      qword ptr [rdi + 8], r15
000000014043d45a  49893f                   mov      qword ptr [r15], rdi
000000014043d45d  488b5618                 mov      rdx, qword ptr [rsi + 0x18]
000000014043d461  895f18                   mov      dword ptr [rdi + 0x18], ebx
000000014043d464  0f104570                 movups   xmm0, xmmword ptr [rbp + 0x70]
000000014043d468  f30f7f87d8030000         movdqu   xmmword ptr [rdi + 0x3d8], xmm0
000000014043d470  c7471402000000           mov      dword ptr [rdi + 0x14], 2
000000014043d477  488d4f28                 lea      rcx, [rdi + 0x28]
000000014043d47b  e8e0541600               call     0x1405a2960
000000014043d480  44896710                 mov      dword ptr [rdi + 0x10], r12d
000000014043d484  488b7608                 mov      rsi, qword ptr [rsi + 8]
000000014043d488  488d8588000000           lea      rax, [rbp + 0x88]
000000014043d48f  483bf0                   cmp      rsi, rax
000000014043d492  0f8574ffffff             jne      0x14043d40c
000000014043d498  488d8d88000000           lea      rcx, [rbp + 0x88]
000000014043d49f  e8bcc8dcff               call     0x140209d60
000000014043d4a4  8b5d68                   mov      ebx, dword ptr [rbp + 0x68]
000000014043d4a7  4c897570                 mov      qword ptr [rbp + 0x70], r14
000000014043d4ab  488d4568                 lea      rax, [rbp + 0x68]
000000014043d4af  48894578                 mov      qword ptr [rbp + 0x78], rax
000000014043d4b3  488d05eef1e602           lea      rax, [rip + 0x2e6f1ee] ; 0x1432ac6a8
000000014043d4ba  48894510                 mov      qword ptr [rbp + 0x10], rax
000000014043d4be  0f104570                 movups   xmm0, xmmword ptr [rbp + 0x70]
000000014043d4c2  f30f7f4518               movdqu   xmmword ptr [rbp + 0x18], xmm0
000000014043d4c7  488d4510                 lea      rax, [rbp + 0x10]
000000014043d4cb  48894548                 mov      qword ptr [rbp + 0x48], rax
000000014043d4cf  488d4510                 lea      rax, [rbp + 0x10]
000000014043d4d3  4889442428               mov      qword ptr [rsp + 0x28], rax
000000014043d4d8  4c896c2420               mov      qword ptr [rsp + 0x20], r13
000000014043d4dd  4533c9                   xor      r9d, r9d
000000014043d4e0  448bc3                   mov      r8d, ebx
000000014043d4e3  418d5103                 lea      edx, [r9 + 3]
000000014043d4e7  488b0dd241bc03           mov      rcx, qword ptr [rip + 0x3bc41d2] ; 0x1440016c0
000000014043d4ee  e8490b0400               call     0x14047e03c
000000014043d4f3  4c896d58                 mov      qword ptr [rbp + 0x58], r13
000000014043d4f7  4c896d60                 mov      qword ptr [rbp + 0x60], r13
000000014043d4fb  4c89adc0000000           mov      qword ptr [rbp + 0xc0], r13
000000014043d502  488d4560                 lea      rax, [rbp + 0x60]
000000014043d506  48898598000000           mov      qword ptr [rbp + 0x98], rax
000000014043d50d  488d85c0000000           lea      rax, [rbp + 0xc0]
000000014043d514  488985a0000000           mov      qword ptr [rbp + 0xa0], rax
000000014043d51b  448b4568                 mov      r8d, dword ptr [rbp + 0x68]
000000014043d51f  448985a8000000           mov      dword ptr [rbp + 0xa8], r8d
000000014043d526  488d4558                 lea      rax, [rbp + 0x58]
000000014043d52a  488985b0000000           mov      qword ptr [rbp + 0xb0], rax
000000014043d531  418b8680010000           mov      eax, dword ptr [r14 + 0x180]
000000014043d538  8985b8000000             mov      dword ptr [rbp + 0xb8], eax
000000014043d53e  488d0593f1e602           lea      rax, [rip + 0x2e6f193] ; 0x1432ac6d8
000000014043d545  4889442450               mov      qword ptr [rsp + 0x50], rax
000000014043d54a  0f108598000000           movups   xmm0, xmmword ptr [rbp + 0x98]
000000014043d551  0f11442458               movups   xmmword ptr [rsp + 0x58], xmm0
000000014043d556  0f108da8000000           movups   xmm1, xmmword ptr [rbp + 0xa8]
000000014043d55d  0f114c2468               movups   xmmword ptr [rsp + 0x68], xmm1
000000014043d562  f20f1085b8000000         movsd    xmm0, qword ptr [rbp + 0xb8]
000000014043d56a  f20f11442478             movsd    qword ptr [rsp + 0x78], xmm0
000000014043d570  488d442450               lea      rax, [rsp + 0x50]
000000014043d575  48894588                 mov      qword ptr [rbp - 0x78], rax
000000014043d579  488d442450               lea      rax, [rsp + 0x50]
000000014043d57e  4889442428               mov      qword ptr [rsp + 0x28], rax
000000014043d583  4c896c2420               mov      qword ptr [rsp + 0x20], r13
000000014043d588  4533c9                   xor      r9d, r9d
000000014043d58b  33d2                     xor      edx, edx
000000014043d58d  488b0d2c41bc03           mov      rcx, qword ptr [rip + 0x3bc412c] ; 0x1440016c0
000000014043d594  e8a30a0400               call     0x14047e03c
000000014043d599  48635568                 movsxd   rdx, dword ptr [rbp + 0x68]
000000014043d59d  488bca                   mov      rcx, rdx
000000014043d5a0  488d4203                 lea      rax, [rdx + 3]
000000014043d5a4  4803c0                   add      rax, rax
000000014043d5a7  498b1cc6                 mov      rbx, qword ptr [r14 + rax*8]
000000014043d5ab  48c1e104                 shl      rcx, 4
000000014043d5af  498d4628                 lea      rax, [r14 + 0x28]
000000014043d5b3  4803c1                   add      rax, rcx
000000014043d5b6  eb28                     jmp      0x14043d5e0
000000014043d5b8  4533c0                   xor      r8d, r8d
000000014043d5bb  418b9680010000           mov      edx, dword ptr [r14 + 0x180]
000000014043d5c2  488bcb                   mov      rcx, rbx
000000014043d5c5  e8ded9ffff               call     0x14043afa8
000000014043d5ca  488b5b08                 mov      rbx, qword ptr [rbx + 8]
000000014043d5ce  48635568                 movsxd   rdx, dword ptr [rbp + 0x68]
000000014043d5d2  488bc2                   mov      rax, rdx
000000014043d5d5  48c1e004                 shl      rax, 4
000000014043d5d9  4883c028                 add      rax, 0x28
000000014043d5dd  4903c6                   add      rax, r14
000000014043d5e0  483bd8                   cmp      rbx, rax
000000014043d5e3  75d3                     jne      0x14043d5b8
000000014043d5e5  4c8b4558                 mov      r8, qword ptr [rbp + 0x58]
000000014043d5e9  4d85c0                   test     r8, r8
000000014043d5ec  7422                     je       0x14043d610
000000014043d5ee  4863c2                   movsxd   rax, edx
000000014043d5f1  48c1e004                 shl      rax, 4
000000014043d5f5  498d4e28                 lea      rcx, [r14 + 0x28]
000000014043d5f9  4803c8                   add      rcx, rax
000000014043d5fc  488b01                   mov      rax, qword ptr [rcx]
000000014043d5ff  4c894008                 mov      qword ptr [rax + 8], r8
000000014043d603  498900                   mov      qword ptr [r8], rax
000000014043d606  49894808                 mov      qword ptr [r8 + 8], rcx
000000014043d60a  4c8901                   mov      qword ptr [rcx], r8
000000014043d60d  8b5568                   mov      edx, dword ptr [rbp + 0x68]
000000014043d610  4863ca                   movsxd   rcx, edx
000000014043d613  48c1e104                 shl      rcx, 4
000000014043d617  498d5e28                 lea      rbx, [r14 + 0x28]
000000014043d61b  4803d9                   add      rbx, rcx
000000014043d61e  41f6868001000002         test     byte ptr [r14 + 0x180], 2
000000014043d626  0f8513010000             jne      0x14043d73f
000000014043d62c  4c8b7b08                 mov      r15, qword ptr [rbx + 8]
000000014043d630  4c3bfb                   cmp      r15, rbx
000000014043d633  0f8406010000             je       0x14043d73f
000000014043d639  418bc4                   mov      eax, r12d
000000014043d63c  4533f6                   xor      r14d, r14d
000000014043d63f  89442430                 mov      dword ptr [rsp + 0x30], eax
000000014043d643  498bf7                   mov      rsi, r15
000000014043d646  4c8bfb                   mov      r15, rbx
000000014043d649  488bcb                   mov      rcx, rbx
000000014043d64c  48895d50                 mov      qword ptr [rbp + 0x50], rbx
000000014043d650  458bc6                   mov      r8d, r14d
000000014043d653  483bf3                   cmp      rsi, rbx
000000014043d656  0f84a9000000             je       0x14043d705
000000014043d65c  4503c4                   add      r8d, r12d
000000014043d65f  4489442438               mov      dword ptr [rsp + 0x38], r8d
000000014043d664  488bfe                   mov      rdi, rsi
000000014043d667  458be6                   mov      r12d, r14d
000000014043d66a  418bd6                   mov      edx, r14d
000000014043d66d  85c0                     test     eax, eax
000000014043d66f  7e12                     jle      0x14043d683
000000014043d671  41ffc4                   inc      r12d
000000014043d674  488b7f08                 mov      rdi, qword ptr [rdi + 8]
000000014043d678  483bfb                   cmp      rdi, rbx
000000014043d67b  7406                     je       0x14043d683
000000014043d67d  ffc2                     inc      edx
000000014043d67f  3bd0                     cmp      edx, eax
000000014043d681  7cee                     jl       0x14043d671
000000014043d683  448be8                   mov      r13d, eax
000000014043d686  4585e4                   test     r12d, r12d
000000014043d689  7f1b                     jg       0x14043d6a6
000000014043d68b  4585ed                   test     r13d, r13d
000000014043d68e  7e5a                     jle      0x14043d6ea
000000014043d690  483bfb                   cmp      rdi, rbx
000000014043d693  7455                     je       0x14043d6ea
000000014043d695  4585e4                   test     r12d, r12d
000000014043d698  750c                     jne      0x14043d6a6
000000014043d69a  488bc7                   mov      rax, rdi
000000014043d69d  488b7f08                 mov      rdi, qword ptr [rdi + 8]
000000014043d6a1  41ffcd                   dec      r13d
000000014043d6a4  eb27                     jmp      0x14043d6cd
000000014043d6a6  4585ed                   test     r13d, r13d
000000014043d6a9  7418                     je       0x14043d6c3
000000014043d6ab  483bfb                   cmp      rdi, rbx
000000014043d6ae  7413                     je       0x14043d6c3
000000014043d6b0  488bd7                   mov      rdx, rdi
000000014043d6b3  488bce                   mov      rcx, rsi
000000014043d6b6  e8bdf6ffff               call     0x14043cd78
000000014043d6bb  488b4d50                 mov      rcx, qword ptr [rbp + 0x50]
000000014043d6bf  84c0                     test     al, al
000000014043d6c1  74d7                     je       0x14043d69a
000000014043d6c3  488bc6                   mov      rax, rsi
000000014043d6c6  41ffcc                   dec      r12d
000000014043d6c9  488b7608                 mov      rsi, qword ptr [rsi + 8]
000000014043d6cd  483bcb                   cmp      rcx, rbx
000000014043d6d0  7409                     je       0x14043d6db
000000014043d6d2  48894108                 mov      qword ptr [rcx + 8], rax
000000014043d6d6  488908                   mov      qword ptr [rax], rcx
000000014043d6d9  eb06                     jmp      0x14043d6e1
000000014043d6db  4c8bf8                   mov      r15, rax
000000014043d6de  488918                   mov      qword ptr [rax], rbx
000000014043d6e1  488bc8                   mov      rcx, rax
000000014043d6e4  48894550                 mov      qword ptr [rbp + 0x50], rax
000000014043d6e8  eb9c                     jmp      0x14043d686
000000014043d6ea  488bf7                   mov      rsi, rdi
000000014043d6ed  483bfb                   cmp      rdi, rbx
000000014043d6f0  8b442430                 mov      eax, dword ptr [rsp + 0x30]
000000014043d6f4  448b442438               mov      r8d, dword ptr [rsp + 0x38]
000000014043d6f9  41bc01000000             mov      r12d, 1
000000014043d6ff  0f8557ffffff             jne      0x14043d65c
000000014043d705  48895908                 mov      qword ptr [rcx + 8], rbx
000000014043d709  453bc4                   cmp      r8d, r12d
000000014043d70c  7e07                     jle      0x14043d715
000000014043d70e  03c0                     add      eax, eax
000000014043d710  e92affffff               jmp      0x14043d63f
000000014043d715  498bcf                   mov      rcx, r15
000000014043d718  498b4708                 mov      rax, qword ptr [r15 + 8]
000000014043d71c  4c8b742440               mov      r14, qword ptr [rsp + 0x40]
000000014043d721  eb07                     jmp      0x14043d72a
000000014043d723  488bc8                   mov      rcx, rax
000000014043d726  488b4008                 mov      rax, qword ptr [rax + 8]
000000014043d72a  483bc3                   cmp      rax, rbx
000000014043d72d  75f4                     jne      0x14043d723
000000014043d72f  48890b                   mov      qword ptr [rbx], rcx
000000014043d732  49891f                   mov      qword ptr [r15], rbx
000000014043d735  4c897b08                 mov      qword ptr [rbx + 8], r15
000000014043d739  8b5568                   mov      edx, dword ptr [rbp + 0x68]
000000014043d73c  4533ed                   xor      r13d, r13d
000000014043d73f  4863ca                   movsxd   rcx, edx
000000014043d742  488d4103                 lea      rax, [rcx + 3]
000000014043d746  4803c0                   add      rax, rax
000000014043d749  4d8b3cc6                 mov      r15, qword ptr [r14 + rax*8]
000000014043d74d  4803c9                   add      rcx, rcx
000000014043d750  4d8d1cce                 lea      r11, [r14 + rcx*8]
000000014043d754  498d4328                 lea      rax, [r11 + 0x28]
000000014043d758  4c3bf8                   cmp      r15, rax
000000014043d75b  0f849b020000             je       0x14043d9fc
000000014043d761  4183ccff                 or       r12d, 0xffffffff
000000014043d765  41837f1002               cmp      dword ptr [r15 + 0x10], 2
000000014043d76a  0f8c6b020000             jl       0x14043d9db
000000014043d770  418bb750040000           mov      esi, dword ptr [r15 + 0x450]
000000014043d777  448bc6                   mov      r8d, esi
000000014043d77a  498bce                   mov      rcx, r14
000000014043d77d  e84e050000               call     0x14043dcd0
000000014043d782  4885c0                   test     rax, rax
000000014043d785  741e                     je       0x14043d7a5
000000014043d787  418b771c                 mov      esi, dword ptr [r15 + 0x1c]
000000014043d78b  488db838010000           lea      rdi, [rax + 0x138]
000000014043d792  8b1f                     mov      ebx, dword ptr [rdi]
000000014043d794  488bcf                   mov      rcx, rdi
000000014043d797  e83c680000               call     0x140443fd8
000000014043d79c  488b4708                 mov      rax, qword ptr [rdi + 8]
000000014043d7a0  e930020000               jmp      0x14043d9d5
000000014043d7a5  498d9b98000000           lea      rbx, [r11 + 0x98]
000000014043d7ac  b948010000               mov      ecx, 0x148
000000014043d7b1  e83e294f00               call     0x1409300f4
000000014043d7b6  488bf8                   mov      rdi, rax
000000014043d7b9  4889442440               mov      qword ptr [rsp + 0x40], rax
000000014043d7be  4885c0                   test     rax, rax
000000014043d7c1  0f8403010000             je       0x14043d8ca
000000014043d7c7  488900                   mov      qword ptr [rax], rax
000000014043d7ca  48894008                 mov      qword ptr [rax + 8], rax
000000014043d7ce  83c8ff                   or       eax, 0xffffffff
000000014043d7d1  894710                   mov      dword ptr [rdi + 0x10], eax
000000014043d7d4  894714                   mov      dword ptr [rdi + 0x14], eax
000000014043d7d7  488d4f18                 lea      rcx, [rdi + 0x18]
000000014043d7db  488909                   mov      qword ptr [rcx], rcx
000000014043d7de  48894908                 mov      qword ptr [rcx + 8], rcx
000000014043d7e2  48c7411004030201         mov      qword ptr [rcx + 0x10], 0x1020304
000000014043d7ea  4c8d05efeae302           lea      r8, [rip + 0x2e3eaef] ; 0x14327c2e0
000000014043d7f1  4c894118                 mov      qword ptr [rcx + 0x18], r8
000000014043d7f5  4c896920                 mov      qword ptr [rcx + 0x20], r13
000000014043d7f9  44896128                 mov      dword ptr [rcx + 0x28], r12d
000000014043d7fd  4489612c                 mov      dword ptr [rcx + 0x2c], r12d
000000014043d801  488d4748                 lea      rax, [rdi + 0x48]
000000014043d805  488900                   mov      qword ptr [rax], rax
000000014043d808  48894008                 mov      qword ptr [rax + 8], rax
000000014043d80c  48c7401004030201         mov      qword ptr [rax + 0x10], 0x1020304
000000014043d814  4c894018                 mov      qword ptr [rax + 0x18], r8
000000014043d818  4c896820                 mov      qword ptr [rax + 0x20], r13
000000014043d81c  44896028                 mov      dword ptr [rax + 0x28], r12d
000000014043d820  4489602c                 mov      dword ptr [rax + 0x2c], r12d
000000014043d824  488d4778                 lea      rax, [rdi + 0x78]
000000014043d828  488900                   mov      qword ptr [rax], rax
000000014043d82b  48894008                 mov      qword ptr [rax + 8], rax
000000014043d82f  48c7401004030201         mov      qword ptr [rax + 0x10], 0x1020304
000000014043d837  4c894018                 mov      qword ptr [rax + 0x18], r8
000000014043d83b  4c896820                 mov      qword ptr [rax + 0x20], r13
000000014043d83f  44896028                 mov      dword ptr [rax + 0x28], r12d
000000014043d843  4489602c                 mov      dword ptr [rax + 0x2c], r12d
000000014043d847  488d87a8000000           lea      rax, [rdi + 0xa8]
000000014043d84e  488900                   mov      qword ptr [rax], rax
000000014043d851  48894008                 mov      qword ptr [rax + 8], rax
000000014043d855  48c7401004030201         mov      qword ptr [rax + 0x10], 0x1020304
000000014043d85d  4c894018                 mov      qword ptr [rax + 0x18], r8
000000014043d861  4c896820                 mov      qword ptr [rax + 0x20], r13
000000014043d865  44896028                 mov      dword ptr [rax + 0x28], r12d
000000014043d869  4489602c                 mov      dword ptr [rax + 0x2c], r12d
000000014043d86d  488d87d8000000           lea      rax, [rdi + 0xd8]
000000014043d874  488900                   mov      qword ptr [rax], rax
000000014043d877  48894008                 mov      qword ptr [rax + 8], rax
000000014043d87b  48c7401004030201         mov      qword ptr [rax + 0x10], 0x1020304
000000014043d883  4c894018                 mov      qword ptr [rax + 0x18], r8
000000014043d887  4c896820                 mov      qword ptr [rax + 0x20], r13
000000014043d88b  44896028                 mov      dword ptr [rax + 0x28], r12d
000000014043d88f  4489602c                 mov      dword ptr [rax + 0x2c], r12d
000000014043d893  488d8708010000           lea      rax, [rdi + 0x108]
000000014043d89a  488900                   mov      qword ptr [rax], rax
000000014043d89d  48894008                 mov      qword ptr [rax + 8], rax
000000014043d8a1  48c7401004030201         mov      qword ptr [rax + 0x10], 0x1020304
000000014043d8a9  4c894018                 mov      qword ptr [rax + 0x18], r8
000000014043d8ad  4c896820                 mov      qword ptr [rax + 0x20], r13
000000014043d8b1  44896028                 mov      dword ptr [rax + 0x28], r12d
000000014043d8b5  4489602c                 mov      dword ptr [rax + 0x2c], r12d
000000014043d8b9  4c89af40010000           mov      qword ptr [rdi + 0x140], r13
000000014043d8c0  4883a73801000000         and      qword ptr [rdi + 0x138], 0
000000014043d8c8  eb03                     jmp      0x14043d8cd
000000014043d8ca  498bfd                   mov      rdi, r13
000000014043d8cd  488b03                   mov      rax, qword ptr [rbx]
000000014043d8d0  48897808                 mov      qword ptr [rax + 8], rdi
000000014043d8d4  488907                   mov      qword ptr [rdi], rax
000000014043d8d7  48895f08                 mov      qword ptr [rdi + 8], rbx
000000014043d8db  48893b                   mov      qword ptr [rbx], rdi
000000014043d8de  448b6568                 mov      r12d, dword ptr [rbp + 0x68]
000000014043d8e2  83fe1b                   cmp      esi, 0x1b
000000014043d8e5  0f878e000000             ja       0x14043d979
000000014043d8eb  418bcc                   mov      ecx, r12d
000000014043d8ee  e89533ddff               call     0x140210c88
000000014043d8f3  8bc8                     mov      ecx, eax
000000014043d8f5  e88a34ddff               call     0x140210d84
000000014043d8fa  448bc0                   mov      r8d, eax
000000014043d8fd  4533c9                   xor      r9d, r9d
000000014043d900  8bd6                     mov      edx, esi
000000014043d902  488b0d3733bc03           mov      rcx, qword ptr [rip + 0x3bc3337] ; 0x144000c40
000000014043d909  e80a2eddff               call     0x140210718
000000014043d90e  488bd8                   mov      rbx, rax
000000014043d911  4885c0                   test     rax, rax
000000014043d914  7463                     je       0x14043d979
000000014043d916  488d4f18                 lea      rcx, [rdi + 0x18]
000000014043d91a  488b5020                 mov      rdx, qword ptr [rax + 0x20]
000000014043d91e  e83d501600               call     0x1405a2960
000000014043d923  488d4f48                 lea      rcx, [rdi + 0x48]
000000014043d927  488b5350                 mov      rdx, qword ptr [rbx + 0x50]
000000014043d92b  e830501600               call     0x1405a2960
000000014043d930  488d4f78                 lea      rcx, [rdi + 0x78]
000000014043d934  488b93e0000000           mov      rdx, qword ptr [rbx + 0xe0]
000000014043d93b  e820501600               call     0x1405a2960
000000014043d940  488d8fa8000000           lea      rcx, [rdi + 0xa8]
000000014043d947  488b93b0000000           mov      rdx, qword ptr [rbx + 0xb0]
000000014043d94e  e80d501600               call     0x1405a2960
000000014043d953  488d8fd8000000           lea      rcx, [rdi + 0xd8]
000000014043d95a  488b9380000000           mov      rdx, qword ptr [rbx + 0x80]
000000014043d961  e8fa4f1600               call     0x1405a2960
000000014043d966  488d8f08010000           lea      rcx, [rdi + 0x108]
000000014043d96d  488b9310010000           mov      rdx, qword ptr [rbx + 0x110]
000000014043d974  e8e74f1600               call     0x1405a2960
000000014043d979  897714                   mov      dword ptr [rdi + 0x14], esi
000000014043d97c  44896710                 mov      dword ptr [rdi + 0x10], r12d
000000014043d980  83feff                   cmp      esi, -1
000000014043d983  752f                     jne      0x14043d9b4
000000014043d985  48634568                 movsxd   rax, dword ptr [rbp + 0x68]
000000014043d989  4803c0                   add      rax, rax
000000014043d98c  498b8cc698000000         mov      rcx, qword ptr [r14 + rax*8 + 0x98]
000000014043d994  488b11                   mov      rdx, qword ptr [rcx]
000000014043d997  488b4108                 mov      rax, qword ptr [rcx + 8]
000000014043d99b  48894208                 mov      qword ptr [rdx + 8], rax
000000014043d99f  488910                   mov      qword ptr [rax], rdx
000000014043d9a2  488909                   mov      qword ptr [rcx], rcx
000000014043d9a5  48894908                 mov      qword ptr [rcx + 8], rcx
000000014043d9a9  e88a000000               call     0x14043da38
000000014043d9ae  4183ccff                 or       r12d, 0xffffffff
000000014043d9b2  eb24                     jmp      0x14043d9d8
000000014043d9b4  418b771c                 mov      esi, dword ptr [r15 + 0x1c]
000000014043d9b8  8b9f38010000             mov      ebx, dword ptr [rdi + 0x138]
000000014043d9be  488d8f38010000           lea      rcx, [rdi + 0x138]
000000014043d9c5  e80e660000               call     0x140443fd8
000000014043d9ca  488b8740010000           mov      rax, qword ptr [rdi + 0x140]
000000014043d9d1  4183ccff                 or       r12d, 0xffffffff
000000014043d9d5  893498                   mov      dword ptr [rax + rbx*4], esi
000000014043d9d8  8b5568                   mov      edx, dword ptr [rbp + 0x68]
000000014043d9db  4d8b7f08                 mov      r15, qword ptr [r15 + 8]
000000014043d9df  4c63da                   movsxd   r11, edx
000000014043d9e2  49c1e304                 shl      r11, 4
000000014043d9e6  4d03de                   add      r11, r14
000000014043d9e9  498d4328                 lea      rax, [r11 + 0x28]
000000014043d9ed  4c3bf8                   cmp      r15, rax
000000014043d9f0  0f856ffdffff             jne      0x14043d765
000000014043d9f6  41bc01000000             mov      r12d, 1
000000014043d9fc  4863c2                   movsxd   rax, edx
000000014043d9ff  4688a43078010000         mov      byte ptr [rax + r14 + 0x178], r12b
000000014043da07  488b8dc8000000           mov      rcx, qword ptr [rbp + 0xc8]
000000014043da0e  4833cc                   xor      rcx, rsp
000000014043da11  e8ba5a2102               call     0x1426534d0
000000014043da16  4c8d9c24e0010000         lea      r11, [rsp + 0x1e0]
000000014043da1e  498b5b50                 mov      rbx, qword ptr [r11 + 0x50]
000000014043da22  410f2873f0               movaps   xmm6, xmmword ptr [r11 - 0x10]
000000014043da27  498be3                   mov      rsp, r11
000000014043da2a  415f                     pop      r15
000000014043da2c  415e                     pop      r14
000000014043da2e  415d                     pop      r13
000000014043da30  415c                     pop      r12
000000014043da32  5f                       pop      rdi
000000014043da33  5e                       pop      rsi
000000014043da34  5d                       pop      rbp
000000014043da35  c3                       ret      
