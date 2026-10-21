; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
; Explicit 256-byte bounded view from 0x18014fe2c. Leaf extent unknown; subsequent functions may appear.
000000018014fe2c f30f1005e4b09300           movss xmm0, dword ptr [rip + 0x93b0e4]
000000018014fe34 80f9ff                     cmp cl, 0xff
000000018014fe37 742d                       je 0x18014fe66
000000018014fe39 488b05f0a3ac00             mov rax, qword ptr [rip + 0xaca3f0]
000000018014fe40 8b5054                     mov edx, dword ptr [rax + 0x54]
000000018014fe43 480fbec1                   movsx rax, cl
000000018014fe47 486bc82b                   imul rcx, rax, 0x2b
000000018014fe4b 488d05cea0ce04             lea rax, [rip + 0x4cea0ce]
000000018014fe52 4803ca                     add rcx, rdx
000000018014fe55 48c1ea1c                   shr rdx, 0x1c
000000018014fe59 488b04d0                   mov rax, qword ptr [rax + rdx*8]
000000018014fe5d f30f108488a8000000         movss xmm0, dword ptr [rax + rcx*4 + 0xa8]
000000018014fe66 c3                         ret 
000000018014fe67 cc                         int3 
000000018014fe68 8b15aa7cac00               mov edx, dword ptr [rip + 0xac7caa]
000000018014fe6e 65488b042558000000         mov rax, qword ptr gs:[0x58]
000000018014fe77 41b830030000               mov r8d, 0x330
000000018014fe7d 488b04d0                   mov rax, qword ptr [rax + rdx*8]
000000018014fe81 8b5108                     mov edx, dword ptr [rcx + 8]
000000018014fe84 b904000000                 mov ecx, 4
000000018014fe89 4983240000                 and qword ptr [r8 + rax], 0
000000018014fe8e e9e103f5ff                 jmp 0x1800a0274
000000018014fe93 cc                         int3 
000000018014fe94 4053                       push rbx
000000018014fe96 4883ec40                   sub rsp, 0x40
000000018014fe9a 488bd9                     mov rbx, rcx
000000018014fe9d 488d05d0fdffff             lea rax, [rip - 0x230]
000000018014fea4 33c9                       xor ecx, ecx
000000018014fea6 4c8bca                     mov r9, rdx
000000018014fea9 48894c2438                 mov qword ptr [rsp + 0x38], rcx
000000018014feae 488d152b5e8300             lea rdx, [rip + 0x835e2b]
000000018014feb5 48894c2430                 mov qword ptr [rsp + 0x30], rcx
000000018014feba 4c8bc2                     mov r8, rdx
000000018014febd 4889442428                 mov qword ptr [rsp + 0x28], rax
000000018014fec2 894c2420                   mov dword ptr [rsp + 0x20], ecx
000000018014fec6 b904000000                 mov ecx, 4
000000018014fecb e82c02f5ff                 call 0x1800a00fc
000000018014fed0 8b15427cac00               mov edx, dword ptr [rip + 0xac7c42]
000000018014fed6 65488b0c2558000000         mov rcx, qword ptr gs:[0x58]
000000018014fedf 894308                     mov dword ptr [rbx + 8], eax
000000018014fee2 4898                       cdqe 
000000018014fee4 4c8b04d1                   mov r8, qword ptr [rcx + rdx*8]
000000018014fee8 b928000000                 mov ecx, 0x28
000000018014feed bae0060000                 mov edx, 0x6e0
000000018014fef2 428b0c01                   mov ecx, dword ptr [rcx + r8]
000000018014fef6 894b0c                     mov dword ptr [rbx + 0xc], ecx
000000018014fef9 488d0c40                   lea rcx, [rax + rax*2]
000000018014fefd 4803c9                     add rcx, rcx
000000018014ff00 488d05f9576702             lea rax, [rip + 0x26757f9]
000000018014ff07 8b04c8                     mov eax, dword ptr [rax + rcx*8]
000000018014ff0a 4a03440220                 add rax, qword ptr [rdx + r8 + 0x20]
000000018014ff0f 4883c440                   add rsp, 0x40
000000018014ff13 5b                         pop rbx
000000018014ff14 c3                         ret 
000000018014ff15 cc                         int3 
000000018014ff16 cc                         int3 
000000018014ff17 cc                         int3 
000000018014ff18 4883ec28                   sub rsp, 0x28
000000018014ff1c 8b15f67bac00               mov edx, dword ptr [rip + 0xac7bf6]
000000018014ff22 4c8bc1                     mov r8, rcx
