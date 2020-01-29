%INCLUDE "lib.h"
global _start

section .data
first db "please enter the biggest number of exam : ",0
secend db "please enter the number if your number be less than zero you exite : ",0
average db "average is : ",0
darasad db "average from biggest number is : ",0
output_char db 0AH,0DH,"",0
sum dw 0
biggest dw 0
save1 dw 1
section .bss
input1 resb 12
output2 resb 12
section .code
_start:
    puts first
    fgets input1,12
    a2i 12,input1
    mov [biggest],eax
    mov ecx,0
    Lable_one:
        puts secend
        fgets input1,12
        a2i 12,input1
        cmp eax,0
        jl end_Lable_one
        add [sum],eax
        add ecx,1
        jmp Lable_one
    end_Lable_one:
    mov eax,0
    mov ax,[sum]
    div cx
    puts average 
    i2a eax,input1
    puts input1
    xor ecx,ecx
    mov ecx,[biggest]
    mov ebx,100
    mul ebx
    div cx
    i2a eax,input1
    puts output_char
    puts darasad
    puts input1
    
end:
mov eax,1
mov ebx,0
int 0x80
