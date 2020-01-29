%INCLUDE "lib.h"
global _start

section .data
hello db "Do you want to quit (Y/N):",0
output_char db "                                                          ",0
section .bss
x resb 12
y resb 12
z resb 12
section .code
_start:
fgets x,12
fgets y,12
fgets z,12
a2i 12,x
mov edx,eax
a2i 12,y
mov ecx,eax
a2i 12,z
mov ebx,eax
add edx,2
neg edx
imul edx,ecx
add edx,eax
i2a edx,x
puts x
end:
push ebx
mov eax,1
mov ebx,0
int 0x80
