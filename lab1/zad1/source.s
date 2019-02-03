
SYSEXIT = 1
EXIT_SUCCESS = 0
SYSWRITE = 4
STDOUT = 1


.data
msg: .ascii "hello world\n"
msg_len = . - msg
.text

.global _start

_start:
movl $msg_len, %edi /*%edi = stelen(msg_len)*/
decl %esi /*%edi = strlen(msg_len) - 1*/

movl $-1, %esi
movl $0x2, %ecx
movl $msg_len, %eax
divl %ecx /* %eax = %eax/2 */

loop:
movb msg(,%esi,1), %cl
movb msg(,%edi,1), %ch
movb %cl, msg(,%edi,1)
movb %ch, msg(,%esi,1)
decl %edi
incl %esi

cmp %esi,%eax
jne loop

mov $SYSWRITE,%eax
mov  $STDOUT, %ebx
mov $msg, %ecx
mov $msg_len, %edx
int $0x80

mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80



