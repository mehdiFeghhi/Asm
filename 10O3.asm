%INCLUDE "lib.h"
global _start

section .data
please db "Please enTer your string  : ",0
please2 db "your input is Palindrome",13,10,0
lol db "your input is no Palindrome", 13, 10, 0
endl db 13, 10, 0

section .bss
input resb 35
section .code
_start:
    puts please
    fgets input,35
    mov eax,input
    push eax
    call Palindrome
    cmp eax,1
        je is_palindrome
    puts lol
    jmp end
    is_palindrome:
        puts please2
end:
mov eax,1
mov ebx,0
int 0x80

Palindrome:
    enter 0,0
    mov ebx,[ebp+8]
    mov eax,ebx
    loop1:
        cmp byte[ebx],0
            je end_loop1
        inc ebx
        jmp loop1
    end_loop1:
    dec ebx
    loop2:
        cmp byte[eax],0
            je end_loop2
        cmp byte[ebx],'A'
            jl if_notAlfabat
        cmp byte[ebx],'z'
            jg if_notAlfabat
        if_alfabat:    
            mov edx,0
            mov dl,byte[ebx]
            cmp dl,byte[eax]
                je is_equle
            mov dl,byte[eax]
            sub dl,byte[ebx]
            cmp dl,32
                je Ok
            cmp dl,-32
                je Ok
            jmp NotOk
            Ok:
                jmp is_equle
            NotOk:
              mov eax,0
              leave
              ret
            if_notAlfabat:
                    mov dl,byte[eax]
                    cmp byte[ebx],dl
                        je is_equle
                    mov eax,0
                    leave
                    ret
        is_equle:
            dec ebx
            inc eax
            jmp loop2
        end_loop2:
        mov eax,1
        leave
        ret
