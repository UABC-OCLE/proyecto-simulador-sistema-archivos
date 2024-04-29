# Regla principal para compilar el programa
release: examen.bin

# Compila el programa final enlazando los archivos objeto de C y ASM
examen.bin: main.o code.o
	gcc -o examen.bin main.o code.o -no-pie

# Compila el archivo fuente de C en un archivo objeto
main.o: main.c
	gcc -Wall -c main.c -o main.o

# Compila el archivo fuente de ASM en un archivo objeto
code.o: code.asm
	nasm -f elf64 code.asm -o code.o

# Limpiar los archivos compilados y el ejecutable
clean:
	rm -f *.o *.bin
