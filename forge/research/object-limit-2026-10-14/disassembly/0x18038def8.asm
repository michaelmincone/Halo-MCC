; PE exception-table range 0x18038def8..0x18038e024 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018038def8  488bc4                   mov      rax, rsp
000000018038defb  48895808                 mov      qword ptr [rax + 8], rbx
000000018038deff  48896810                 mov      qword ptr [rax + 0x10], rbp
000000018038df03  48897018                 mov      qword ptr [rax + 0x18], rsi
000000018038df07  48897820                 mov      qword ptr [rax + 0x20], rdi
000000018038df0b  4154                     push     r12
000000018038df0d  4156                     push     r14
000000018038df0f  4157                     push     r15
000000018038df11  4c8b742448               mov      r14, qword ptr [rsp + 0x48]
000000018038df16  4533c0                   xor      r8d, r8d
000000018038df19  4c8b5c2450               mov      r11, qword ptr [rsp + 0x50]
000000018038df1e  458be1                   mov      r12d, r9d
000000018038df21  8bda                     mov      ebx, edx
000000018038df23  4c8bf9                   mov      r15, rcx
000000018038df26  458906                   mov      dword ptr [r14], r8d
000000018038df29  4d85db                   test     r11, r11
000000018038df2c  7403                     je       0x18038df31
000000018038df2e  4d8903                   mov      qword ptr [r11], r8
000000018038df31  4c8b4c2458               mov      r9, qword ptr [rsp + 0x58]
000000018038df36  4d85c9                   test     r9, r9
000000018038df39  7403                     je       0x18038df3e
000000018038df3b  458901                   mov      dword ptr [r9], r8d
000000018038df3e  4c8b542460               mov      r10, qword ptr [rsp + 0x60]
000000018038df43  4d85d2                   test     r10, r10
000000018038df46  7404                     je       0x18038df4c
000000018038df48  66458902                 mov      word ptr [r10], r8w
000000018038df4c  488b4c2468               mov      rcx, qword ptr [rsp + 0x68]
000000018038df51  4885c9                   test     rcx, rcx
000000018038df54  7403                     je       0x18038df59
000000018038df56  448801                   mov      byte ptr [rcx], r8b
000000018038df59  83fb0c                   cmp      ebx, 0xc
000000018038df5c  0f82a4000000             jb       0x18038e006
000000018038df62  410fb74708               movzx    eax, word ptr [r15 + 8]
000000018038df67  418b5704                 mov      edx, dword ptr [r15 + 4]
000000018038df6b  0fb7e8                   movzx    ebp, ax
000000018038df6e  418b3f                   mov      edi, dword ptr [r15]
000000018038df71  66c1e008                 shl      ax, 8
000000018038df75  66c1ed08                 shr      bp, 8
000000018038df79  660be8                   or       bp, ax
000000018038df7c  410fb7470a               movzx    eax, word ptr [r15 + 0xa]
000000018038df81  0fb7f0                   movzx    esi, ax
000000018038df84  66c1e008                 shl      ax, 8
000000018038df88  66c1ee08                 shr      si, 8
000000018038df8c  660bf0                   or       si, ax
000000018038df8f  0fca                     bswap    edx
000000018038df91  0fcf                     bswap    edi
000000018038df93  83fa0c                   cmp      edx, 0xc
000000018038df96  726e                     jb       0x18038e006
000000018038df98  3bd3                     cmp      edx, ebx
000000018038df9a  7f6a                     jg       0x18038e006
000000018038df9c  6685ed                   test     bp, bp
000000018038df9f  7865                     js       0x18038e006
000000018038dfa1  6685f6                   test     si, si
000000018038dfa4  7860                     js       0x18038e006
000000018038dfa6  418916                   mov      dword ptr [r14], edx
000000018038dfa9  413bfc                   cmp      edi, r12d
000000018038dfac  753b                     jne      0x18038dfe9
000000018038dfae  663b6c2440               cmp      bp, word ptr [rsp + 0x40]
000000018038dfb3  7534                     jne      0x18038dfe9
000000018038dfb5  4d85d2                   test     r10, r10
000000018038dfb8  7404                     je       0x18038dfbe
000000018038dfba  66418932                 mov      word ptr [r10], si
000000018038dfbe  4d85db                   test     r11, r11
000000018038dfc1  7407                     je       0x18038dfca
000000018038dfc3  498d470c                 lea      rax, [r15 + 0xc]
000000018038dfc7  498903                   mov      qword ptr [r11], rax
000000018038dfca  4d85c9                   test     r9, r9
000000018038dfcd  7406                     je       0x18038dfd5
000000018038dfcf  8d42f4                   lea      eax, [rdx - 0xc]
000000018038dfd2  418901                   mov      dword ptr [r9], eax
000000018038dfd5  81ff666f655f             cmp      edi, 0x5f656f66
000000018038dfdb  7526                     jne      0x18038e003
000000018038dfdd  83fa11                   cmp      edx, 0x11
000000018038dfe0  7221                     jb       0x18038e003
000000018038dfe2  83fb11                   cmp      ebx, 0x11
000000018038dfe5  721c                     jb       0x18038e003
000000018038dfe7  eb12                     jmp      0x18038dffb
000000018038dfe9  81ff666f655f             cmp      edi, 0x5f656f66
000000018038dfef  7512                     jne      0x18038e003
000000018038dff1  83fa11                   cmp      edx, 0x11
000000018038dff4  7210                     jb       0x18038e006
000000018038dff6  83fb11                   cmp      ebx, 0x11
000000018038dff9  720b                     jb       0x18038e006
000000018038dffb  4885c9                   test     rcx, rcx
000000018038dffe  7403                     je       0x18038e003
000000018038e000  c60101                   mov      byte ptr [rcx], 1
000000018038e003  41b001                   mov      r8b, 1
000000018038e006  488b5c2420               mov      rbx, qword ptr [rsp + 0x20]
000000018038e00b  418ac0                   mov      al, r8b
000000018038e00e  488b6c2428               mov      rbp, qword ptr [rsp + 0x28]
000000018038e013  488b742430               mov      rsi, qword ptr [rsp + 0x30]
000000018038e018  488b7c2438               mov      rdi, qword ptr [rsp + 0x38]
000000018038e01d  415f                     pop      r15
000000018038e01f  415e                     pop      r14
000000018038e021  415c                     pop      r12
000000018038e023  c3                       ret      
