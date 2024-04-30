sort: sort.o
	ld sort.o -o sort

sort.o: sort.asm
	nasm -f elf64 sort.asm -o sort.o

clean:
	rm -f sort sort.o