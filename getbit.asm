section .text
global getbit

getbit:
    push ebp
    mov ebp, esp
    mov eax, dword[ebp+12]
    mov edx, dword[ebp+8]
    mov ecx, eax
    sar edx, cl
    mov eax, edx 
    and eax, 1
    pop ebp
    ret
