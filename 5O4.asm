%INCLUDE "lib.h"
global _start

section .data
out_put_char db "Please input your number : ",0
out_how_much db "Please enter how much number want to add : ",0
output_char db "                                                          ",0
section .bss
save resd 1
save1 resd 1
small resd 1 
 
input resb 12
output resb 12
section .code
_start:
    puts out_how_much
    fgets input,12
    a2i 12,input
    push eax
    puts out_how_much
    fgets input,12
    a2i 12,input
    push eax
    puts out_how_much
    fgets input,12
    a2i 12,input
    push eax
    call compare_tree_number
    i2a eax,output
    puts output
    i2a ebx,output
    puts output
    call end
end:
mov eax,1
mov ebx,0
int 0x80

compare_tree_number:
    pop edx
    mov [save],edx
    pop eax
    pop ebx
    pop edx
    cmp eax,ebx 
    jl label_one
        mov [small],ebx
        jmp end_label_one
    label_one:
        mov [small],eax
        mov eax,ebx
    end_label_one:
    cmp eax,edx
    jl label_tow
        cmp edx,[small]
        jl end_lable_3
            mov [small],edx
        end_lable_3:
        jmp end_label_two
    label_tow:
        mov eax,edx
    end_label_two:
    mov ebx,[small]
    mov edx,[save]
    push edx
ret
