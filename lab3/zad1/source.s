.text
.global my_rdtsc

my_rdtsc:

	pushl %ebp
	movl %esp, %ebp
	
rdtsc:
	xor %eax,%eax
	cpuid
	rdtsc
	jmp koniec

koniec:

	mov %ebp, %esp
	pop %ebp
	ret



