CFLAGS = -Wall
CC = gcc

# List of source files
SOURCES = advancedClassificationLoop.c advancedClassificationRecursion.c basicClassification.c main.c

# List of object files
OBJECTS = $(SOURCES:.c=.o)

### Pattern rule for object file compilation
%.o: %.c NumClass.h
ifeq ($(wildcard $@),)
    $(CC) $(CFLAGS) -c $< -o $@
else
    @echo "$@ already exists. Skipping compilation."
endif

### Library creation rules
libclassloops.a: advancedClassificationLoop.o basicClassification.o
ifeq ($(wildcard $@),)
    ar rcs $@ $^
else
    @echo "$@ already exists. Skipping library creation."
endif

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
ifeq ($(wildcard $@),)
    ar rcs $@ $^
else
    @echo "$@ already exists. Skipping library creation."
endif

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
ifeq ($(wildcard $@),)
    $(CC) -shared -o $@ $^
else
    @echo "$@ already exists. Skipping shared library creation."
endif

libclassloops.so: advancedClassificationLoop.o basicClassification.o
ifeq ($(wildcard $@),)
    $(CC) -shared -o $@ $^
else
    @echo "$@ already exists. Skipping shared library creation."
endif

### Executable targets
mains: main.o libclassrec.a
ifeq ($(wildcard $@),)
    $(CC) -o $@ $^ -static
else
    @echo "$@ already exists. Skipping executable creation."
endif

maindloop: main.o libclassloops.so
ifeq ($(wildcard $@),)
    $(CC) -o $@ $^
else
    @echo "$@ already exists. Skipping executable creation."
endif

maindrec: main.o libclassrec.so
ifeq ($(wildcard $@),)
    $(CC) -o $@ $^
else
    @echo "$@ already exists. Skipping executable creation."
endif

### Phony targets
loop: libclassloops.a
recursives: libclassrec.a
recursived:libclassrec.so
loopd: libclassloops.so

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec

clean:
    rm -f *.o *.a *.so mains maindloop maindrec

.PHONY: clean loop recursives recursived loopd mains maindloop maindrec all
