#include <stdio.h>

 extern int suma(int a, int b);
 extern int strlen_dummy(const char* str);
 extern char* strchr_dummy(const char* str, int c)
 extern int getbit(int num, int pos);

 int main(){
    int resultado = suma(10, 5)
    printf("suma: 10 + 5 = %d\n",resultado)

    const char* texto = "hola mundo";
    int longitud = strlen_dummy(texto);
    printf("longitud de '%s': %d caracteres\n", texto, longitud);

    char caracter ='m'
    char* encontrado = strchr_dummy(texto, caracter);
    if (encontrado){
        printf("Caracter '%c' encontrado en la posición: %d\n", caracter, encontrado - texto);
    } else {
        printf("Caracter '%c' no encontrado\n", caracter);
    }

    int numero = 42; 
    for (int i = 0; i < 8; i++) {
        printf("Bit %d de %d: %d\n", i, numero, getbit(numero, i));
        
 }