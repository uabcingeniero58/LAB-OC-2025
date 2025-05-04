%include "./LIB/pc_iox.inc"

section .data
    msg_prompt db "Ingrese un valor (0-9): ", 0
    msg_error db "Error: Solo se permiten valores de 0 a 9", 10, 13, 0
    msg_resultado db "Vector capturado exitosamente:", 10, 13, 0
    espacio db " ", 0
    nuevaLinea db 10, 13, 0
    vector times 10 db 0

section .bss
    tecla resb 1

section .text
    global _start

_start:
    mov ebx, vector
    mov ecx, 10
    call capturar_vector
    
    mov edx, msg_resultado
    call puts
    
    mov ebx, vector
    mov ecx, 10
    call mostrar_vector
    
    mov eax, 1
    xor ebx, ebx
    int 0x80

capturar_vector:
    push eax
    push edx
    push esi
    
    mov esi, 0
    
capturar_loop:
    cmp esi, ecx
    jge fin_captura
    
    mov edx, msg_prompt
    call puts
    
    call getche
    
    cmp al, '0'
    jl valor_invalido
    cmp al, '9'
    jg valor_invalido
    
    sub al, '0'
    
    mov byte [ebx + esi], al
    inc esi
    
    mov edx, nuevaLinea
    call puts
    
    jmp capturar_loop
    
valor_invalido:
    mov edx, msg_error
    call puts
    jmp capturar_loop
    
fin_captura:
    pop esi
    pop edx
    pop eax
    ret
    
mostrar_vector:
    push eax
    push ebx
    push ecx
    push edx
    
    mov esi, 0
    
mostrar_loop:
    cmp esi, ecx
    jge fin_mostrar
    
    mov al, [ebx + esi]
    add al, '0'
    
    call putchar
    
    mov edx, espacio
    call puts
    
    inc esi
    jmp mostrar_loop
    
fin_mostrar:
    mov edx, nuevaLinea
    call puts
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret