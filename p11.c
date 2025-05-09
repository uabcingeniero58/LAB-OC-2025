#include <stdio.h>

extern int getbit(int value, int numbit);

int main() {
    int dato = 1;
    int num_bit = 0;
    int resultado = getbit(dato, num_bit);

    printf("El bit %d del dato %x es %d\n", num_bit, dato, resultado);

    return 0;
}