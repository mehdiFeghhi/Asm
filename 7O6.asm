%INCLUDE "lib.h"
global _start

section .data
get_n db "please enter how much number : ",0
is_equal db"this value are same",0
output_char db 0AH,0DH,"",0
reasult  dw 0
section .bss
N resb 12
NI resw 1
output2 resb 12
section .code
_start:
    puts get_n
    fgets N,12
    a2i 12,N
    mov [NI],eax
    Lable_one :
        cmp eax,0
        je End_Lable_one
        add [reasult],eax
        sub eax,1
        jmp Lable_one
    End_Lable_one:
    mov ax,word[NI]
    mov edx,eax
    add eax,1
    mul dx
    mov cl,2
    div cl
    mov bx,word[reasult]
    cmp ax,bx
    jne end_of
    puts is_equal
    puts output_char
    end_of:
end:
mov eax,1
mov ebx,0
int 0x80
