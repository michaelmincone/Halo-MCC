; PE exception-table range 0x18006de38..0x18006dee2 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006de38  48895c2408               mov      qword ptr [rsp + 8], rbx
000000018006de3d  4889742410               mov      qword ptr [rsp + 0x10], rsi
000000018006de42  57                       push     rdi
000000018006de43  4883ec20                 sub      rsp, 0x20
000000018006de47  448b05ca9cba00           mov      r8d, dword ptr [rip + 0xba9cca] ; 0x180c17b18
000000018006de4e  488bf1                   mov      rsi, rcx
000000018006de51  65488b042558000000       mov      rax, qword ptr gs:[0x58]
000000018006de5a  b948000000               mov      ecx, 0x48
000000018006de5f  4863da                   movsxd   rbx, edx
000000018006de62  4a8b04c0                 mov      rax, qword ptr [rax + r8*8]
000000018006de66  4c8b0408                 mov      r8, qword ptr [rax + rcx]
000000018006de6a  4180781104               cmp      byte ptr [r8 + 0x11], 4
000000018006de6f  7461                     je       0x18006ded2
000000018006de71  8bd3                     mov      edx, ebx
000000018006de73  488d3c5e                 lea      rdi, [rsi + rbx*2]
000000018006de77  e8e4f0ffff               call     0x18006cf60
000000018006de7c  4532c0                   xor      r8b, r8b
000000018006de7f  41b98b020000             mov      r9d, 0x28b
000000018006de85  4881c6fe140000           add      rsi, 0x14fe
000000018006de8c  0fbf16                   movsx    edx, word ptr [rsi]
000000018006de8f  418d4001                 lea      eax, [r8 + 1]
000000018006de93  0fb6c8                   movzx    ecx, al
000000018006de96  488d764c                 lea      rsi, [rsi + 0x4c]
000000018006de9a  3bd3                     cmp      edx, ebx
000000018006de9c  410fb6c0                 movzx    eax, r8b
000000018006dea0  0f45c8                   cmovne   ecx, eax
000000018006dea3  448ac1                   mov      r8b, cl
000000018006dea6  4983e901                 sub      r9, 1
000000018006deaa  75e0                     jne      0x18006de8c
000000018006deac  8a841f42d60000           mov      al, byte ptr [rdi + rbx + 0xd642]
000000018006deb3  3ac1                     cmp      al, cl
000000018006deb5  740f                     je       0x18006dec6
000000018006deb7  0fb6d1                   movzx    edx, cl
000000018006deba  8bcb                     mov      ecx, ebx
000000018006debc  0fb6c0                   movzx    eax, al
000000018006debf  2bd0                     sub      edx, eax
000000018006dec1  e8ee810000               call     0x1800760b4
000000018006dec6  ba04000000               mov      edx, 4
000000018006decb  8bcb                     mov      ecx, ebx
000000018006decd  e882813300               call     0x1803a6054
000000018006ded2  488b5c2430               mov      rbx, qword ptr [rsp + 0x30]
000000018006ded7  488b742438               mov      rsi, qword ptr [rsp + 0x38]
000000018006dedc  4883c420                 add      rsp, 0x20
000000018006dee0  5f                       pop      rdi
000000018006dee1  c3                       ret      
