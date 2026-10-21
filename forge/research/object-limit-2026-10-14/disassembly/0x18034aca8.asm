; PE exception-table range 0x18034aca8..0x18034adf3 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018034aca8  48895c2410               mov      qword ptr [rsp + 0x10], rbx
000000018034acad  4889742418               mov      qword ptr [rsp + 0x18], rsi
000000018034acb2  57                       push     rdi
000000018034acb3  4883ec40                 sub      rsp, 0x40
000000018034acb7  488bf9                   mov      rdi, rcx
000000018034acba  e805a10300               call     0x180384dc4
000000018034acbf  83bfd8770000ff           cmp      dword ptr [rdi + 0x77d8], -1
000000018034acc6  0f8410010000             je       0x18034addc
000000018034accc  8b87dc770000             mov      eax, dword ptr [rdi + 0x77dc]
000000018034acd2  33f6                     xor      esi, esi
000000018034acd4  f0093424                 lock or  dword ptr [rsp], esi
000000018034acd8  85c0                     test     eax, eax
000000018034acda  0f84fc000000             je       0x18034addc
000000018034ace0  8b87e4770000             mov      eax, dword ptr [rdi + 0x77e4]
000000018034ace6  85c0                     test     eax, eax
000000018034ace8  0f95c3                   setne    bl
000000018034aceb  85c0                     test     eax, eax
000000018034aced  745b                     je       0x18034ad4a
000000018034acef  4c8d8768780000           lea      r8, [rdi + 0x7868]
000000018034acf6  4088742450               mov      byte ptr [rsp + 0x50], sil
000000018034acfb  488d8f7c040000           lea      rcx, [rdi + 0x47c]
000000018034ad02  ba29730000               mov      edx, 0x7329
000000018034ad07  4c8d4c2450               lea      r9, [rsp + 0x50]
000000018034ad0c  e8ef01e3ff               call     0x18017af00
000000018034ad11  84c0                     test     al, al
000000018034ad13  7407                     je       0x18034ad1c
000000018034ad15  4038742450               cmp      byte ptr [rsp + 0x50], sil
000000018034ad1a  7557                     jne      0x18034ad73
000000018034ad1c  0fbf872c540100           movsx    eax, word ptr [rdi + 0x1542c]
000000018034ad23  488d0da6476c02           lea      rcx, [rip + 0x26c47a6] ; 0x182a0f4d0
000000018034ad2a  c644243001               mov      byte ptr [rsp + 0x30], 1
000000018034ad2f  4533c9                   xor      r9d, r9d
000000018034ad32  4088742428               mov      byte ptr [rsp + 0x28], sil
000000018034ad37  ba69001000               mov      edx, 0x100069
000000018034ad3c  89442420                 mov      dword ptr [rsp + 0x20], eax
000000018034ad40  e833d4f8ff               call     0x1802d8178
000000018034ad45  408ade                   mov      bl, sil
000000018034ad48  eb29                     jmp      0x18034ad73
000000018034ad4a  0fbf872c540100           movsx    eax, word ptr [rdi + 0x1542c]
000000018034ad51  488d0d78476c02           lea      rcx, [rip + 0x26c4778] ; 0x182a0f4d0
000000018034ad58  c644243001               mov      byte ptr [rsp + 0x30], 1
000000018034ad5d  4533c9                   xor      r9d, r9d
000000018034ad60  4088742428               mov      byte ptr [rsp + 0x28], sil
000000018034ad65  ba9f001000               mov      edx, 0x10009f
000000018034ad6a  89442420                 mov      dword ptr [rsp + 0x20], eax
000000018034ad6e  e805d4f8ff               call     0x1802d8178
000000018034ad73  0fb6c3                   movzx    eax, bl
000000018034ad76  83f001                   xor      eax, 1
000000018034ad79  059f002000               add      eax, 0x20009f
000000018034ad7e  898720540100             mov      dword ptr [rdi + 0x15420], eax
000000018034ad84  488b87f0770000           mov      rax, qword ptr [rdi + 0x77f0]
000000018034ad8b  4885c0                   test     rax, rax
000000018034ad8e  741f                     je       0x18034adaf
000000018034ad90  83680801                 sub      dword ptr [rax + 8], 1
000000018034ad94  7519                     jne      0x18034adaf
000000018034ad96  488b9ff0770000           mov      rbx, qword ptr [rdi + 0x77f0]
000000018034ad9d  33d2                     xor      edx, edx
000000018034ad9f  488bcb                   mov      rcx, rbx
000000018034ada2  488b03                   mov      rax, qword ptr [rbx]
000000018034ada5  ff10                     call     qword ptr [rax]
000000018034ada7  488bcb                   mov      rcx, rbx
000000018034adaa  e899baf5ff               call     0x1802a6848
000000018034adaf  4889b7f0770000           mov      qword ptr [rdi + 0x77f0], rsi
000000018034adb6  838fd8770000ff           or       dword ptr [rdi + 0x77d8], 0xffffffff
000000018034adbd  f0093424                 lock or  dword ptr [rsp], esi
000000018034adc1  8bc6                     mov      eax, esi
000000018034adc3  8787dc770000             xchg     dword ptr [rdi + 0x77dc], eax
000000018034adc9  4889b7d0770000           mov      qword ptr [rdi + 0x77d0], rsi
000000018034add0  f0093424                 lock or  dword ptr [rsp], esi
000000018034add4  87b778040000             xchg     dword ptr [rdi + 0x478], esi
000000018034adda  eb07                     jmp      0x18034ade3
000000018034addc  838f20540100ff           or       dword ptr [rdi + 0x15420], 0xffffffff
000000018034ade3  488b5c2458               mov      rbx, qword ptr [rsp + 0x58]
000000018034ade8  488b742460               mov      rsi, qword ptr [rsp + 0x60]
000000018034aded  4883c440                 add      rsp, 0x40
000000018034adf1  5f                       pop      rdi
000000018034adf2  c3                       ret      
