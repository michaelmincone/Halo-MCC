; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
; Bounded leaf view through first RET; no PE unwind entry.
; Direct branches remain within decoded view; no execution observed.
00000001804a5484 8b158e267700               mov edx, dword ptr [rip + 0x77268e] ; 0x180c17b18
00000001804a548a 0f57d2                     xorps xmm2, xmm2
00000001804a548d 65488b042558000000         mov rax, qword ptr gs:[0x58]
00000001804a5496 f30f10057a5a5e00           movss xmm0, dword ptr [rip + 0x5e5a7a] ; 0x180a8af18
00000001804a549e 0fb7c9                     movzx ecx, cx
00000001804a54a1 41b810000000               mov r8d, 0x10
00000001804a54a7 488b04d0                   mov rax, qword ptr [rax + rdx*8]
00000001804a54ab 488d1449                   lea rdx, [rcx + rcx*2]
00000001804a54af 4e8b0400                   mov r8, qword ptr [rax + r8]
00000001804a54b3 498b4050                   mov rax, qword ptr [r8 + 0x50]
00000001804a54b7 4c8b44d010                 mov r8, qword ptr [rax + rdx*8 + 0x10]
00000001804a54bc 488b053d517700             mov rax, qword ptr [rip + 0x77513d] ; 0x180c1a600
00000001804a54c3 410fb708                   movzx ecx, word ptr [r8]
00000001804a54c7 8b54c804                   mov edx, dword ptr [rax + rcx*8 + 4]
00000001804a54cb 488d0d4e4a9904             lea rcx, [rip + 0x4994a4e] ; 0x184e39f20
00000001804a54d2 8bc2                       mov eax, edx
00000001804a54d4 48c1e81c                   shr rax, 0x1c
00000001804a54d8 488b04c1                   mov rax, qword ptr [rcx + rax*8]
00000001804a54dc f30f108c9068060000         movss xmm1, dword ptr [rax + rdx*4 + 0x668]
00000001804a54e5 0f2fca                     comiss xmm1, xmm2
00000001804a54e8 7603                       jbe 0x1804a54ed
00000001804a54ea 0f28c1                     movaps xmm0, xmm1
00000001804a54ed f3410f1088b40d0000         movss xmm1, dword ptr [r8 + 0xdb4]
00000001804a54f6 0f2fca                     comiss xmm1, xmm2
00000001804a54f9 7604                       jbe 0x1804a54ff
00000001804a54fb f30f59c1                   mulss xmm0, xmm1
00000001804a54ff c3                         ret 
