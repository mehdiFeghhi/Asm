%INCLUDE "lib.h"
global _start

section .data
n dd 0
r dd 0 
salam db "salam", 13, 10 ,0
puts1 db "pleas inpute your r : ",0
puts2 db "pleas input your n : ",0


section .bss
input resb 12
x resb 12



section .code
_start:
mov eax, 0
puts puts1
fgets input,12
a2i 12,input

mov [r],eax



puts puts2
fgets input,12
a2i 12,input
mov [n],eax
mov eax,1
mov ebx,0


while_1:
     cmp eax,[n]
     jge end
     mov ecx,[r]
     mul:
       add eax,eax
       dec ecx
       cmp ecx,0
       je mul 
     inc ebx
     jmp while_1
end:
puts salam
i2a ebx,x
puts x
mov eax,1
mov ebx,0
int 0x80
