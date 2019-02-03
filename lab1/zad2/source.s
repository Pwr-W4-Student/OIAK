
SYSEXIT = 1
EXITSUCCESS = 0
SYSWRITE = 4
STDOUT = 1

.data
msg: .ascii " HeLLo WoRlD "
msg_len = . - msg

.bss
.comm out, 512

.text

.global _start

_start:
mov $msg_len, %ecx
dec %ecx

mov $0, %esi
mov $0, %edi

loop:
mov msg(,%edi, 1), %al
mov $0, %edx
mov $0, %ebx
mov $0xA, %ecx
div %ecx /* eax = al/ ecx + edx*/


mov %edx, %ebx

cmp $0xA, %eax
jl wypisz

mov $0, %edx
movl $0xA, %ecx
div %ecx

add $48, %eax
movl %eax, out(,%esi, 1)
inc %esi

add $48, %edx
movl %edx, out(,%esi,1)
inc %esi

add $48, %ebx
movl %ebx, out(, %esi, 1)
inc %esi

inc %edi
mov $msg_len, %ecx
cmp %edi,  %ecx
jg loop

wypisz:

add $48, %eax
mov %eax, out(,%esi,1)
inc %esi

add $48, %edx
mov %edx, out(,%esi,1)
inc %esi
inc %edi


mov $msg_len, %ecx
cmp %edi, %ecx
jg loop


mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $out, %ecx
mov %esi, %edx
int $0x80

mov $SYSEXIT, %eax
mov $EXITSUCCESS, %ebx
int $0x80


