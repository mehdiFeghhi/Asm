%INCLUDE "lib.h"
global _start

section .data
out_put_char db "Please input your number : ",0
output_char db 0AH,0DH,""
section .bss
save resd 1
save1 resd 1
input resb 12
output resb 12
section .code
_start:
    puts out_put_char
    fgets input,12
    a2i 12,input
    push eax
    puts out_put_char
    fgets input,12
    a2i 12,input
    push eax
    puts out_put_char
    fgets input,12
    a2i 12,input
    push eax
    call compare_tree_number
    i2a eax,output
    puts output
    puts output_char
    call end
end:
mov eax,1
mov ebx,0
int 0x80

compare_tree_number:
    enter 0,0
    mov eax,[ebp+8]
    mov ebx,[ebp+12]
    mov edx,[ebp+16]
    cmp eax,ebx
    jl label1
    end_label1:
    cmp eax,edx
    jl label2
    end_label2:
    mov edx,[save]
    push edx
    jmp end_me
    label1:
        mov eax,ebx 
        jmp end_label1
    label2:
        mov eax,edx
        jmp end_label2
    end_me:   
    leave
ret 
