SYSEXIT = 1
EXITSUCCESS = 0
SYSWRITE = 4
STDOUT = 1

.data

wyraz = 30

.bss
.comm liczba1, 128
.comm liczba2, 128

.text

.global _start

_start:

movl $-1, %edi
movl $0, %ebx
movl $31, %ecx

inc %ebx
movl %ebx, liczba2(,%ecx, 4)

movl $wyraz, %ebx

movl $0, %ecx
movl $1, %ecx

loop:
inc %edi

movl $31, %esi

movl liczba1(,%esi, 4), %eax
movl liczba2(,%esi, 4), %edx
xadd %edx, %eax

pushf


movl %eax, liczba1(,%esi, 4)
movl %edx, liczba2(,%esi, 4)

dec %esi

dodawanie:
movl liczba1(,%esi, 4), %eax
movl liczba2(,%esi, 4), %edx

popf

adc %eax, %edx

pushf

movl %edx, liczba2(,%esi, 4)

dec %esi
cmp $0, %esi
jne dodawanie

movb $0, %edx

cmp $wyraz, %edi
jne loop


mov $SYSWRITE, %eax
mov $STDOUT, %ebx
int $0x80

mov $SYSEXIT, %eax
mov $EXITSUCCESS, %ebx
int $0x80

