; PE exception-table range 0x1803490e0..0x18034931f (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
00000001803490e0  488bc4                   mov      rax, rsp
00000001803490e3  48895808                 mov      qword ptr [rax + 8], rbx
00000001803490e7  48896810                 mov      qword ptr [rax + 0x10], rbp
00000001803490eb  48897018                 mov      qword ptr [rax + 0x18], rsi
00000001803490ef  48897820                 mov      qword ptr [rax + 0x20], rdi
00000001803490f3  4156                     push     r14
00000001803490f5  4881ecf0010000           sub      rsp, 0x1f0
00000001803490fc  488b050d0f7b00           mov      rax, qword ptr [rip + 0x7b0f0d] ; 0x180afa010
0000000180349103  4833c4                   xor      rax, rsp
0000000180349106  48898424e0010000         mov      qword ptr [rsp + 0x1e0], rax
000000018034910e  838920610100ff           or       dword ptr [rcx + 0x16120], 0xffffffff
0000000180349115  488bf9                   mov      rdi, rcx
0000000180349118  e8a7bc0300               call     0x180384dc4
000000018034911d  83bfa400000000           cmp      dword ptr [rdi + 0xa4], 0
0000000180349124  0f85c7010000             jne      0x1803492f1
000000018034912a  488db7af000000           lea      rsi, [rdi + 0xaf]
0000000180349131  4883e6f8                 and      rsi, 0xfffffffffffffff8
0000000180349135  83be30840000ff           cmp      dword ptr [rsi + 0x8430], -1
000000018034913c  0f84af010000             je       0x1803492f1
0000000180349142  8b8634840000             mov      eax, dword ptr [rsi + 0x8434]
0000000180349148  f0830c2400               lock or  dword ptr [rsp], 0
000000018034914d  85c0                     test     eax, eax
000000018034914f  0f849c010000             je       0x1803492f1
0000000180349155  8b863c840000             mov      eax, dword ptr [rsi + 0x843c]
000000018034915b  85c0                     test     eax, eax
000000018034915d  410f95c6                 setne    r14b
0000000180349161  85c0                     test     eax, eax
0000000180349163  0f84fd000000             je       0x180349266
0000000180349169  488d9f68850000           lea      rbx, [rdi + 0x8568]
0000000180349170  c644244000               mov      byte ptr [rsp + 0x40], 0
0000000180349175  4c8bc3                   mov      r8, rbx
0000000180349178  488d8eb4010000           lea      rcx, [rsi + 0x1b4]
000000018034917f  4c8d4c2440               lea      r9, [rsp + 0x40]
0000000180349184  ba29730000               mov      edx, 0x7329
0000000180349189  e8721de3ff               call     0x18017af00
000000018034918e  84c0                     test     al, al
0000000180349190  0f84a2000000             je       0x180349238
0000000180349196  807c244000               cmp      byte ptr [rsp + 0x40], 0
000000018034919b  0f8497000000             je       0x180349238
00000001803491a1  488daef4010000           lea      rbp, [rsi + 0x1f4]
00000001803491a8  488bd3                   mov      rdx, rbx
00000001803491ab  488bcd                   mov      rcx, rbp
00000001803491ae  e8a998dbff               call     0x180102a5c
00000001803491b3  84c0                     test     al, al
00000001803491b5  750b                     jne      0x1803491c2
00000001803491b7  488bd5                   mov      rdx, rbp
00000001803491ba  488bcb                   mov      rcx, rbx
00000001803491bd  e89235d2ff               call     0x18006c754
00000001803491c2  0fbf972c610100           movsx    edx, word ptr [rdi + 0x1612c]
00000001803491c9  488d4c2450               lea      rcx, [rsp + 0x50]
00000001803491ce  4c8bc6                   mov      r8, rsi
00000001803491d1  e83ef2f5ff               call     0x1802a8414
00000001803491d6  ba03000000               mov      edx, 3
00000001803491db  488d8f245f0100           lea      rcx, [rdi + 0x15f24]
00000001803491e2  448d427d                 lea      r8d, [rdx + 0x7d]
00000001803491e6  0f1000                   movups   xmm0, xmmword ptr [rax]
00000001803491e9  0f1101                   movups   xmmword ptr [rcx], xmm0
00000001803491ec  0f104810                 movups   xmm1, xmmword ptr [rax + 0x10]
00000001803491f0  0f114910                 movups   xmmword ptr [rcx + 0x10], xmm1
00000001803491f4  0f104020                 movups   xmm0, xmmword ptr [rax + 0x20]
00000001803491f8  0f114120                 movups   xmmword ptr [rcx + 0x20], xmm0
00000001803491fc  0f104830                 movups   xmm1, xmmword ptr [rax + 0x30]
0000000180349200  0f114930                 movups   xmmword ptr [rcx + 0x30], xmm1
0000000180349204  0f104040                 movups   xmm0, xmmword ptr [rax + 0x40]
0000000180349208  0f114140                 movups   xmmword ptr [rcx + 0x40], xmm0
000000018034920c  0f104850                 movups   xmm1, xmmword ptr [rax + 0x50]
0000000180349210  0f114950                 movups   xmmword ptr [rcx + 0x50], xmm1
0000000180349214  0f104060                 movups   xmm0, xmmword ptr [rax + 0x60]
0000000180349218  0f114160                 movups   xmmword ptr [rcx + 0x60], xmm0
000000018034921c  4903c8                   add      rcx, r8
000000018034921f  0f104870                 movups   xmm1, xmmword ptr [rax + 0x70]
0000000180349223  4903c0                   add      rax, r8
0000000180349226  0f1149f0                 movups   xmmword ptr [rcx - 0x10], xmm1
000000018034922a  4883ea01                 sub      rdx, 1
000000018034922e  75b6                     jne      0x1803491e6
0000000180349230  488b00                   mov      rax, qword ptr [rax]
0000000180349233  488901                   mov      qword ptr [rcx], rax
0000000180349236  eb57                     jmp      0x18034928f
0000000180349238  0fbf872c610100           movsx    eax, word ptr [rdi + 0x1612c]
000000018034923f  488d0d8a626c02           lea      rcx, [rip + 0x26c628a] ; 0x182a0f4d0
0000000180349246  c644243001               mov      byte ptr [rsp + 0x30], 1
000000018034924b  4533c9                   xor      r9d, r9d
000000018034924e  c644242800               mov      byte ptr [rsp + 0x28], 0
0000000180349253  ba69001000               mov      edx, 0x100069
0000000180349258  89442420                 mov      dword ptr [rsp + 0x20], eax
000000018034925c  e817eff8ff               call     0x1802d8178
0000000180349261  4532f6                   xor      r14b, r14b
0000000180349264  eb29                     jmp      0x18034928f
0000000180349266  0fbf872c610100           movsx    eax, word ptr [rdi + 0x1612c]
000000018034926d  488d0d5c626c02           lea      rcx, [rip + 0x26c625c] ; 0x182a0f4d0
0000000180349274  c644243001               mov      byte ptr [rsp + 0x30], 1
0000000180349279  4533c9                   xor      r9d, r9d
000000018034927c  c644242800               mov      byte ptr [rsp + 0x28], 0
0000000180349281  ba9f001000               mov      edx, 0x10009f
0000000180349286  89442420                 mov      dword ptr [rsp + 0x20], eax
000000018034928a  e8e9eef8ff               call     0x1802d8178
000000018034928f  410fb6c6                 movzx    eax, r14b
0000000180349293  83f001                   xor      eax, 1
0000000180349296  059f002000               add      eax, 0x20009f
000000018034929b  898720610100             mov      dword ptr [rdi + 0x16120], eax
00000001803492a1  488b87f0840000           mov      rax, qword ptr [rdi + 0x84f0]
00000001803492a8  4885c0                   test     rax, rax
00000001803492ab  741f                     je       0x1803492cc
00000001803492ad  83680801                 sub      dword ptr [rax + 8], 1
00000001803492b1  7519                     jne      0x1803492cc
00000001803492b3  488b9ff0840000           mov      rbx, qword ptr [rdi + 0x84f0]
00000001803492ba  33d2                     xor      edx, edx
00000001803492bc  488bcb                   mov      rcx, rbx
00000001803492bf  488b03                   mov      rax, qword ptr [rbx]
00000001803492c2  ff10                     call     qword ptr [rax]
00000001803492c4  488bcb                   mov      rcx, rbx
00000001803492c7  e87cd5f5ff               call     0x1802a6848
00000001803492cc  4883a7f084000000         and      qword ptr [rdi + 0x84f0], 0
00000001803492d4  33d2                     xor      edx, edx
00000001803492d6  488b8e28840000           mov      rcx, qword ptr [rsi + 0x8428]
00000001803492dd  e81a77ffff               call     0x1803409fc
00000001803492e2  4883a62884000000         and      qword ptr [rsi + 0x8428], 0
00000001803492ea  838fa4000000ff           or       dword ptr [rdi + 0xa4], 0xffffffff
00000001803492f1  488b8c24e0010000         mov      rcx, qword ptr [rsp + 0x1e0]
00000001803492f9  4833cc                   xor      rcx, rsp
00000001803492fc  e8ffea4300               call     0x180787e00
0000000180349301  4c8d9c24f0010000         lea      r11, [rsp + 0x1f0]
0000000180349309  498b5b10                 mov      rbx, qword ptr [r11 + 0x10]
000000018034930d  498b6b18                 mov      rbp, qword ptr [r11 + 0x18]
0000000180349311  498b7320                 mov      rsi, qword ptr [r11 + 0x20]
0000000180349315  498b7b28                 mov      rdi, qword ptr [r11 + 0x28]
0000000180349319  498be3                   mov      rsp, r11
000000018034931c  415e                     pop      r14
000000018034931e  c3                       ret      
