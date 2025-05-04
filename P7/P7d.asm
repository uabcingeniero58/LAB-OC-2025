%include "../LIB/pc_iox.inc"

section .data
    msg_prompt db "Ingrese 10 caracteres:", 0
    msg_mostrar db "Caracteres capturados:", 0
    nueva_linea db 10, 0    ; caracter de salto de línea

section .bss
    arreglo resb 10         ; Arreglo para almacenar 10 caracteres

section .text
    global _start

_start:
    ; Mostrar mensaje de solicitud
    push msg_prompt
    call puts
    add esp, 4

    ; Capturar 10 caracteres
    mov edi, arreglo        ; Dirección del arreglo
    mov ecx, 10             ; Contador = 10 caracteres

capturar_bucle:
    push ecx                ; Guardar contador
    
    call getche             ; Capturar un carácter
    mov [edi], al           ; Almacenar en el arreglo
    inc edi                 ; Avanzar al siguiente elemento
    
    pop ecx                 ; Restaurar contador
    loop capturar_bucle     ; Decrementar ECX y repetir si no es cero

    ; Mostrar mensaje de resultados
    push msg_mostrar
    call puts
    add esp, 4

    ; Mostrar los caracteres en formato columna
    mov esi, arreglo        ; Dirección del arreglo
    mov ecx, 10             ; Contador = 10 caracteres

mostrar_bucle:
    push ecx                ; Guardar contador
    
    ; Imprimir el carácter
    movzx eax, byte [esi]
    push eax
    call putchar
    add esp, 4
    
    ; Imprimir salto de línea
    push nueva_linea
    call puts
    add esp, 4
    
    inc esi                 ; Avanzar al siguiente elemento
    pop ecx                 ; Restaurar contador
    loop mostrar_bucle      ; Decrementar ECX y repetir si no es cero

salir:
    ; Salir del programa
    mov eax, 1              ; syscall exit
    xor ebx, ebx            ; código de salida 0
    int 0x80