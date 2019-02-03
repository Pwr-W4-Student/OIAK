
SYSEXIT = 1
EXIT_SUCCESS = 0
SYSWRITE = 4
STDOUT = 1

#x^2-3 przedzial 1 do 4
#x^a-b przedzial k do l

.global calka

#.type calka, @function

.data
        a: .long 2
        b: .long 2

        k: .long 0
        l: .long 1
        n: .long 10 #ilosc przedzialow

	format: .asciz "%i"

.bss
        .comm wynik, 4
        .comm y, 4
        .comm step, 4
        .comm x, 4

.text 



.type calka, @function
.type f, @function

calka:

push %rbp
mov %rsp, %rbp

mov %rdi, a
mov %rsi, b
mov %rdx, k
mov %rcx, l
mov $2000, %r8
mov %r8, n

# (l-k)/n
	fldz				#zerowanie st(0)
	fst wynik			#zapis z do wynik
	fild l				#zaladowanie do st(0) l
	fisub k				#odjecie k do st(0)  l-k
	fild n				#wczytanie n do st(0)
	fdivr %st(1), %st(0)		#podzielenie st(1) przez st(0) (l-k)/n
	fstps step 			#zapis wyniku do step
	fild k				#wczytanie poczatku przedzialu

	fstp x				#zapis poczatku przedzialu do x

	xor %rdi, %rdi			#zerowanie licznika
	mov n, %rdi			#liosc przedzialow
loop:
	dec %rdi
	fld x				#wczytanie x do st(0)
	fadd step			#dodanie korku do st(0)
	fst x				#zapis wyniku do x

#	call f
	jmp f
dalej:

	fmul step			#pomnozenie wyniku funkcji przez step

	fadd wynik			#dodawnie wyniku funkcji do wyniku
	fstp wynik			#zapis do wynik

	cmp $0, %rdi			#jezeli edi != 0
	jne loop
	jmp end

f:
#	pushq %ebp			#wskaznik na stos
#	movq %esp, %ebp

#	push %rbx
#	mov %rsp, %rbp

	#fild x
	fmul %st(0)			#podniesienie do kwadratu
	fiadd b				#odjecie b

#	movq %ebp, %esp
#       popq %ebp

#	mov %rbp, %rsp
#	pop %rbp

#	ret

	jmp dalej
end:

movss wynik, %xmm0
mov %rbp, %rsp
pop %rbp
ret
#	fld wynik
#	movss wynik, %xmm0
#	push %rbp
#	mov $format, %rdi
#	mov $wynik, %rsi
#	movq %xmm0, %rsi
#	mov $0, %rax


#		mov $5, %edx
#		movq %edx, $wynik
#		mov $0, %eax
#		mov $wynik, %edi
#		mov %ebx, (%edi)
#		mov %edx, 4(%edi)
#		mov %ecx, 8(%edi)

#		push $wynik
#		push $format
#		call printf
#		add $8, %esp
#		push $0
#		call exit

#	pop %rbp
#	mov $0, %rax
#	ret



#mov $SYSEXIT, %eax
#mov $EXIT_SUCCESS, %ebx
#int $0x80

