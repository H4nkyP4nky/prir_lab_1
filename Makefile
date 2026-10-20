# kompilator c
CCOMP = gcc

# konsolidator
LOADER = gcc

# opcje optymalizacji:
# wersja do debugowania
OPT = -g -DDEBUG
# wersja zoptymalizowana do mierzenia czasu
# OPT = -O3

# pliki naglowkowe
INC = -I../pomiar_czasu_lib

# biblioteki
LIBDIR = ../pomiar_czasu_lib
LIB = -L$(LIBDIR) -lpomiar_czasu

# zaleznosci i komendy
moj_program: moj_program.o $(LIBDIR)/libpomiar_czasu.a
	$(LOADER) $(OPT) moj_program.o -o moj_program $(LIB)

# jak uzyskac plik moj_program.o ?
moj_program.o: moj_program.c $(LIBDIR)/pomiar_czasu.h
	$(CCOMP) -c $(OPT) $(INC) moj_program.c


pomiar_czasu.o: pomiar_czasu.c $(LIBDIR)/pomiar_czasu.h
	$(CCOMP) -c $(OPT) $(INC) pomiar_czasu.c

$(LIBDIR)/libpomiar_czasu.a: pomiar_czasu.o
	ar rs $@ $<

clean:
	rm -f *.o moj_program wyniki_io.txt $(LIBDIR)/libpomiar_czasu.a
