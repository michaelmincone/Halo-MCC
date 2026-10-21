; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
; Explicit 256-byte bounded view from 0x1804a5484. Leaf extent unknown; subsequent functions may appear.
00000001804a5484 8b158e267700               mov edx, dword ptr [rip + 0x77268e]
00000001804a548a 0f57d2                     xorps xmm2, xmm2
00000001804a548d 65488b042558000000         mov rax, qword ptr gs:[0x58]
00000001804a5496 f30f10057a5a5e00           movss xmm0, dword ptr [rip + 0x5e5a7a]
00000001804a549e 0fb7c9                     movzx ecx, cx
00000001804a54a1 41b810000000               mov r8d, 0x10
00000001804a54a7 488b04d0                   mov rax, qword ptr [rax + rdx*8]
00000001804a54ab 488d1449                   lea rdx, [rcx + rcx*2]
00000001804a54af 4e8b0400                   mov r8, qword ptr [rax + r8]
00000001804a54b3 498b4050                   mov rax, qword ptr [r8 + 0x50]
00000001804a54b7 4c8b44d010                 mov r8, qword ptr [rax + rdx*8 + 0x10]
00000001804a54bc 488b053d517700             mov rax, qword ptr [rip + 0x77513d]
00000001804a54c3 410fb708                   movzx ecx, word ptr [r8]
00000001804a54c7 8b54c804                   mov edx, dword ptr [rax + rcx*8 + 4]
00000001804a54cb 488d0d4e4a9904             lea rcx, [rip + 0x4994a4e]
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
00000001804a5500 488bc4                     mov rax, rsp
00000001804a5503 48895808                   mov qword ptr [rax + 8], rbx
00000001804a5507 55                         push rbp
00000001804a5508 56                         push rsi
00000001804a5509 57                         push rdi
00000001804a550a 488bec                     mov rbp, rsp
00000001804a550d 4881ec80000000             sub rsp, 0x80
00000001804a5514 448b05fd257700             mov r8d, dword ptr [rip + 0x7725fd]
00000001804a551b 33db                       xor ebx, ebx
00000001804a551d 0f2970d8                   movaps xmmword ptr [rax - 0x28], xmm6
00000001804a5521 488bf2                     mov rsi, rdx
00000001804a5524 0f2978c8                   movaps xmmword ptr [rax - 0x38], xmm7
00000001804a5528 408afb                     mov dil, bl
00000001804a552b 440f2940b8                 movaps xmmword ptr [rax - 0x48], xmm8
00000001804a5530 440f2950a8                 movaps xmmword ptr [rax - 0x58], xmm10
00000001804a5535 440f295898                 movaps xmmword ptr [rax - 0x68], xmm11
00000001804a553a 65488b042558000000         mov rax, qword ptr gs:[0x58]
00000001804a5543 41b910000000               mov r9d, 0x10
00000001804a5549 0fb7c9                     movzx ecx, cx
00000001804a554c 4a8b04c0                   mov rax, qword ptr [rax + r8*8]
00000001804a5550 4c8d0449                   lea r8, [rcx + rcx*2]
00000001804a5554 4e8b0c08                   mov r9, qword ptr [rax + r9]
00000001804a5558 498b4150                   mov rax, qword ptr [r9 + 0x50]
00000001804a555c 4e8b54c010                 mov r10, qword ptr [rax + r8*8 + 0x10]
00000001804a5561 4d0fbf825a050000           movsx r8, word ptr [r10 + 0x55a]
00000001804a5569 490fbf928e010000           movsx rdx, word ptr [r10 + 0x18e]
00000001804a5571 4d03c2                     add r8, r10
00000001804a5574 450fb708                   movzx r9d, word ptr [r8]
00000001804a5578 418ac1                     mov al, r9b
00000001804a557b c0e805                     shr al, 5
00000001804a557e a801                       test al, 1
