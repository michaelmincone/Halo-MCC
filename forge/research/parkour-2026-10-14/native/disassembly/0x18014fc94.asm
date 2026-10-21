; PE exception-table range 0x18014fc94..0x18014fd67 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018014fc94  4053                     push     rbx
000000018014fc96  4883ec40                 sub      rsp, 0x40
000000018014fc9a  488364243800             and      qword ptr [rsp + 0x38], 0
000000018014fca0  488d05cdffffff           lea      rax, [rip - 0x33] ; 0x18014fc74
000000018014fca7  488364243000             and      qword ptr [rsp + 0x30], 0
000000018014fcad  488d1514a38800           lea      rdx, [rip + 0x88a314] ; 0x1809d9fc8
000000018014fcb4  41b920000000             mov      r9d, 0x20
000000018014fcba  4889442428               mov      qword ptr [rsp + 0x28], rax
000000018014fcbf  8364242000               and      dword ptr [rsp + 0x20], 0
000000018014fcc4  4533c0                   xor      r8d, r8d
000000018014fcc7  418d49e4                 lea      ecx, [r9 - 0x1c]
000000018014fccb  e82c04f5ff               call     0x1800a00fc
000000018014fcd0  8b15427eac00             mov      edx, dword ptr [rip + 0xac7e42] ; 0x180c17b18
000000018014fcd6  65488b0c2558000000       mov      rcx, qword ptr gs:[0x58]
000000018014fcdf  89058363a400             mov      dword ptr [rip + 0xa46383], eax ; 0x180b96068
000000018014fce5  4898                     cdqe     
000000018014fce7  4c8b04d1                 mov      r8, qword ptr [rcx + rdx*8]
000000018014fceb  b928000000               mov      ecx, 0x28
000000018014fcf0  bae0060000               mov      edx, 0x6e0
000000018014fcf5  428b0c01                 mov      ecx, dword ptr [rcx + r8]
000000018014fcf9  4a8b540220               mov      rdx, qword ptr [rdx + r8 + 0x20]
000000018014fcfe  890d6863a400             mov      dword ptr [rip + 0xa46368], ecx ; 0x180b9606c
000000018014fd04  488d0c40                 lea      rcx, [rax + rax*2]
000000018014fd08  4803c9                   add      rcx, rcx
000000018014fd0b  488d05ee596702           lea      rax, [rip + 0x26759ee] ; 0x1827c5700
000000018014fd12  8b1cc8                   mov      ebx, dword ptr [rax + rcx*8]
000000018014fd15  4803da                   add      rbx, rdx
000000018014fd18  b830030000               mov      eax, 0x330
000000018014fd1d  c703f57a8540             mov      dword ptr [rbx], 0x40857af5
000000018014fd23  c743040000803f           mov      dword ptr [rbx + 4], 0x3f800000
000000018014fd2a  c74308e02d903a           mov      dword ptr [rbx + 8], 0x3a902de0
000000018014fd31  83631800                 and      dword ptr [rbx + 0x18], 0
000000018014fd35  f20f1005b3fd8300         movsd    xmm0, qword ptr [rip + 0x83fdb3] ; 0x18098faf0
000000018014fd3d  f20f11430c               movsd    qword ptr [rbx + 0xc], xmm0
000000018014fd42  f30f100576b09300         movss    xmm0, dword ptr [rip + 0x93b076] ; 0x180a8adc0
000000018014fd4a  4a891c00                 mov      qword ptr [rax + r8], rbx
000000018014fd4e  8b05a4fd8300             mov      eax, dword ptr [rip + 0x83fda4] ; 0x18098faf8
000000018014fd54  894314                   mov      dword ptr [rbx + 0x14], eax
000000018014fd57  e8eea37c00               call     0x18091a14a
000000018014fd5c  f30f11431c               movss    dword ptr [rbx + 0x1c], xmm0
000000018014fd61  4883c440                 add      rsp, 0x40
000000018014fd65  5b                       pop      rbx
000000018014fd66  c3                       ret      
