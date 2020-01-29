%INCLUDE "lib.h"
global _start

section .data
list dw 1,22,32,46,56,1000
show db "what number do you want to show ? :",0
end1 db "find it ",0
end2 db "I can't find it ",0
lol  db "LOL!!!", 13, 10, 0
endl db 13, 10, 0

section .bss
input resb 12
out_put resb 16
section .code
_start:
    mov ecx,0
    puts show
    fgets input,12
    mov eax,0
    a2i 12,input
    Lable_1:
        cmp ax,[list+ 2*ecx]
        je find
        jl end_l
        inc ecx
        puts lol
        jmp Lable_1
    find:
        puts end1
        jmp end
    end_l:
        puts end2

end:
mov eax,1
mov ebx,0
int 0x80
