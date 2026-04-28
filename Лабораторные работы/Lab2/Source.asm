.386
.model flat, stdcall
.stack 4096

.data
    X dw 87A3h
    Y dw 5322h
    Z dw 07F1h
    M dw 0
    R dw 0

.code
main PROC
    mov ecx, 3          
    lea esi, X          

shift_loop:
    mov ax, [esi]       
    ror ax, 3           
    mov [esi], ax       
    add esi, 2         
    loop shift_loop


    mov ax, X           
    sub ax, Z           
    add ax, Y           
    mov M, ax           
    cmp ax, 0
    jg call_pp1        
    call sub_pp2
    jmp check_r

call_pp1:
    call sub_pp1
check_r:
    mov ax, R
    cmp ax, 007Dh
    jg label_adr1       
    or ax, 17D1h
    mov R, ax
    jmp exit_prog

label_adr1:
    sar ax, 1          
    mov R, ax

exit_prog:
    ret
main ENDP
sub_pp1 PROC
    mov ax, M
    add ax, 5
    mov R, ax
    ret                 
sub_pp1 ENDP
sub_pp2 PROC
    mov ax, M
    neg ax              
    mov R, ax
    ret                 
sub_pp2 ENDP

END main