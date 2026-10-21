; PE exception-table range 0x18019c604..0x18019c69f (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018019c604  4053                     push     rbx
000000018019c606  4883ec20                 sub      rsp, 0x20
000000018019c60a  480fbfc1                 movsx    rax, cx
000000018019c60e  8bda                     mov      ebx, edx
000000018019c610  458ac8                   mov      r9b, r8b
000000018019c613  488d0d26c78800           lea      rcx, [rip + 0x88c726] ; 0x180a28d40
000000018019c61a  488b0cc1                 mov      rcx, qword ptr [rcx + rax*8]
000000018019c61e  0fb75138                 movzx    edx, word ptr [rcx + 0x38]
000000018019c622  4c8d413a                 lea      r8, [rcx + 0x3a]
000000018019c626  8bcb                     mov      ecx, ebx
000000018019c628  e8bb9feeff               call     0x1800865e8
000000018019c62d  4885c0                   test     rax, rax
000000018019c630  7467                     je       0x18019c699
000000018019c632  8b15e0b4a700             mov      edx, dword ptr [rip + 0xa7b4e0] ; 0x180c17b18
000000018019c638  f30f1000                 movss    xmm0, dword ptr [rax]
000000018019c63c  f30f590558ec8e00         mulss    xmm0, dword ptr [rip + 0x8eec58] ; 0x180a8b29c
000000018019c644  65488b0c2558000000       mov      rcx, qword ptr gs:[0x58]
000000018019c64d  41b830030000             mov      r8d, 0x330
000000018019c653  488b0cd1                 mov      rcx, qword ptr [rcx + rdx*8]
000000018019c657  498b1408                 mov      rdx, qword ptr [r8 + rcx]
000000018019c65b  f30f100a                 movss    xmm1, dword ptr [rdx]
000000018019c65f  0f2ec1                   ucomiss  xmm0, xmm1
000000018019c662  f30f1102                 movss    dword ptr [rdx], xmm0
000000018019c666  7a02                     jp       0x18019c66a
000000018019c668  7426                     je       0x18019c690
000000018019c66a  c605a46f9f0001           mov      byte ptr [rip + 0x9f6fa4], 1 ; 0x180b93615
000000018019c671  e80ad4efff               call     0x180099a80
000000018019c676  c6059a6f9f0001           mov      byte ptr [rip + 0x9f6f9a], 1 ; 0x180b93617
000000018019c67d  e8d6ceefff               call     0x180099558
000000018019c682  c6058e6f9f0000           mov      byte ptr [rip + 0x9f6f8e], 0 ; 0x180b93617
000000018019c689  c605856f9f0000           mov      byte ptr [rip + 0x9f6f85], 0 ; 0x180b93615
000000018019c690  33d2                     xor      edx, edx
000000018019c692  8bcb                     mov      ecx, ebx
000000018019c694  e84797eeff               call     0x180085de0
000000018019c699  4883c420                 add      rsp, 0x20
000000018019c69d  5b                       pop      rbx
000000018019c69e  c3                       ret      
