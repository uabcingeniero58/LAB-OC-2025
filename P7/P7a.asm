%include "../LIB/pc_iox.inc"

section .data
    msg_prompt db "Ingrese un digito (0-9): ", 0
    msg_menor db "El caracter capturado es menor que '5'", 0
    msg_mayor db "El caracter capturado es mayor o igual a '5'", 0
    msg_error db "Error: El caracter no es un digito (0-9)", 0

section .bss
    caracter resb 1

section .text
    global _start

_start:
    ; Mostrar mensaje de solicitud
    mov eax, 4          ; syscall write
    mov ebx, 1          ; stdout
    mov ecx, msg_prompt
    mov edx, 25         ; longitud del mensaje
    int 0x80

    ; Capturar un carácter usando getche
    call getche
    mov [caracter], al  ; Almacenar el carácter ingresado

    ; Verificar si está en el rango '0' a '9'
    cmp al, '0'
    jb fuera_rango
    cmp al, '9'
    ja fuera_rango

    ; Verificar si es menor que '5'
    cmp al, '5'
    jb es_menor

    ; Si es mayor o igual a '5'
    mov ecx, msg_mayor
    jmp imprimir

es_menor:
    mov ecx, msg_menor
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