%INCLUDE "lib.h"
global _start

section .data




salam db "salam", 13, 10 ,0
puts1 db "Please input a positive number in hex (4 digits max.): ",13,10,0
puts2 db "The decimal equivalent of A10FH is ",10,0
puts3 db "Do you want to terminate the program (Y/N): ",13,10,0
puts4 db "                                              ",13,10,0

tavan3 dw 4096
tavan2 dw 256
tavan1 dw 16
tavan0 dw 1
resultI dw 0

section .bss
input resb 2
input2 resb 12
result resb 12
section .code
_start:
    puts puts1
    fgets input2,12
    mov ecx,0
    mov [resultI],ecx
    while_1:
        cmp ecx,4
            je end_while_1
        cmp ecx,3
            mov bx,word[tavan0]
            je step_2
        cmp ecx,2
            mov bx,word[tavan1]
            je step_2
        cmp ecx,1
            mov bx,word[tavan2]
            je step_2
        cmp ecx,0
            mov bx,word[tavan3]
            je step_2
        step_2:
            mov al,Byte[input2+ecx]
            cmp al,'0'
                jl step_1 
            cmp al,'9'
                jg step_1
            sub al,'0'
            jmp step_3
            step_1:
            cmp al,'A'
                jl end
            cmp al,'F'
                jg end
            sub al,'A'
            add al,10
            step_3:
            mov dx,0
        while_2:
            cmp bx,0
                je end_while_2
            add dx,ax
            dec bx
            jmp while_2
        end_while_2:
        add [resultI],dx
        inc cx
        jmp while_1    
    end_while_1:
    mov ax,0
    mov eax,[resultI]
    i2a eax,result
    puts result
end:
mov eax,1
mov ebx,0
int 0x80
