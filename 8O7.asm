%INCLUDE "lib.h"
global _start

section .data
list dw 10,13,15
size dw 3
list2 dw 8,9,16
size2 dw 3

lol db "LOL!!!", 13, 10, 0
endl db 13, 10, 0

section .bss
input resb 12
out_put resb 16
list_out resw 20
section .code
_start:
    mov edx,0
    mov eax,0
    mov ecx,0
    mov ebx,0
    first_of_loop:
        mov eax,0
        cmp dx,[size]    
        je if_list_one_be_empty
        cmp bx,[size2]
        je if_list_two_be_empty
        mov ax,[list + edx*2]
        cmp ax,[list2+ ebx*2]   
        jle list1_lower_list2
        jmp list1_biger_list2
        if_list_one_be_empty:
            puts lol
            cmp [size2],bx
            je end
            mov eax,0
            mov ax,[list2+ebx*2]
            mov [out_put+ecx*2],eax
            inc ebx
            inc ecx
            jmp if_list_one_be_empty
        if_list_two_be_empty:
            cmp dx,[size]
            je end
            mov eax,0
            mov ax,[list+edx*2]
            mov [out_put+ecx*2],eax
            inc edx
            inc ecx
            jmp if_list_two_be_empty
        list1_lower_list2:
            add edx,1
            mov [out_put+ecx*2],eax
            inc ecx
            jmp first_of_loop
        list1_biger_list2:
            
            mov eax,[list2+2*ebx]
            add ebx,1
            mov [out_put+2*ecx],eax
            inc ecx
            jmp first_of_loop

end:
mov eax,1
mov ebx,0
int 0x80
