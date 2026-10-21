; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
; Bounded leaf view through first RET; no PE unwind entry.
; Direct branches remain within decoded view; no execution observed.
000000018014fe2c f30f1005e4b09300           movss xmm0, dword ptr [rip + 0x93b0e4] ; 0x180a8af18
000000018014fe34 80f9ff                     cmp cl, 0xff
000000018014fe37 742d                       je 0x18014fe66
000000018014fe39 488b05f0a3ac00             mov rax, qword ptr [rip + 0xaca3f0] ; 0x180c1a230
000000018014fe40 8b5054                     mov edx, dword ptr [rax + 0x54]
000000018014fe43 480fbec1                   movsx rax, cl
000000018014fe47 486bc82b                   imul rcx, rax, 0x2b
000000018014fe4b 488d05cea0ce04             lea rax, [rip + 0x4cea0ce] ; 0x184e39f20
000000018014fe52 4803ca                     add rcx, rdx
000000018014fe55 48c1ea1c                   shr rdx, 0x1c
000000018014fe59 488b04d0                   mov rax, qword ptr [rax + rdx*8]
000000018014fe5d f30f108488a8000000         movss xmm0, dword ptr [rax + rcx*4 + 0xa8]
000000018014fe66 c3                         ret 
