%INCLUDE "lib.h"
global _start

section .data
first_name db "Please Enter your first name : ",0
last_name db "Please Enter your last_name : ",0
output_char db "                                                          ",0
char_mehdi db "mehdi Feghhi",0
section .bss
input resb 12
input2 resb 12
output resb 12
section .code
_start:
    mov edx,0
    mov ecx,0
    Loob1:
        cmp byte[char_mehdi+ecx],dl
        je end
        cmp byte[char_mehdi+ecx]," "
        je Loob2
        add ecx,1
        jmp Loob1
        Loob2:
        cmp byte[char_mehdi+ecx],dl
        je Loob3
        mov al,[char_mehdi+ecx]
        mov [output],al
        puts output
        inc ecx
        jmp Loob2
        Loob3:
        mov ecx,0
        mov al," "
        mov [output],al
        puts output
        Loob3_1:
            cmp byte[char_mehdi+ecx]," "
            je end
            mov al,[char_mehdi+ecx]
            mov [output],al
            puts output
            inc ecx
            jmp Loob3_1

end:    
mov eax,1
mov ebx,0
int 0x80
