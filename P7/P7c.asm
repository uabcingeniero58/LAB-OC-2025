%include "../LIB/pc_iox.inc"

section .data
    asterisco db '*'
    mensaje db "Ingrese la cantidad de asteriscos (0-40): ", 0
    nueva_linea db 10    ; caracter de salto de línea

section .bss
    cantidad resb 2

section .text
    global _start

_start:
    ; Mostrar mensaje solicitando la cantidad
    mov eax, 4              ; syscall write
    mov ebx, 1              ; stdout
    mov ecx, mensaje
    mov edx, 42             ; longitud del mensaje
    int 0x80

    ; Leer la cantidad
    mov eax, 3              ; syscall read
    mov ebx, 0              ; stdin
    mov ecx, cantidad
    mov edx, 2
    int 0x80

    ; Convertir ASCII a número
    movzx cx, byte [cantidad]
    sub cx, '0'             ; Convertir de ASCII a valor numérico
    
    ; Verificar que esté en el rango 0-40
    cmp cx, 0
    jl salir
    cmp cx, 40
    jg salir

    ; Imprimir asteriscos
    mov edx, cx             ; Guardar contador en edx
    test edx, edx           ; Verificar si es 0
    jz fin_asteriscos

bucle_asteriscos:
    ; Imprimir un asterisco
    push edx                ; Guardar contador
    
    mov eax, 4              ; syscall write
    mov ebx, 1              ; stdout
    mov ecx, asterisco
    mov edx, 1
    int 0x80
    
    pop edx                 ; Restaurar contador
    dec edx                 ; Decrementar contador
    jnz bucle_asteriscos    ; Repetir si no es cero

fin_asteriscos:
    ; Imprimir salto de línea
    mov eax, 4              ; syscall write
    mov ebx, 1              ; stdout
    mov ecx, nueva_linea
    mov edx, 1
    int 0x80

salir:
    ; Salir del programa
    mov eax, 1              ; syscall exit
    xor ebx, ebx            ; código de salida 0
    int 0x80