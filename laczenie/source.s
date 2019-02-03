
.data

.bss
.lcomm tmp, 8
.comm a, 8

.text

.global swap

.type swap, @function

swap:

	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp

#zapis do zmiennych lokalnych
	movsd (%rdi), %xmm0
	movsd %xmm0, -8(%rbp)
	movsd 8(%rdi), %xmm0
	movsd %xmm0, -16(%rbp)


#odczyt ze zmiennych lokalnych
	movsd -8(%rbp), %xmm0
	movsd %xmm0, 8(%rdi)
	movsd -16(%rbp), %xmm0
	movsd %xmm0, (%rdi)


	mov %rbp, %rsp
	pop %rbp
	ret
