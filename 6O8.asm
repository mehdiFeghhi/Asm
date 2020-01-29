%INCLUDE "lib.h"
global _start

section .data
pleas1 db "Please Say how much column : ",0
pleas2 db "Please Say how much row : ",0
pleas3 db "Please Entere number : ",0
rows db "it's row is : ",0
colls db "it's column is : ",0
maximumis db "max is : ",0
output_char db 0AH,0DH,"",0
section .bss
cul resw 1
cul2 resw 1
size resw 1
row resw 1
row2 resw 1
biggest resw 1
matrix resw 10*15
input resb 12
output resb 12
output1 resb 12
output2 resb 12
section .code
_start:
     call main
     call maximum
     ;mov word[biggest],eax
     call mat_max   
     i2a  edx,output2
     puts colls
     puts output2
     puts output_char
     i2a  eax,output1
     puts rows
     puts output1
     puts output_char
end:
mov eax,1
mov ebx,0
int 0x80

main:
    puts pleas1
    fgets input,12
    a2i 12,input
    mov [cul],ax
    mov [cul2],ax
    puts pleas2
    fgets input,12
    a2i 12,input
    mov [row],ax
    mul word[cul]
    mov [size],eax
    ;i2a eax,output
    ;puts output
    puts pleas3
    puts output_char
    sub ecx, ecx
    
    Lool1:
        ; mov edx, [size]
        ; i2a edx, output
        ;puts output
        cmp ecx,[size]
        je end_Lool1
        fgets input,12
        a2i 12,input
        mov [matrix+ecx*2],ax
        inc ecx
        jmp Lool1
    end_Lool1:
    ;puts pleas3
    ret 
mat_max:
    mov ebx,0
    mov ecx,-1
    Lool4:
       inc ecx
       movzx dx,[matrix+2*ecx]
       cmp eax,edx
       jne Lool4
       mov eax,ecx
       cmp cx,[cul]
       jge myLabel
       mov eax,0
       mov edx,ecx
       jmp end_myLabel
       myLabel:
        xor edx,edx
        div word[cul]
       end_myLabel:
    ret
 
maximum:
    mov ebx,0
    mov eax,0
    mov ebx,[matrix]
    mov ecx,0
    Lool3:
    cmp ecx,[size]
    je end_Lool3
    mov ax,[matrix+2*ecx]
    cmp ax,bx
    jl OOO
    mov ebx,eax
    OOO:    
    inc ecx
    jmp Lool3
    end_Lool3:
    mov eax,ebx
    i2a eax,output
    puts maximumis
    puts output
    puts output_char
    ret
