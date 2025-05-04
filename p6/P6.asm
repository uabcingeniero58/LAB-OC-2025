%include "../LIB/pc_iox.inc"

section .data
    newline db 10, 0   ; Cambio de línea

section .text
    global _start

_start:

;a.-Coloque en EAX	el valor 0x22446688	y por medio	de rotaciones obtener 0x82244668.

mov eax , 0x22446688
ror eax, 4
call pHex_dw

;b.-Coloque	en CX el valor 0x3F48 y por medio de corrimientos obtener 0xFA40
mov cx,0x3F48
shl cx,4
call

;c.-Colocar en el registro ESI el valor 0x20D685F3
mov esi, 0x20D685F3
xor esi, 0x40022021
call pHex_dw

;d.-Guardar ESI en la pila	
push esi

;e.-Colocar	en	el	registro	CH	el	valor	0xA7
mov ch, 0xA7
or ch, 0x48
call

;f.-Colocar	en	el	registro	BP	el	valor	0x67DA	
mov bp,0x67DA
and bp,0xDFA9
call

;g.-Dividir	BP entre 8 usando operaciones de manipulación de bits:
div bp,0x8

;h.-Dividir	EBX	entre 32 usando	operaciones	de manipulación de bits.
div eax,0x32
call

;i.-Multiplicar	CX por 8 usando	operaciones de manipulación	de bits
mul cx,8
call

;j.- Sacar un valor de la pila y guardarlo en ESI.	
pop eax
mov esi,eax
call

;k.- Multiplicar ESI por 10	usando operaciones de manipulación	de bits.
mul esi, 0xA
call