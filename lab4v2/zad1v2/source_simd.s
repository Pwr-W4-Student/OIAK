.data
	n: .long 2000 # ilosc przedzialow
	x: .float 1, 2, 3, 4
	fours: .float 4, 4, 4, 4
	zeros: .float 0, 0, 0, 0
	k: .int 2
	l: .int 1

.bss
	.comm bb, 4
	.comm step, 16
	.comm a, 16
	.comm b, 16
	.comm kk, 16
	.comm wynik, 16

.text

.global calka_simd
.type calka_simd, @function

.type f, @function

calka_simd:

	push %rbp
	mov %rsp, %rbp

	mov %rdx, k
	mov %rcx, l
	mov %rsi, bb

	movq $0, %rcx		#iterator
	load_a:
		mov %rdi, a(,%rcx, 4)
		inc %rcx
		cmp $4, %rcx
		jne load_a

	cvtsi2ss %rsi, %xmm0
	movq $0, %rcx
	load_b:
		movss %xmm0, b(, %rcx, 4)
		inc %rcx
		cmp $4, %rcx
		jne load_b # dalej
#		jmp load_b
#	dalej:


	cvtsi2ss %rdx, %xmm0
	movq $0, %rcx
        load_kk:
                movss %xmm0, kk(, %rcx, 4)
                inc %rcx
                cmp $4, %rcx
                jne load_kk

#obliczenie szerokosci przedzialow

#	mov %rdx, k
#	mov %rcx, l
	movss l, %xmm1
	subss k, %xmm1
	movq $2000, n
	divss n, %xmm1		#szerokosc przedzialow jest w %xmm1


	movq $0, %rsi
	load_step:
		movss %xmm1, step(, %rsi, 4)
		inc %rsi
		cmp $4, %rsi
		jne load_step

		movups step, %xmm1	#w %xmm1 przechowywane jest przesuniecie



	movups zeros, %xmm3
	movups kk, %xmm0
	movups x, %xmm2
#	addps %xmm2, %xmm3  	#xmm3 = [1+0, ... ,4+0]
#	mulps step, %xmm3	#xmm3 = [1+0, ... , 4+0]*step
#	addps %xmm0, %xmm3	#xmm3 = [kk + xmm3, ...]

	movups zeros, %xmm7
	xor %rdi, %rdi
	mov $2000, %rdi
	shrq $2, %rdi
	loop:
		movups zeros, %xmm3
		addps %xmm2, %xmm3  	#xmm3 = [1+0, ... ,4+0]
	        mulps step, %xmm3       #xmm3 = [1+0, ... , 4+0]*step
	        addps %xmm0, %xmm3      #xmm3 =[kk + xmm3, ...]



		movups zeros, %xmm4
		addps %xmm3, %xmm4
		mulps %xmm4, %xmm4	#x^2
		movups b, %xmm6
		addps %xmm6, %xmm4		#x^2 +b

		movups fours, %xmm5
		addps %xmm5, %xmm2

		addps %xmm4, %xmm7

		dec %rdi
		cmp $0, %rdi
		jne loop

	mulps %xmm1, %xmm7	#xmm1 przesuniecie
	movq $0, %rsi
	movups %xmm7, wynik
	movups zeros, %xmm0

	suma:
		addss wynik(,%rsi, 4), %xmm0
		inc %rsi
		cmp $4, %rsi
		jne suma

	mov $1, %rcx






mov %rbp, %rsp
pop %rbp
ret
