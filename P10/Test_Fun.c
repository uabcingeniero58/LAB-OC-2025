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


    printf("\nprueba para pBin32b con valor 123456 : \n");
    pBin32b(123456);

    
    printf("\nprueb para pBin64b con valor 18446744073709551615ULL : \n");
    pBin64b(18446744073709551615ULL);

    return 0;
}
