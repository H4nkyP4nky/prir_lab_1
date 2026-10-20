#include <stdio.h>

#include "pomiar_czasu.h"

#define LICZBA_ITERACJI 10000000

int main(void)
{
    volatile double wynik = 0.0;
    FILE *plik;

    printf("Petla arytmetyczna:\n");
    inicjuj_czas();
    for (int i = 0; i < LICZBA_ITERACJI; i++) {
        wynik += (double)i * 0.5;
    }
    drukuj_czas();
    printf("Wynik obliczen: %.1f\n", (double)wynik);

    plik = fopen("wyniki_io.txt", "w");
    if (plik == NULL) {
        perror("Nie mozna otworzyc pliku wyniki_io.txt");
        return 1;
    }

    printf("Petla wejscia/wyjscia (zapis do pliku):\n");
    inicjuj_czas();
    for (int i = 0; i < LICZBA_ITERACJI; i++) {
        if (fputc('x', plik) == EOF) {
            perror("Blad zapisu do pliku");
            fclose(plik);
            return 1;
        }
    }
    if (fflush(plik) == EOF) {
        perror("Blad zapisu do pliku");
        fclose(plik);
        return 1;
    }
    drukuj_czas();

    if (fclose(plik) == EOF) {
        perror("Blad zamykania pliku");
        return 1;
    }

    return 0;
}