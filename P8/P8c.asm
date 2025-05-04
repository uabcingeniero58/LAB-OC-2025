%include "./LIB/pc_iox.inc"
extern pHex_b  

section .data
    msg_titulo db "Suma de vectores:", 10, 13, 0
    msg_vector1 db "Vector 1: ", 0
    msg_vector2 db "Vector 2: ", 0
    msg_resultado db "Resultado: ", 0
    prefijo_hex db "0x", 0
    espacio db "  ", 0
    nuevaLinea db 10, 13, 0
    vector1 db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    vector2 db 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

section .text
    global _start

_start:
    mov edx, msg_titulo
    call puts
    
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