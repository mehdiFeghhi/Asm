%INCLUDE "lib.h"
global _start

section .data



section .bss
input resb 12
output resb 12

section .code
_start:
    mov eax,0
    mov ebx,0
    fgets input,12
    a2i   12,input
    mov bl,al
    mov eax,0
    mov al,bl
    call absw
    i2a  eax,output
    puts output
end:
mov eax,1
mov ebx,0
int 0x80

absw:
   clc
   rcl  al,1
   jc is_manfi
    rcr  al,1
    ret
   is_manfi:
    rcr al,1
    mov edx,1
    mov cl,al
    mov bl,255
    clc 
    Labeleme:
        rcr cl,1
        jc end_Labelme
        shl bl,1
        shl dl,1
        jmp Labeleme
    end_Labelme:
    xor al,bl
    or  al,dl
    ret
