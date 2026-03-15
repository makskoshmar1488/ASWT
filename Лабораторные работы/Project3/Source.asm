.686
.model flat,stdcall
.stack 100h

.data
X   dw 100
Y   dw 21
Z   dw 4
M   dw ?

.code
ExitProcess PROTO STDCALL :DWORD

Start:
    mov ax, X      
    ror ax, 3       
    mov bx, ax  

    mov cx, Y       
    ror cx, 3       

    mov dx, Z       
    ror dx, 3       

   
    mov ax, bx      
    shl ax, 1       
    add ax, bx      

  
    add ax, cx      
    or  ax, dx

exit:
   Invoke ExitProcess, ax
End Start