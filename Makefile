sort: sort.o
	ld sort.o -o sort

sort.o: sort.nasm
	nasm -f elf64 sort.nasm -o sort.o

clean:
	rm -f sort sort.o