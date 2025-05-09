#include <stdio.h>

extern int getbit(int value, int numbit);
int dato = 1;
int num_bit=0;

int main(){
    printf("en bit %d del dato: %x es %d \n",num_bit, dato, getbit(dato,num_bit));
    return 0;
}