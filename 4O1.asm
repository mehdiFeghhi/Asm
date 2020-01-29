
%INCLUDE "lib.h"
global _start
section .bss
input resb 2
section .data
hello db "Do you want to quit (Y/N):",0
output_char db "      ds                          ",0

section .code
_start:
 
     mov eax,'N';
     while_2:
        cmp eax,'Y'
        je end_while_2
        puts hello
        fgets input,2
        mov eax,[input];
        jmp while_2
      end_while_2:       
end:
mov eax,1
mov ebx,0
int 0x80
