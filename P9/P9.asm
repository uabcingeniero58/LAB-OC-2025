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
     mov ebp, esp
     sub esp,16
     mov DWORD [epb-4],1
     jmp .next

    .upper:
      add DWORD [ebp-4],1
      add DWORD [ebp+8],1
      
    .next:
      mov eax,[ebp+8]
      movzx eax, BYTE [eax]
      test al,al
      jne .upper
      mov eax,[ebp-4]
      leave
      ret

    strchr_dummy:
     push epb
     mov ebp,esp
     jump .dump1

     .dump5:
      mov eax,[ebp+8]
      movzx eax, BYTE [eax]
      mov edx,[ebp+12]
      cmp al,dl
      jne .dump3
      mov eax,[epb+8]
      jmp .dump4

    .dump3:
      add DWORD [ebp+8],1

    .dump2:
      mov eax,[ebp+8]
      movzx eax,BYTE [eax]
      test al,al
      jne .dump5
      mov eax,0

    .dump4
     pop epb
     ret
        
     
    getbit:
      push ebp
      mov ebp,esp
      mov eax,[ebp+12]
      mov edx,[ebp+8]
      mov ecx,eax
      sar edx,cl
      mov eax,edx
      and eax,1
      pop ebp
      ret