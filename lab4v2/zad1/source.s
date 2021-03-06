
SYSEXIT = 1
EXIT_SUCCESS = 0
SYSWRITE = 4
STDOUT = 1

#x^2-3 przedzial 1 do 4
#x^a-b przedzial k do l



.data
        a: .long 2
        b: .long 2

        k: .long 0
        l: .long 1
        n: .long 9999 #ilosc przedzialow

	format_f: .string "wynik: %f \n"

.bss
        .comm wynik, 4
        .comm y, 4
        .comm step, 4
        .comm x, 4

.text 

.global main

.type f, @function

main:

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
	dec %edi
	fld x				#wczytanie x do st(0)
	fadd step			#dodanie korku do st(0)
	fst x				#zapis wyniku do x

	call f

	fmul step			#pomnozenie wyniku funkcji przez step

	fadd wynik			#dodawnie wyniku funkcji do wyniku
	fstp wynik			#zapis do wynik

	cmp $0, %rdi			#jezeli edi != 0
	jne loop
	jmp end

f:
	pushq %rbp			#wskaznik na stos
	movq %rsp, %rbp

	#fild x
	fmul %st(0)			#podniesienie do kwadratu
	fisub b				#odjecie b

	movq %rbp, %rsp
        popq %rbp

	ret
end:
	fld wynik
	movsd wynik, %xmm0
  	movl $format_f, %edi
  	movl $1, %eax
  	call printf
	
	ret

mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80

