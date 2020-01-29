%INCLUDE "lib.h"
global _start

section .data
hello db "Do you want to quit (Y/N):",0
output_char db "                                                          ",0
section .bss
input resb 12
section .code
_start:

        
end:
puts edi
mov eax,1
mov ebx,0
int 0x80
