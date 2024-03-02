.686 
.model flat,stdcall 
 
.stack 100h 
 
.data 
 
 x dw 9d
 y dw 44d
 z dw 12d
 z_ dw 0
 x_ dw 0

.code 

ExitProcess PROTO STDCALL :DWORD 
Start: 
 
 xor eax,eax
 xor ebx,ebx
 xor ecx,ecx
 xor edx,edx
 
 mov ax,x
 mov bx,y

 xor ax,11110000b;Z'
 xor bx,11110000b;X'

 mov word ptr z_,ax
 mov word ptr x_,bx
 or ax,bx
 mov bx,y
 and ax,bx
 mov cx,ax
 mov ax,x_
 mov bx,z
 div bx
 add ax,cx


exit: 
Invoke ExitProcess,1 
End Start 