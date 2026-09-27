# Makefile for COS284 Assembly Practical 3

ASM      = yasm
ASMFLAGS = -f elf64 -g dwarf2

TARGETS  = task1 task2 task3 task4 task5
OBJECTS  = $(TARGETS:=.o)
SOURCES  = $(TARGETS:=.asm)

# Your C harness + any test data
HARNESS  = main.c
PROGRAM  = library

.PHONY: all clean run zip

all: $(OBJECTS)

%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

# Build a local test executable (gcc, NOT ld)
$(PROGRAM): $(OBJECTS) $(HARNESS)
	gcc -o $@ $(HARNESS) $(OBJECTS)

run: $(PROGRAM)
	./$(PROGRAM)

zip: clean
	zip u25004141.zip $(SOURCES)

clean:
	rm -f $(OBJECTS) $(PROGRAM) u25004141.zip