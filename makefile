CFLAGS = -Wall
CC = gcc


%.o: %.c NumClass.h
	$(CC) $(CFLAGS) -c $< -o $@

### Library creation
libclassloops.a: advancedClassificationLoop.o basicClassification.o
	ar rcs $@ $^

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	ar rcs $@ $^

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared -o $@ $^

libclassloops.so: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared -o $@ $^

mains: main.o libclassrec.a
	$(CC) -o mains main.o -L. -lclassrec -static

maindloop:main.o libclassloops.so
	$(CC) -o maindloop main.o -L. -lclassloops

maindrec: main.o libclassrec.so
	$(CC) -o maindrec main.o -L. -lclassrec

#### commands 
loop: libclassloops.a
recursives: libclassrec.a
recursived:libclassrec.so
loopd: libclassloops.so
all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec mains maindloop maindrec

clean:
	rm -f *.o *.a *.so

.PHONY: clean loop recursives recursived loopd mains maindloop maindrec all