section .text
   global suma
   global strlen_dummy
   global strchr_dummy
   global getbit


  suma:
    push ebp,esp
    mov edx,[ebp+8]
    mov eax,[ebp+12]
    add eax,edx
    pop ebp
    ret

  strlen_dummy:
     push ebp
     mov eb, esp
     