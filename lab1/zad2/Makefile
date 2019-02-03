compile: source.s
	as -g --32 source.s -o source.o
	ld -melf_i386 source.o -o source
	rm -f source.o
	./source
clean:
	rm -f source.o 
run:
	./source

