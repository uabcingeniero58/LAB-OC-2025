#include <stdio.h>
#include <stdint.h>

extern void pBin8b(uint8_t dato);
extern void pBin16b(uint16_t dato);
extern void pBin32b(uint32_t dato);
extern void pBin64b(uint64_t dato);

int main(void){
    printf("prueba pBin8b con valor 42 : \n");
    pBin8b(42);
    

    printf("\nprueba para pBin16b con valor 3333 : \n");
    pBin16b(3333);
}