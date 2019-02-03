compile: source.s
	as -g --32 source.s -o source.o
	gcc -g -m32 -o source main.c source.o
	rm -f source.o
	./source
clean:
	rm -f source.o 
run:
	./source

