# Kompilator C i konsolidator
CCOMP = gcc
LOADER = gcc

# Opcje kompilacji
OPT = -g -DDEBUG
# OPT = -O3

# Pliki naglowkowe i biblioteka statyczna
LIBDIR = ../pomiar_czasu_lib
INC = -I$(LIBDIR)
LIB = -L$(LIBDIR) -lpomiar_czasu

moj_program: moj_program.o $(LIBDIR)/libpomiar_czasu.a
	$(LOADER) $(OPT) moj_program.o -o moj_program $(LIB)

moj_program.o: moj_program.c $(LIBDIR)/pomiar_czasu.h
	$(CCOMP) -c $(OPT) $(INC) moj_program.c

pomiar_czasu.o: pomiar_czasu.c $(LIBDIR)/pomiar_czasu.h
	$(CCOMP) -c $(OPT) $(INC) pomiar_czasu.c

$(LIBDIR)/libpomiar_czasu.a: pomiar_czasu.o
	ar rs $@ $<

clean:
	rm -f *.o moj_program wyniki_io.txt $(LIBDIR)/libpomiar_czasu.a
