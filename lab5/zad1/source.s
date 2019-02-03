.global time
.type time, @function

time:
	push %rbp
	mov %rsp, %rbp


	cpuid
	rdtsc


	mov %rbp, %rsp
	pop %rbp
	ret

