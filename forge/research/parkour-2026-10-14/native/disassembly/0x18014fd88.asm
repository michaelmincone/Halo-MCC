; PE exception-table range 0x18014fd88..0x18014fdf0 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018014fd88  4053                     push     rbx
000000018014fd8a  4883ec20                 sub      rsp, 0x20
000000018014fd8e  8b0d847dac00             mov      ecx, dword ptr [rip + 0xac7d84] ; 0x180c17b18
000000018014fd94  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018014fd9d  bb30030000               mov      ebx, 0x330
000000018014fda2  488b04c8                 mov      rax, qword ptr [rax + rcx*8]
000000018014fda6  488b1c03                 mov      rbx, qword ptr [rbx + rax]
000000018014fdaa  c703f57a8540             mov      dword ptr [rbx], 0x40857af5
000000018014fdb0  c743040000803f           mov      dword ptr [rbx + 4], 0x3f800000
000000018014fdb7  c74308e02d903a           mov      dword ptr [rbx + 8], 0x3a902de0
000000018014fdbe  83631800                 and      dword ptr [rbx + 0x18], 0
000000018014fdc2  f20f100526fd8300         movsd    xmm0, qword ptr [rip + 0x83fd26] ; 0x18098faf0
000000018014fdca  f20f11430c               movsd    qword ptr [rbx + 0xc], xmm0
000000018014fdcf  8b0523fd8300             mov      eax, dword ptr [rip + 0x83fd23] ; 0x18098faf8
000000018014fdd5  f30f1005e3af9300         movss    xmm0, dword ptr [rip + 0x93afe3] ; 0x180a8adc0
000000018014fddd  894314                   mov      dword ptr [rbx + 0x14], eax
000000018014fde0  e865a37c00               call     0x18091a14a
000000018014fde5  f30f11431c               movss    dword ptr [rbx + 0x1c], xmm0
000000018014fdea  4883c420                 add      rsp, 0x20
000000018014fdee  5b                       pop      rbx
000000018014fdef  c3                       ret      
