.code32
SYSEXIT = 1
EXIT_SUCCESS = 0
SYSWRITE = 4
STDOUT = 1

 
.data

	A: .float 2
	B: .float 3
	n: .float 0
	k: .float 1
	p: .float 0


msg: .string "hello"

msg_len = .-msg

.global main

main:
	finit
	fld B
	fdivs A


mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80
