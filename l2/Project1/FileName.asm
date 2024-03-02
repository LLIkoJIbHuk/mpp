.686
.model flat,stdcall
.stack 100h
 
.data 
;arr dw 0ab7ch,0c58eh,0abcdh ;массив исходных данных
arr dw 0ab7ch,0c53eh,0abc1h ;массив дл€ верификации
len equ ($-arr)/2
m dw 1110100111011111b ;маска дл€ обнулени€ битов
.code
ExitProcess PROTO STDCALL :DWORD
Start:

xor eax,eax
xor ebx,ebx
xor ecx,ecx
xor edx,edx

lea esi,[arr]
lea edi,[arr]
mov cx,len
mov bx,m
@cycle:
lodsw
and ax,bx
stosw
loop @cycle

lea esi,[arr]
lodsw 

mov bx,ax
lodsw

and ax,bx
mov bx,ax ;лева€ часть в bx

lodsw 
not ax

sub bx,ax ;ћ в BX
mov ax,bx
mov bl,al

and bl,11111111b
jp pp1
jnp pp2

pp1:
clc
sar ax,6
stc
jmp ifc

pp2:
clc
mov bx, 0f1f1h
and ax,bx
jmp ifc

ifc:
jc adr1
jnc adr2

adr1:
add ax,1
jmp exit

adr2:
or ax,1021h

exit:
Invoke ExitProcess,1
End Start 
