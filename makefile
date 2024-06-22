CFLAGS = -Wall
CC = gcc

# List of source files
SOURCES = advancedClassificationLoop.c advancedClassificationRecursion.c basicClassification.c main.c

# List of object files
OBJECTS = $(SOURCES:.c=.o)

### Pattern rule for object file compilation
%.o: %.c NumClass.h
	$(CC) $(CFLAGS) -c $< -o $@

### Library creation rules
libclassloops.a: advancedClassificationLoop.o basicClassification.o
	ar rcs $@ $^

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	ar rcs $@ $^

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared -o $@ $^

libclassloops.so: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared -o $@ $^

### Executable targets
mains: main.o libclassrec.a
	$(CC) -o $@ $^ -static

maindloop: main.o libclassloops.so
	$(CC) -o $@ $^

maindrec: main.o libclassrec.so
	$(CC) -o $@ $^

### Phony targets
loop: libclassloops.a
recursives: libclassrec.a
recursived:libclassrec.so
loopd: libclassloops.so

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec

clean:
	rm -f *.o *.a *.so mains maindloop maindrec

.PHONY: clean loop recursives recursived loopd mains maindloop maindrec all
