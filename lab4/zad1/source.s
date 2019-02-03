SYSEXIT = 1
EXIT_SUCCESS = 0
SYSWRITE = 4
STDOUT = 1

 
.data

	A: .int 2
	B: .int 3
	n: .int 0
	k: .int 1
	p: .int 0


msg: .string "hello"

msg_len = .-msg

.global main

main:
	fild A
	fld %st(1)
	fadd %st, %st(1)
	fwait


mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80
