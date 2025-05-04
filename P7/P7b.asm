%include "../LIB/pc_iox.inc"

section .data
    msg_prompt db "Ingrese un caracter (0-9 o A-Z): ", 0
    msg_numero db "El caracter capturado es un numero", 0
    msg_letra db "El caracter capturado es una letra", 0
    msg_error db "Error: El caracter no esta en los rangos validos", 0

section .bss
    caracter resb 1

section .text
    global _start

_start:
    ; Mostrar mensaje de solicitud
    mov eax, 4          ; syscall write
    mov ebx, 1          ; stdout
    mov ecx, msg_prompt
    mov edx, 32         ; longitud del mensaje
    int 0x80

    ; Capturar un carácter usando getche
    call getche
    mov [caracter], al  ; Almacenar el carácter ingresado

    ; Verificar si es un número ('0' a '9')
    cmp al, '0'
    jb verificar_letra
    cmp al, '9'
    ja verificar_letra
    
    ; Es un número
    mov ecx, msg_numero
    jmp imprimir

verificar_letra:
    ; Verificar si es una letra ('A' a 'Z')
    cmp al, 'A'
    jb fuera_rango
    cmp al, 'Z'
    ja fuera_rango
    
    ; Es una letra
    mov ecx, msg_letra
    jmp imprimir

fuera_rango:
    mov ecx, msg_error

imprimir:
    push ecx
    call puts
    add esp, 4

salir:
    ; Salir del programa
    mov eax, 1          ; syscall exit
    xor ebx, ebx        ; código de salida 0
    int 0x80