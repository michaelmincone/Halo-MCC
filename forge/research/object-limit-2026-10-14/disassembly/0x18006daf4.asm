; PE exception-table range 0x18006daf4..0x18006dd40 (exclusive)
; SHA256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894
000000018006daf4  48895c2420               mov      qword ptr [rsp + 0x20], rbx
000000018006daf9  55                       push     rbp
000000018006dafa  56                       push     rsi
000000018006dafb  57                       push     rdi
000000018006dafc  4154                     push     r12
000000018006dafe  4155                     push     r13
000000018006db00  4156                     push     r14
000000018006db02  4157                     push     r15
000000018006db04  488dac2420ffffff         lea      rbp, [rsp - 0xe0]
000000018006db0c  4881ece0010000           sub      rsp, 0x1e0
000000018006db13  488b05f6c4a800           mov      rax, qword ptr [rip + 0xa8c4f6] ; 0x180afa010
000000018006db1a  4833c4                   xor      rax, rsp
000000018006db1d  488985d8000000           mov      qword ptr [rbp + 0xd8], rax
000000018006db24  4863f2                   movsxd   rsi, edx
000000018006db27  488bf9                   mov      rdi, rcx
000000018006db2a  488b0dffc6ba00           mov      rcx, qword ptr [rip + 0xbac6ff] ; 0x180c1a230
000000018006db31  8bd6                     mov      edx, esi
000000018006db33  458af1                   mov      r14b, r9b
000000018006db36  458be0                   mov      r12d, r8d
000000018006db39  e852f94200               call     0x18049d490
000000018006db3e  4c8bf8                   mov      r15, rax
000000018006db41  4533ed                   xor      r13d, r13d
000000018006db44  488d05b524f9ff           lea      rax, [rip - 0x6db4b] ; 0x180000000
000000018006db4b  4d8bc7                   mov      r8, r15
000000018006db4e  488b8cf04025a500         mov      rcx, qword ptr [rax + rsi*8 + 0xa52540]
000000018006db56  418bd4                   mov      edx, r12d
000000018006db59  488d442430               lea      rax, [rsp + 0x30]
000000018006db5e  4889442428               mov      qword ptr [rsp + 0x28], rax
000000018006db63  c644242001               mov      byte ptr [rsp + 0x20], 1
000000018006db68  4c0fbf4910               movsx    r9, word ptr [rcx + 0x10]
000000018006db6d  8bce                     mov      ecx, esi
000000018006db6f  4c030dbac6ba00           add      r9, qword ptr [rip + 0xbac6ba] ; 0x180c1a230
000000018006db76  66814d94ffff             or       word ptr [rbp - 0x6c], 0xffff
000000018006db7c  66814da0ffff             or       word ptr [rbp - 0x60], 0xffff
000000018006db82  44896c2448               mov      dword ptr [rsp + 0x48], r13d
000000018006db87  44886da4                 mov      byte ptr [rbp - 0x5c], r13b
000000018006db8b  6644896d5c               mov      word ptr [rbp + 0x5c], r13w
000000018006db90  e8b3e84200               call     0x18049c448
000000018006db95  84c0                     test     al, al
000000018006db97  0f8479010000             je       0x18006dd16
000000018006db9d  8b542430                 mov      edx, dword ptr [rsp + 0x30]
000000018006dba1  83faff                   cmp      edx, -1
000000018006dba4  0f846c010000             je       0x18006dd16
000000018006dbaa  488b054fcaba00           mov      rax, qword ptr [rip + 0xbaca4f] ; 0x180c1a600
000000018006dbb1  0fb7ca                   movzx    ecx, dx
000000018006dbb4  448b44c804               mov      r8d, dword ptr [rax + rcx*8 + 4]
000000018006dbb9  488d0d4024f9ff           lea      rcx, [rip - 0x6dbc0] ; 0x180000000
000000018006dbc0  418bc0                   mov      eax, r8d
000000018006dbc3  48c1e81c                 shr      rax, 0x1c
000000018006dbc7  488b84c1209fe304         mov      rax, qword ptr [rcx + rax*8 + 0x4e39f20]
000000018006dbcf  4639ac8040010000         cmp      dword ptr [rax + r8*4 + 0x140], r13d
000000018006dbd7  0f8e39010000             jle      0x18006dd16
000000018006dbdd  488bcf                   mov      rcx, rdi
000000018006dbe0  e8abf2ffff               call     0x18006ce90
000000018006dbe5  4863d8                   movsxd   rbx, eax
000000018006dbe8  83fbff                   cmp      ebx, -1
000000018006dbeb  0f8425010000             je       0x18006dd16
000000018006dbf1  4584f6                   test     r14b, r14b
000000018006dbf4  0f84ff000000             je       0x18006dcf9
000000018006dbfa  488bcf                   mov      rcx, rdi
000000018006dbfd  e8c6040000               call     0x18006e0c8
000000018006dc02  83f8ff                   cmp      eax, -1
000000018006dc05  0f840b010000             je       0x18006dd16
000000018006dc0b  4863c8                   movsxd   rcx, eax
000000018006dc0e  4c8d442430               lea      r8, [rsp + 0x30]
000000018006dc13  4c6bf14c                 imul     r14, rcx, 0x4c
000000018006dc17  8bd0                     mov      edx, eax
000000018006dc19  488bcf                   mov      rcx, rdi
000000018006dc1c  41838c3e00150000ff       or       dword ptr [r14 + rdi + 0x1500], 0xffffffff
000000018006dc25  e8920e0000               call     0x18006eabc
000000018006dc2a  8d46ff                   lea      eax, [rsi - 1]
000000018006dc2d  83f801                   cmp      eax, 1
000000018006dc30  7729                     ja       0x18006dc5b
000000018006dc32  418bd4                   mov      edx, r12d
000000018006dc35  8bce                     mov      ecx, esi
000000018006dc37  e870270000               call     0x1800703ac
000000018006dc3c  4885c0                   test     rax, rax
000000018006dc3f  741a                     je       0x18006dc5b
000000018006dc41  448a402a                 mov      r8b, byte ptr [rax + 0x2a]
000000018006dc45  488d0c5f                 lea      rcx, [rdi + rbx*2]
000000018006dc49  8a4029                   mov      al, byte ptr [rax + 0x29]
000000018006dc4c  88840b40d60000           mov      byte ptr [rbx + rcx + 0xd640], al
000000018006dc53  4488840b41d60000         mov      byte ptr [rbx + rcx + 0xd641], r8b
000000018006dc5b  8bd3                     mov      edx, ebx
000000018006dc5d  488bcf                   mov      rcx, rdi
000000018006dc60  e8d3010000               call     0x18006de38
000000018006dc65  83fe02                   cmp      esi, 2
000000018006dc68  0f85a8000000             jne      0x18006dd16
000000018006dc6e  0fb74c2430               movzx    ecx, word ptr [rsp + 0x30]
000000018006dc73  4c8d058623f9ff           lea      r8, [rip - 0x6dc7a] ; 0x180000000
000000018006dc7a  488b057fc9ba00           mov      rax, qword ptr [rip + 0xbac97f] ; 0x180c1a600
000000018006dc81  8b54c804                 mov      edx, dword ptr [rax + rcx*8 + 4]
000000018006dc85  8bc2                     mov      eax, edx
000000018006dc87  48c1e81c                 shr      rax, 0x1c
000000018006dc8b  498b8cc0209fe304         mov      rcx, qword ptr [r8 + rax*8 + 0x4e39f20]
000000018006dc93  4439ac91f0030000         cmp      dword ptr [rcx + rdx*4 + 0x3f0], r13d
000000018006dc9b  7e79                     jle      0x18006dd16
000000018006dc9d  8b9491f4030000           mov      edx, dword ptr [rcx + rdx*4 + 0x3f4]
000000018006dca4  8bc2                     mov      eax, edx
000000018006dca6  48c1e81c                 shr      rax, 0x1c
000000018006dcaa  4d8b84c0209fe304         mov      r8, qword ptr [r8 + rax*8 + 0x4e39f20]
000000018006dcb2  450fb74c900a             movzx    r9d, word ptr [r8 + rdx*4 + 0xa]
000000018006dcb8  664585c9                 test     r9w, r9w
000000018006dcbc  7e58                     jle      0x18006dd16
000000018006dcbe  410fb74f70               movzx    ecx, word ptr [r15 + 0x70]
000000018006dcc3  6685c9                   test     cx, cx
000000018006dcc6  7f06                     jg       0x18006dcce
000000018006dcc8  410fb74c9006             movzx    ecx, word ptr [r8 + rdx*4 + 6]
000000018006dcce  410fb74772               movzx    eax, word ptr [r15 + 0x72]
000000018006dcd3  6685c0                   test     ax, ax
000000018006dcd6  450fbfc1                 movsx    r8d, r9w
000000018006dcda  0fbfc9                   movsx    ecx, cx
000000018006dcdd  66410f4ec1               cmovle   ax, r9w
000000018006dce2  98                       cwde     
000000018006dce3  2bc8                     sub      ecx, eax
000000018006dce5  418d40ff                 lea      eax, [r8 - 1]
000000018006dce9  03c1                     add      eax, ecx
000000018006dceb  99                       cdq      
000000018006dcec  41f7f8                   idiv     r8d
000000018006dcef  4188843e44150000         mov      byte ptr [r14 + rdi + 0x1544], al
000000018006dcf7  eb1d                     jmp      0x18006dd16
000000018006dcf9  4c8d4d7b                 lea      r9, [rbp + 0x7b]
000000018006dcfd  4983e1fc                 and      r9, 0xfffffffffffffffc
000000018006dd01  453829                   cmp      byte ptr [r9], r13b
000000018006dd04  7410                     je       0x18006dd16
000000018006dd06  e825e0ffff               call     0x18006bd30
000000018006dd0b  498bd1                   mov      rdx, r9
000000018006dd0e  488bc8                   mov      rcx, rax
000000018006dd11  e85adeffff               call     0x18006bb70
000000018006dd16  488b8dd8000000           mov      rcx, qword ptr [rbp + 0xd8]
000000018006dd1d  4833cc                   xor      rcx, rsp
000000018006dd20  e8dba07100               call     0x180787e00
000000018006dd25  488b9c2438020000         mov      rbx, qword ptr [rsp + 0x238]
000000018006dd2d  4881c4e0010000           add      rsp, 0x1e0
000000018006dd34  415f                     pop      r15
000000018006dd36  415e                     pop      r14
000000018006dd38  415d                     pop      r13
000000018006dd3a  415c                     pop      r12
000000018006dd3c  5f                       pop      rdi
000000018006dd3d  5e                       pop      rsi
000000018006dd3e  5d                       pop      rbp
000000018006dd3f  c3                       ret      
