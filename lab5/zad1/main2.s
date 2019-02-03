	.file	"main2.c"
	.section	.rodata
.LC0:
	.string	"%llu "
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$2080, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L3:
	movl	-8(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movl	%edx, -2080(%rbp,%rax,4)
	addl	$1, -8(%rbp)
.L2:
	cmpl	$511, -8(%rbp)
	jle	.L3
	movl	$0, -8(%rbp)
	jmp	.L4
.L5:
	movl	$0, %edi
	call	time
	movq	%rax, -16(%rbp)
	movl	-8(%rbp), %eax
	cltq
	movl	-2080(%rbp,%rax,4), %eax
	movl	%eax, -4(%rbp)
	movl	$0, %edi
	call	time
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	subq	%rax, %rdx
	movl	$.LC0, %eax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	addl	$1, -8(%rbp)
.L4:
	cmpl	$511, -8(%rbp)
	jle	.L5
	movl	-4(%rbp), %eax
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.4.3-4ubuntu5.1) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
