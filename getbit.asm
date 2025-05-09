section .text
   getbit:
        push ebp
        mov ebp, esp
        mov eax, [ebp+12]
        mov edx, [ebp+8]
        mov ecx, eax
        sar edx, cl
        mov eax, edx 
        and eax, 1
        pop ebp
        ret