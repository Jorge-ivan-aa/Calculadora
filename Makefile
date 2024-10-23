ASM = nasm
LINKER = ld
ASM_FLAGS = -f elf64

OBJS = build/main.o build/math.o build/io.o build/error_handler.o

all: calculadora

calculadora: $(OBJS)
	$(LINKER) -o calculadora $(OBJS)

build/main.o: src/main.asm
	$(ASM) $(ASM_FLAGS) -o build/main.o src/main.asm

build/math.o: src/math.asm
	$(ASM) $(ASM_FLAGS) -o build/math.o src/math.asm

build/io.o: src/io.asm
	$(ASM) $(ASM_FLAGS) -o build/io.o src/io.asm

build/error_handler.o: src/error_handler.asm
	$(ASM) $(ASM_FLAGS) -o build/error_handler.o src/error_handler.asm

clean:
	rm -f build/*.o calculadora
