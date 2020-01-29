%INCLUDE "lib.h"
global _start

section .data
hello db "Do you want to quit (Y/N):",0
puts1 db "Please input a positive number in hex (4 digits max.) it's your offset: ",13,10,0
puts2 db "Please input a positive number in hex (4 digits max.) it's your segmentation: ",13,10,0
output_char db "                                                          ",0
tavan3 dw 4096
tavan2 dw 256
tavan1 dw 16
tavan0 dw 1
resultI dw 0
resultII dw 0

section .bss
input2 resb 12
result resb 12
input resb 12
section .code
_start:

    puts puts1
    fgets input2,12
    puts puts2
    fgets input,12
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



    mov ecx,0
    mov [resultII],ecx
    while_11:
        cmp ecx,4
            je end_while_11
        cmp ecx,3
            mov bx,word[tavan0]
            je step_21
        cmp ecx,2
            mov bx,word[tavan1]
            je step_21
        cmp ecx,1
            mov bx,word[tavan2]
            je step_21
        cmp ecx,0
            mov bx,word[tavan3]
            je step_21
        step_21:
            mov al,Byte[input+ecx]
            cmp al,'0'
                jl step_11 
            cmp al,'9'
                jg step_11
            sub al,'0'
            jmp step_31
            step_11:
            cmp al,'A'
                jl end
            cmp al,'F'
                jg end
            sub al,'A'
            add al,10
            step_31:
            mov dx,0
        while_21:
            cmp bx,0
                je end_while_21
            add dx,ax
            dec bx
            jmp while_21
        end_while_21:
        add [resultII],dx
        inc cx
        jmp while_11    
    end_while_11:    
    mov eax,[resultI]
    shl eax,4
    add eax,[resultII]
    i2a eax,result
    puts result
end:

mov eax,1
mov ebx,0
int 0x80
