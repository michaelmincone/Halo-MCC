; PE exception-table range 0x18017ac38..0x18017adaa (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018017ac38  48895c2418               mov      qword ptr [rsp + 0x18], rbx
000000018017ac3d  55                       push     rbp
000000018017ac3e  56                       push     rsi
000000018017ac3f  57                       push     rdi
000000018017ac40  488d6c2480               lea      rbp, [rsp - 0x80]
000000018017ac45  4881ec80010000           sub      rsp, 0x180
000000018017ac4c  488b05bdf39700           mov      rax, qword ptr [rip + 0x97f3bd] ; 0x180afa010
000000018017ac53  4833c4                   xor      rax, rsp
000000018017ac56  48894570                 mov      qword ptr [rbp + 0x70], rax
000000018017ac5a  83612000                 and      dword ptr [rcx + 0x20], 0
000000018017ac5e  488d7124                 lea      rsi, [rcx + 0x24]
000000018017ac62  33c0                     xor      eax, eax
000000018017ac64  488bda                   mov      rbx, rdx
000000018017ac67  898124700000             mov      dword ptr [rcx + 0x7024], eax
000000018017ac6d  488bf9                   mov      rdi, rcx
000000018017ac70  488bce                   mov      rcx, rsi
000000018017ac73  33d2                     xor      edx, edx
000000018017ac75  41b800700000             mov      r8d, 0x7000
000000018017ac7b  e8aae66000               call     0x18078932a
000000018017ac80  488d8600700000           lea      rax, [rsi + 0x7000]
000000018017ac87  4889742440               mov      qword ptr [rsp + 0x40], rsi
000000018017ac8c  41bb01000000             mov      r11d, 1
000000018017ac92  4889442448               mov      qword ptr [rsp + 0x48], rax
000000018017ac97  33d2                     xor      edx, edx
000000018017ac99  44895c2454               mov      dword ptr [rsp + 0x54], r11d
000000018017ac9e  488d4c2440               lea      rcx, [rsp + 0x40]
000000018017aca3  c744245000700000         mov      dword ptr [rsp + 0x50], 0x7000
000000018017acab  e89820f6ff               call     0x1800dcd48
000000018017acb0  418bd3                   mov      edx, r11d
000000018017acb3  44895c2454               mov      dword ptr [rsp + 0x54], r11d
000000018017acb8  488d4c2440               lea      rcx, [rsp + 0x40]
000000018017acbd  e88620f6ff               call     0x1800dcd48
000000018017acc2  488d542440               lea      rdx, [rsp + 0x40]
000000018017acc7  488bcb                   mov      rcx, rbx
000000018017acca  e87d23efff               call     0x18006d04c
000000018017accf  488d4c2440               lea      rcx, [rsp + 0x40]
000000018017acd4  e8530ef6ff               call     0x1800dbb2c
000000018017acd9  8b4c2470                 mov      ecx, dword ptr [rsp + 0x70]
000000018017acdd  8b442460                 mov      eax, dword ptr [rsp + 0x60]
000000018017ace1  83c107                   add      ecx, 7
000000018017ace4  03c1                     add      eax, ecx
000000018017ace6  99                       cdq      
000000018017ace7  83e207                   and      edx, 7
000000018017acea  03c2                     add      eax, edx
000000018017acec  c1f803                   sar      eax, 3
000000018017acef  8bc8                     mov      ecx, eax
000000018017acf1  8bd0                     mov      edx, eax
000000018017acf3  c1e910                   shr      ecx, 0x10
000000018017acf6  81e20000ff00             and      edx, 0xff0000
000000018017acfc  0bd1                     or       edx, ecx
000000018017acfe  8bc8                     mov      ecx, eax
000000018017ad00  c1e110                   shl      ecx, 0x10
000000018017ad03  2500ff0000               and      eax, 0xff00
000000018017ad08  0bc8                     or       ecx, eax
000000018017ad0a  c1ea08                   shr      edx, 8
000000018017ad0d  c1e108                   shl      ecx, 8
000000018017ad10  0bd1                     or       edx, ecx
000000018017ad12  488d4d10                 lea      rcx, [rbp + 0x10]
000000018017ad16  895720                   mov      dword ptr [rdi + 0x20], edx
000000018017ad19  ba58000000               mov      edx, 0x58
000000018017ad1e  c7076d766172             mov      dword ptr [rdi], 0x7261766d
000000018017ad24  c7470400007028           mov      dword ptr [rdi + 4], 0x28700000
000000018017ad2b  c74708001f0001           mov      dword ptr [rdi + 8], 0x1001f00
000000018017ad32  e84556eaff               call     0x18002037c
000000018017ad37  84c0                     test     al, al
000000018017ad39  7443                     je       0x18017ad7e
000000018017ad3b  8b4720                   mov      eax, dword ptr [rdi + 0x20]
000000018017ad3e  488d542430               lea      rdx, [rsp + 0x30]
000000018017ad43  488b4d10                 mov      rcx, qword ptr [rbp + 0x10]
000000018017ad47  4533c9                   xor      r9d, r9d
000000018017ad4a  0fc8                     bswap    eax
000000018017ad4c  89442430                 mov      dword ptr [rsp + 0x30], eax
000000018017ad50  458d4104                 lea      r8d, [r9 + 4]
000000018017ad54  ff158e3e7a00             call     qword ptr [rip + 0x7a3e8e] ; 0x18091ebe8: bcrypt.dll!BCryptHashData
000000018017ad5a  448b442430               mov      r8d, dword ptr [rsp + 0x30]
000000018017ad5f  4533c9                   xor      r9d, r9d
000000018017ad62  488b4d10                 mov      rcx, qword ptr [rbp + 0x10]
000000018017ad66  488bd6                   mov      rdx, rsi
000000018017ad69  ff15793e7a00             call     qword ptr [rip + 0x7a3e79] ; 0x18091ebe8: bcrypt.dll!BCryptHashData
000000018017ad6f  4c8d470c                 lea      r8, [rdi + 0xc]
000000018017ad73  488d4d10                 lea      rcx, [rbp + 0x10]
000000018017ad77  e8a456eaff               call     0x180020420
000000018017ad7c  eb0d                     jmp      0x18017ad8b
000000018017ad7e  33c0                     xor      eax, eax
000000018017ad80  4889470c                 mov      qword ptr [rdi + 0xc], rax
000000018017ad84  48894714                 mov      qword ptr [rdi + 0x14], rax
000000018017ad88  89471c                   mov      dword ptr [rdi + 0x1c], eax
000000018017ad8b  488b4d70                 mov      rcx, qword ptr [rbp + 0x70]
000000018017ad8f  4833cc                   xor      rcx, rsp
000000018017ad92  e869d06000               call     0x180787e00
000000018017ad97  488b9c24b0010000         mov      rbx, qword ptr [rsp + 0x1b0]
000000018017ad9f  4881c480010000           add      rsp, 0x180
000000018017ada6  5f                       pop      rdi
000000018017ada7  5e                       pop      rsi
000000018017ada8  5d                       pop      rbp
000000018017ada9  c3                       ret      
