; PE exception-table range 0x1803d3f58..0x1803d40ca (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
00000001803d3f58  488bc4                   mov      rax, rsp
00000001803d3f5b  48895808                 mov      qword ptr [rax + 8], rbx
00000001803d3f5f  48896810                 mov      qword ptr [rax + 0x10], rbp
00000001803d3f63  48897018                 mov      qword ptr [rax + 0x18], rsi
00000001803d3f67  48897820                 mov      qword ptr [rax + 0x20], rdi
00000001803d3f6b  4154                     push     r12
00000001803d3f6d  4156                     push     r14
00000001803d3f6f  4157                     push     r15
00000001803d3f71  4883ec20                 sub      rsp, 0x20
00000001803d3f75  488b742460               mov      rsi, qword ptr [rsp + 0x60]
00000001803d3f7a  4183ccff                 or       r12d, 0xffffffff
00000001803d3f7e  4d8bf0                   mov      r14, r8
00000001803d3f81  488bfa                   mov      rdi, rdx
00000001803d3f84  418bdc                   mov      ebx, r12d
00000001803d3f87  66443b6202               cmp      r12w, word ptr [rdx + 2]
00000001803d3f8c  7414                     je       0x1803d3fa2
00000001803d3f8e  e8597dc9ff               call     0x18006bcec
00000001803d3f93  0fbf5702                 movsx    edx, word ptr [rdi + 2]
00000001803d3f97  4c8bc6                   mov      r8, rsi
00000001803d3f9a  488bc8                   mov      rcx, rax
00000001803d3f9d  e87ea9c9ff               call     0x18006e920
00000001803d3fa2  e8c5770a00               call     0x18047b76c
00000001803d3fa7  8b570c                   mov      edx, dword ptr [rdi + 0xc]
00000001803d3faa  413bd4                   cmp      edx, r12d
00000001803d3fad  0f84f6000000             je       0x1803d40a9
00000001803d3fb3  b9656a626f               mov      ecx, 0x6f626a65
00000001803d3fb8  e82bdbc5ff               call     0x180031ae8
00000001803d3fbd  4885c0                   test     rax, rax
00000001803d3fc0  0f84e3000000             je       0x1803d40a9
00000001803d3fc6  0fb72f                   movzx    ebp, word ptr [rdi]
00000001803d3fc9  66443be5                 cmp      r12w, bp
00000001803d3fcd  740a                     je       0x1803d3fd9
00000001803d3fcf  488bcf                   mov      rcx, rdi
00000001803d3fd2  e8254a0000               call     0x1803d89fc
00000001803d3fd7  eb08                     jmp      0x1803d3fe1
00000001803d3fd9  488bce                   mov      rcx, rsi
00000001803d3fdc  e8ff960900               call     0x18046d6e0
00000001803d3fe1  8bd8                     mov      ebx, eax
00000001803d3fe3  413bc4                   cmp      eax, r12d
00000001803d3fe6  0f84bd000000             je       0x1803d40a9
00000001803d3fec  8b0d263b8400             mov      ecx, dword ptr [rip + 0x843b26] ; 0x180c17b18
00000001803d3ff2  65488b042558000000       mov      rax, qword ptr gs:[0x58]
00000001803d3ffb  41b810000000             mov      r8d, 0x10
00000001803d4001  488b04c8                 mov      rax, qword ptr [rax + rcx*8]
00000001803d4005  0fb7cb                   movzx    ecx, bx
00000001803d4008  4e8b0400                 mov      r8, qword ptr [rax + r8]
00000001803d400c  488d1449                 lea      rdx, [rcx + rcx*2]
00000001803d4010  498b4050                 mov      rax, qword ptr [r8 + 0x50]
00000001803d4014  4c8b7cd010               mov      r15, qword ptr [rax + rdx*8 + 0x10]
00000001803d4019  0fb74702                 movzx    eax, word ptr [rdi + 2]
00000001803d401d  664189471c               mov      word ptr [r15 + 0x1c], ax
00000001803d4022  66443be0                 cmp      r12w, ax
00000001803d4026  740f                     je       0x1803d4037
00000001803d4028  e8bf7cc9ff               call     0x18006bcec
00000001803d402d  8bd3                     mov      edx, ebx
00000001803d402f  488bc8                   mov      rcx, rax
00000001803d4032  e809b2c9ff               call     0x18006f240
00000001803d4037  4539a620010000           cmp      dword ptr [r14 + 0x120], r12d
00000001803d403e  741d                     je       0x1803d405d
00000001803d4040  4180be2601000000         cmp      byte ptr [r14 + 0x126], 0
00000001803d4048  7413                     je       0x1803d405d
00000001803d404a  44386705                 cmp      byte ptr [rdi + 5], r12b
00000001803d404e  740d                     je       0x1803d405d
00000001803d4050  4d8bce                   mov      r9, r14
00000001803d4053  4c8bc7                   mov      r8, rdi
00000001803d4056  8bd3                     mov      edx, ebx
00000001803d4058  e84f4b0000               call     0x1803d8bac
00000001803d405d  66443be5                 cmp      r12w, bp
00000001803d4061  750f                     jne      0x1803d4072
00000001803d4063  4c8d464c                 lea      r8, [rsi + 0x4c]
00000001803d4067  8bcb                     mov      ecx, ebx
00000001803d4069  488d5640                 lea      rdx, [rsi + 0x40]
00000001803d406d  e8f28c0900               call     0x18046cd64
00000001803d4072  f6470402                 test     byte ptr [rdi + 4], 2
00000001803d4076  7416                     je       0x1803d408e
00000001803d4078  83caff                   or       edx, 0xffffffff
00000001803d407b  8bcb                     mov      ecx, ebx
00000001803d407d  e84af90900               call     0x1804739cc
00000001803d4082  4885c0                   test     rax, rax
00000001803d4085  7407                     je       0x1803d408e
00000001803d4087  80884301000001           or       byte ptr [rax + 0x143], 1
00000001803d408e  66443be5                 cmp      r12w, bp
00000001803d4092  7415                     je       0x1803d40a9
00000001803d4094  f6470404                 test     byte ptr [rdi + 4], 4
00000001803d4098  740f                     je       0x1803d40a9
00000001803d409a  8bcb                     mov      ecx, ebx
00000001803d409c  e82fe3d4ff               call     0x1801223d0
00000001803d40a1  41808f0001000010         or       byte ptr [r15 + 0x100], 0x10
00000001803d40a9  488b6c2448               mov      rbp, qword ptr [rsp + 0x48]
00000001803d40ae  8bc3                     mov      eax, ebx
00000001803d40b0  488b5c2440               mov      rbx, qword ptr [rsp + 0x40]
00000001803d40b5  488b742450               mov      rsi, qword ptr [rsp + 0x50]
00000001803d40ba  488b7c2458               mov      rdi, qword ptr [rsp + 0x58]
00000001803d40bf  4883c420                 add      rsp, 0x20
00000001803d40c3  415f                     pop      r15
00000001803d40c5  415e                     pop      r14
00000001803d40c7  415c                     pop      r12
00000001803d40c9  c3                       ret      
