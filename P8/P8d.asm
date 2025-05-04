%include "./LIB/pc_iox.inc"
extern pHex_b

section .data
    msg_prompt db "Ingrese un valor (0-9) para vector 1: ", 0
    msg_prompt2 db "Ingrese un valor (0-9) para vector 2: ", 0
    msg_error db "Error: Solo se permiten valores de 0 a 9", 10, 13, 0
    
    msg_titulo db "Suma de vectores:", 10, 13, 0
    msg_vector1 db "Vector 1: ", 0
    msg_vector2 db "Vector 2: ", 0
    msg_resultado db "Resultado: ", 0
    prefijo_hex db "0x", 0
    espacio db "  ", 0
    nuevaLinea db 10, 13, 0
    
    vector1 times 10 db 0
    vector2 times 10 db 0

section .bss
    tecla resb 1

section .text
    global _start

_start:
    mov edx, msg_titulo
    call puts
    
    mov edx, msg_vector1
    call puts
    mov ebx, vector1
    mov ecx, 10
    call capturar_vector
    
    mov edx, msg_vector2
    call puts
    mov ebx, vector2
    mov ecx, 10
    call capturar_vector
    
    mov edx, msg_vector1
    call puts
    mov ebx, vector1
    mov ecx, 10
    call mostrar_vector_hex
    
    mov edx, msg_vector2
    call puts
    mov ebx, vector2
    mov ecx, 10
    call mostrar_vector_hex
    
    mov ebx, vector1
    mov edx, vector2
    mov ecx, 10
    call sumar_vectores
    
    mov edx, msg_resultado
    call puts
    mov ebx, vector1
    mov ecx, 10
    call mostrar_vector_hex
    
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
    
    cmp ebx, vector1
    je prompt_vector1
    mov edx, msg_prompt2
    jmp mostrar_prompt
    
prompt_vector1:
    mov edx, msg_prompt
    
mostrar_prompt:
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

sumar_vectores:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    
    mov esi, 0
    
sumar_loop:
    cmp esi, ecx
    jge fin_suma
    
    mov al, [ebx + esi]
    add al, [edx + esi]
    
    mov [ebx + esi], al
    
    inc esi
    jmp sumar_loop
    
fin_suma:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

mostrar_vector_hex:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    
    mov esi, 0
    
mostrar_loop:
    cmp esi, ecx
    jge fin_mostrar
    
    mov edx, prefijo_hex
    call puts
    
    mov al, [ebx + esi]
    call pHex_b
    
    mov edx, espacio
    call puts
    
    inc esi
    jmp mostrar_loop
    
fin_mostrar:
    mov edx, nuevaLinea
    call puts
    
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret