%include "./LIB/pc_iox.inc"
extern pHex_b

section .data
    msg_titulo db "Mostrando vector en formato hexadecimal:", 10, 13, 0
    prefijo_hex db "0x", 0
    espacio db "  ", 0
    nuevaLinea db 10, 13, 0
    vector db 1, 2, 3, 4, 5, 6, 7, 8, 9, 0

section .text
    global _start

_start:
    mov ebx, vector      ; Dirección del vector
    mov ecx, 10          ; Tamaño del vector
    call desplegar_vector_hex
    
    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

desplegar_vector_hex:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    
    ; Mostrar el título
    mov edx, msg_titulo
    call puts
    
    mov esi, 0          ; Inicializar el índice en 0
    
desplegar_loop:
    cmp esi, ecx        ; Comparar el índice con el tamaño del vector
    jge fin_desplegar   ; Si es mayor o igual, terminar
    
    ; Mostrar el prefijo "0x"
    mov edx, prefijo_hex
    call puts
    
    ; Mostrar el valor en hexadecimal
    mov al, [ebx + esi]
    call pHex_b
    
    ; Mostrar un espacio entre elementos
    mov edx, espacio
    call puts
    
    inc esi             ; Incrementar el índice
    jmp desplegar_loop  ; Repetir para el siguiente elemento
    
fin_desplegar:
    ; Añadir una nueva línea al final
    mov edx, nuevaLinea
    call puts
    
    ; Restaurar registros
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret