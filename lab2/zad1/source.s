SYSEXIT = 1
EXITSUCCESS = 0
SYSWRITE = 4
STDOUT = 1

.data
len = 13
n0 = 0
n1 = 1

.bss
.comm out, 512

.text 

.global _start

_start:

movl $len, %ecx
 
mov $-1, %edi

loop:


inc %edi
cmp $0, %edi
je n_zero

cmp $1, %edi
je n_jeden

xadd %ebx, %edx

movl $len, %ecx
cmp %edi,  %ecx
jg loop


n_zero:
mov $n0, %edx
movl $len, %ecx
cmp %edi,  %ecx
jg loop

n_jeden:
mov $n1, %edx
movl $len, %ecx
cmp %edi,  %ecx
jg loop

mov $SYSWRITE, %eax
mov $STDOUT, %ebx
int $0x80

mov $SYSEXIT, %eax
mov $EXITSUCCESS, %ebx
int $0x80
