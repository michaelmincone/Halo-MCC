; PE exception-table range 0x18019c588..0x18019c603 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018019c588  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018019c58d  57                       push     rdi
000000018019c58e  4883ec20                 sub      rsp, 0x20
000000018019c592  8b0d80b5a700             mov      ecx, dword ptr [rip + 0xa7b580] ; 0x180c17b18
000000018019c598  8bfa                     mov      edi, edx
000000018019c59a  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018019c5a3  bb30030000               mov      ebx, 0x330
000000018019c5a8  488b04c8                 mov      rax, qword ptr [rax + rcx*8]
000000018019c5ac  488b1c03                 mov      rbx, qword ptr [rbx + rax]
000000018019c5b0  c703f57a8540             mov      dword ptr [rbx], 0x40857af5
000000018019c5b6  c743040000803f           mov      dword ptr [rbx + 4], 0x3f800000
000000018019c5bd  c74308e02d903a           mov      dword ptr [rbx + 8], 0x3a902de0
000000018019c5c4  83631800                 and      dword ptr [rbx + 0x18], 0
000000018019c5c8  f20f100520357f00         movsd    xmm0, qword ptr [rip + 0x7f3520] ; 0x18098faf0
000000018019c5d0  f20f11430c               movsd    qword ptr [rbx + 0xc], xmm0
000000018019c5d5  8b051d357f00             mov      eax, dword ptr [rip + 0x7f351d] ; 0x18098faf8
000000018019c5db  f30f1005dde78e00         movss    xmm0, dword ptr [rip + 0x8ee7dd] ; 0x180a8adc0
000000018019c5e3  894314                   mov      dword ptr [rbx + 0x14], eax
000000018019c5e6  e85fdb7700               call     0x18091a14a
000000018019c5eb  33d2                     xor      edx, edx
000000018019c5ed  f30f11431c               movss    dword ptr [rbx + 0x1c], xmm0
000000018019c5f2  8bcf                     mov      ecx, edi
000000018019c5f4  488b5c2430               mov      rbx, qword ptr [rsp + 0x30]
000000018019c5f9  4883c420                 add      rsp, 0x20
000000018019c5fd  5f                       pop      rdi
000000018019c5fe  e9dd97eeff               jmp      0x180085de0
