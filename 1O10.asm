%INCLUDE "lib.h"
global _start

section .data
please db "Please enTer your string  : ",0
please2 db "Please say how much of its char be copy : ",0
lol db "our destanation is : ", 13, 10, 0
endl db 13, 10, 0

section .bss
input resb 12
des resb 19
src resb 16
section .code
_start:
    puts please
    fgets src,16
    mov edx,src
    mov ebx,des
    puts please2
    fgets input,12
    a2i   12,input
    push ebx
    push edx
    push eax
    call Str_ncpy1
    puts des
end:
mov eax,1
mov ebx,0
int 0x80

Str_ncpy1:
    enter 0,0
    mov ecx,[ebp+8]
    mov edx,[ebp+12]
    mov ebx,[ebp+16]
    mov eax,0
    Looop1:
        cmp ecx,0
            je End_loop1
        mov al,byte[edx]
        mov byte[ebx],al
        mov eax,0
        inc ebx
        inc edx
        dec ecx
        jmp Looop1
        End_loop1:
    Loop2:
        cmp byte[edx],0
            je end_Loop2
        inc edx
        jmp Loop2
        end_Loop2:
        mov al,byte[edx]
        mov byte[ebx],al
    leave 
    ret 


