; PE exception-table range 0x180500670..0x1805009e3 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
0000000180500670  488bc4                   mov      rax, rsp
0000000180500673  48895810                 mov      qword ptr [rax + 0x10], rbx
0000000180500677  55                       push     rbp
0000000180500678  56                       push     rsi
0000000180500679  57                       push     rdi
000000018050067a  4154                     push     r12
000000018050067c  4155                     push     r13
000000018050067e  4156                     push     r14
0000000180500680  4157                     push     r15
0000000180500682  488d6888                 lea      rbp, [rax - 0x78]
0000000180500686  4881ec40010000           sub      rsp, 0x140
000000018050068d  0f2970b8                 movaps   xmmword ptr [rax - 0x48], xmm6
0000000180500691  488b0578995f00           mov      rax, qword ptr [rip + 0x5f9978] ; 0x180afa010
0000000180500698  4833c4                   xor      rax, rsp
000000018050069b  48894520                 mov      qword ptr [rbp + 0x20], rax
000000018050069f  65488b042558000000       mov      rax, qword ptr gs:[0x58]
00000001805006a8  4c8d3571989304           lea      r14, [rip + 0x4939871] ; 0x184e39f20
00000001805006af  488b9da0000000           mov      rbx, qword ptr [rbp + 0xa0]
00000001805006b6  4c8bd2                   mov      r10, rdx
00000001805006b9  448be1                   mov      r12d, ecx
00000001805006bc  4032ff                   xor      dil, dil
00000001805006bf  8b0d53747100             mov      ecx, dword ptr [rip + 0x717453] ; 0x180c17b18
00000001805006c5  be10000000               mov      esi, 0x10
00000001805006ca  f3410f1002               movss    xmm0, dword ptr [r10]
00000001805006cf  f3410f104a04             movss    xmm1, dword ptr [r10 + 4]
00000001805006d5  4c8b1cc8                 mov      r11, qword ptr [rax + rcx*8]
00000001805006d9  410fb7cc                 movzx    ecx, r12w
00000001805006dd  4c895c2450               mov      qword ptr [rsp + 0x50], r11
00000001805006e2  498b0433                 mov      rax, qword ptr [r11 + rsi]
00000001805006e6  488d1449                 lea      rdx, [rcx + rcx*2]
00000001805006ea  488b4850                 mov      rcx, qword ptr [rax + 0x50]
00000001805006ee  488b050b9f7100           mov      rax, qword ptr [rip + 0x719f0b] ; 0x180c1a600
00000001805006f5  4c8b7cd110               mov      r15, qword ptr [rcx + rdx*8 + 0x10]
00000001805006fa  410fb70f                 movzx    ecx, word ptr [r15]
00000001805006fe  8b74c804                 mov      esi, dword ptr [rax + rcx*8 + 4]
0000000180500702  8bc6                     mov      eax, esi
0000000180500704  48c1e81c                 shr      rax, 0x1c
0000000180500708  4d8b34c6                 mov      r14, qword ptr [r14 + rax*8]
000000018050070c  f3410f1094b6ec040000     movss    xmm2, dword ptr [r14 + rsi*4 + 0x4ec]
0000000180500716  8364246800               and      dword ptr [rsp + 0x68], 0
000000018050071b  f30f58d2                 addss    xmm2, xmm2
000000018050071f  8364246c00               and      dword ptr [rsp + 0x6c], 0
0000000180500724  f30f11442478             movss    dword ptr [rsp + 0x78], xmm0
000000018050072a  f30f114c247c             movss    dword ptr [rsp + 0x7c], xmm1
0000000180500730  0f28c2                   movaps   xmm0, xmm2
0000000180500733  f30f58d2                 addss    xmm2, xmm2
0000000180500737  f3410f584208             addss    xmm0, dword ptr [r10 + 8]
000000018050073d  0f5715ac9c4d00           xorps    xmm2, xmmword ptr [rip + 0x4d9cac] ; 0x1809da3f0
0000000180500744  f30f11542470             movss    dword ptr [rsp + 0x70], xmm2
000000018050074a  f30f114580               movss    dword ptr [rbp - 0x80], xmm0
000000018050074f  4d85c0                   test     r8, r8
0000000180500752  7412                     je       0x180500766
0000000180500754  f20f10442478             movsd    xmm0, qword ptr [rsp + 0x78]
000000018050075a  8b4580                   mov      eax, dword ptr [rbp - 0x80]
000000018050075d  f2410f1100               movsd    qword ptr [r8], xmm0
0000000180500762  41894008                 mov      dword ptr [r8 + 8], eax
0000000180500766  4d85c9                   test     r9, r9
0000000180500769  7413                     je       0x18050077e
000000018050076b  f20f10442468             movsd    xmm0, qword ptr [rsp + 0x68]
0000000180500771  8b442470                 mov      eax, dword ptr [rsp + 0x70]
0000000180500775  f2410f1101               movsd    qword ptr [r9], xmm0
000000018050077a  41894108                 mov      dword ptr [r9 + 8], eax
000000018050077e  f2410f1002               movsd    xmm0, qword ptr [r10]
0000000180500783  4c8d4c2468               lea      r9, [rsp + 0x68]
0000000180500788  488b0de9f93902           mov      rcx, qword ptr [rip + 0x239f9e9] ; 0x1828a0178
000000018050078f  4c8d442478               lea      r8, [rsp + 0x78]
0000000180500794  488365a800               and      qword ptr [rbp - 0x58], 0
0000000180500799  4183cdff                 or       r13d, 0xffffffff
000000018050079d  488365b000               and      qword ptr [rbp - 0x50], 0
00000001805007a2  33d2                     xor      edx, edx
00000001805007a4  f20f1103                 movsd    qword ptr [rbx], xmm0
00000001805007a8  418b4208                 mov      eax, dword ptr [r10 + 8]
00000001805007ac  894308                   mov      dword ptr [rbx + 8], eax
00000001805007af  488d4590                 lea      rax, [rbp - 0x70]
00000001805007b3  4889442438               mov      qword ptr [rsp + 0x38], rax
00000001805007b8  44896c2430               mov      dword ptr [rsp + 0x30], r13d
00000001805007bd  44896c2428               mov      dword ptr [rsp + 0x28], r13d
00000001805007c2  4489642420               mov      dword ptr [rsp + 0x20], r12d
00000001805007c7  6644896db8               mov      word ptr [rbp - 0x48], r13w
00000001805007cc  e8cb8ec2ff               call     0x18012969c
00000001805007d1  84c0                     test     al, al
00000001805007d3  0f84db010000             je       0x1805009b4
00000001805007d9  f3410f10574c             movss    xmm2, dword ptr [r15 + 0x4c]
00000001805007df  f3410f108cb6ec040000     movss    xmm1, dword ptr [r14 + rsi*4 + 0x4ec]
00000001805007e9  0f28da                   movaps   xmm3, xmm2
00000001805007ec  f20f104598               movsd    xmm0, qword ptr [rbp - 0x68]
00000001805007f1  f30f5cd1                 subss    xmm2, xmm1
00000001805007f5  8b45a0                   mov      eax, dword ptr [rbp - 0x60]
00000001805007f8  f30f58d9                 addss    xmm3, xmm1
00000001805007fc  f20f1103                 movsd    qword ptr [rbx], xmm0
0000000180500800  894308                   mov      dword ptr [rbx + 8], eax
0000000180500803  f30f104308               movss    xmm0, dword ptr [rbx + 8]
0000000180500808  f30f5fc2                 maxss    xmm0, xmm2
000000018050080c  0f2fd8                   comiss   xmm3, xmm0
000000018050080f  7703                     ja       0x180500814
0000000180500811  0f28c3                   movaps   xmm0, xmm3
0000000180500814  f30f114308               movss    dword ptr [rbx + 8], xmm0
0000000180500819  bf01000000               mov      edi, 1
000000018050081e  f3410f1084b6f0040000     movss    xmm0, dword ptr [r14 + rsi*4 + 0x4f0]
0000000180500828  0f2f05059c5700           comiss   xmm0, dword ptr [rip + 0x579c05] ; 0x180a7a434
000000018050082f  0f867f010000             jbe      0x1805009b4
0000000180500835  c744243808000000         mov      dword ptr [rsp + 0x38], 8
000000018050083d  488d4500                 lea      rax, [rbp]
0000000180500841  4889442430               mov      qword ptr [rsp + 0x30], rax
0000000180500846  4d8d4f08                 lea      r9, [r15 + 8]
000000018050084a  f30f11442428             movss    dword ptr [rsp + 0x28], xmm0
0000000180500850  448d4702                 lea      r8d, [rdi + 2]
0000000180500854  33d2                     xor      edx, edx
0000000180500856  48895c2420               mov      qword ptr [rsp + 0x20], rbx
000000018050085b  418bcc                   mov      ecx, r12d
000000018050085e  458bf5                   mov      r14d, r13d
0000000180500861  4032f6                   xor      sil, sil
0000000180500864  e85f38f7ff               call     0x1804740c8
0000000180500869  4c63e8                   movsxd   r13, eax
000000018050086c  85c0                     test     eax, eax
000000018050086e  0f8e40010000             jle      0x1805009b4
0000000180500874  488b442450               mov      rax, qword ptr [rsp + 0x50]
0000000180500879  4533ff                   xor      r15d, r15d
000000018050087c  b910000000               mov      ecx, 0x10
0000000180500881  488b0408                 mov      rax, qword ptr [rax + rcx]
0000000180500885  488b5050                 mov      rdx, qword ptr [rax + 0x50]
0000000180500889  4889542450               mov      qword ptr [rsp + 0x50], rdx
000000018050088e  f30f10742450             movss    xmm6, dword ptr [rsp + 0x50]
0000000180500894  468b64bd00               mov      r12d, dword ptr [rbp + r15*4]
0000000180500899  410fb7c4                 movzx    eax, r12w
000000018050089d  488d0c40                 lea      rcx, [rax + rax*2]
00000001805008a1  488b54ca10               mov      rdx, qword ptr [rdx + rcx*8 + 0x10]
00000001805008a6  8b8238010000             mov      eax, dword ptr [rdx + 0x138]
00000001805008ac  c1e802                   shr      eax, 2
00000001805008af  4084c7                   test     dil, al
00000001805008b2  0f85d4000000             jne      0x18050098c
00000001805008b8  8a8a8e000000             mov      cl, byte ptr [rdx + 0x8e]
00000001805008be  4183feff                 cmp      r14d, -1
00000001805008c2  7416                     je       0x1805008da
00000001805008c4  448bdf                   mov      r11d, edi
00000001805008c7  41d3e3                   shl      r11d, cl
00000001805008ca  41d1eb                   shr      r11d, 1
00000001805008cd  4422df                   and      r11b, dil
00000001805008d0  4084f6                   test     sil, sil
00000001805008d3  7554                     jne      0x180500929
00000001805008d5  4584db                   test     r11b, r11b
00000001805008d8  744f                     je       0x180500929
00000001805008da  8bf7                     mov      esi, edi
00000001805008dc  488d542440               lea      rdx, [rsp + 0x40]
00000001805008e1  d3e6                     shl      esi, cl
00000001805008e3  458bf4                   mov      r14d, r12d
00000001805008e6  d1ee                     shr      esi, 1
00000001805008e8  418bcc                   mov      ecx, r12d
00000001805008eb  4022f7                   and      sil, dil
00000001805008ee  e84514f7ff               call     0x180471d38
00000001805008f3  f30f104c2440             movss    xmm1, dword ptr [rsp + 0x40]
00000001805008f9  f30f10742444             movss    xmm6, dword ptr [rsp + 0x44]
00000001805008ff  f30f5c7304               subss    xmm6, dword ptr [rbx + 4]
0000000180500904  f30f5c0b                 subss    xmm1, dword ptr [rbx]
0000000180500908  f30f10442448             movss    xmm0, dword ptr [rsp + 0x48]
000000018050090e  f30f5c4308               subss    xmm0, dword ptr [rbx + 8]
0000000180500913  f30f59f6                 mulss    xmm6, xmm6
0000000180500917  f30f59c9                 mulss    xmm1, xmm1
000000018050091b  f30f59c0                 mulss    xmm0, xmm0
000000018050091f  f30f58f1                 addss    xmm6, xmm1
0000000180500923  f30f58f0                 addss    xmm6, xmm0
0000000180500927  eb63                     jmp      0x18050098c
0000000180500929  488d542458               lea      rdx, [rsp + 0x58]
000000018050092e  418bcc                   mov      ecx, r12d
0000000180500931  e80214f7ff               call     0x180471d38
0000000180500936  f30f104c2458             movss    xmm1, dword ptr [rsp + 0x58]
000000018050093c  f30f1054245c             movss    xmm2, dword ptr [rsp + 0x5c]
0000000180500942  f30f5c5304               subss    xmm2, dword ptr [rbx + 4]
0000000180500947  f30f5c0b                 subss    xmm1, dword ptr [rbx]
000000018050094b  f30f10442460             movss    xmm0, dword ptr [rsp + 0x60]
0000000180500951  f30f5c4308               subss    xmm0, dword ptr [rbx + 8]
0000000180500956  f30f59d2                 mulss    xmm2, xmm2
000000018050095a  f30f59c9                 mulss    xmm1, xmm1
000000018050095e  f30f59c0                 mulss    xmm0, xmm0
0000000180500962  f30f58d1                 addss    xmm2, xmm1
0000000180500966  f30f58d0                 addss    xmm2, xmm0
000000018050096a  0f2ff2                   comiss   xmm6, xmm2
000000018050096d  761d                     jbe      0x18050098c
000000018050096f  f20f10442458             movsd    xmm0, qword ptr [rsp + 0x58]
0000000180500975  458bf4                   mov      r14d, r12d
0000000180500978  8b442460                 mov      eax, dword ptr [rsp + 0x60]
000000018050097c  418af3                   mov      sil, r11b
000000018050097f  f20f11442440             movsd    qword ptr [rsp + 0x40], xmm0
0000000180500985  0f28f2                   movaps   xmm6, xmm2
0000000180500988  89442448                 mov      dword ptr [rsp + 0x48], eax
000000018050098c  488b542450               mov      rdx, qword ptr [rsp + 0x50]
0000000180500991  4c03ff                   add      r15, rdi
0000000180500994  4d3bfd                   cmp      r15, r13
0000000180500997  0f8cf7feffff             jl       0x180500894
000000018050099d  4183feff                 cmp      r14d, -1
00000001805009a1  7411                     je       0x1805009b4
00000001805009a3  f20f10442440             movsd    xmm0, qword ptr [rsp + 0x40]
00000001805009a9  8b4c2448                 mov      ecx, dword ptr [rsp + 0x48]
00000001805009ad  f20f1103                 movsd    qword ptr [rbx], xmm0
00000001805009b1  894b08                   mov      dword ptr [rbx + 8], ecx
00000001805009b4  408ac7                   mov      al, dil
00000001805009b7  488b4d20                 mov      rcx, qword ptr [rbp + 0x20]
00000001805009bb  4833cc                   xor      rcx, rsp
00000001805009be  e83d742800               call     0x180787e00
00000001805009c3  4c8d9c2440010000         lea      r11, [rsp + 0x140]
00000001805009cb  498b5b48                 mov      rbx, qword ptr [r11 + 0x48]
00000001805009cf  410f2873f0               movaps   xmm6, xmmword ptr [r11 - 0x10]
00000001805009d4  498be3                   mov      rsp, r11
00000001805009d7  415f                     pop      r15
00000001805009d9  415e                     pop      r14
00000001805009db  415d                     pop      r13
00000001805009dd  415c                     pop      r12
00000001805009df  5f                       pop      rdi
00000001805009e0  5e                       pop      rsi
00000001805009e1  5d                       pop      rbp
00000001805009e2  c3                       ret      
