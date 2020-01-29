%INCLUDE "lib.h"
global _start

section .bss
input resb 12
output resb 12


section .data
endl db 13, 10, 0
slam db "SLAM",13,10,0
hello db "sum of individual digits is:",0

section .code
_start:
   call main
   call end
   
end:
mov eax,1
mov ebx,0
int 0x80

main:
      mov ebx,input
      fgets input,12
      
      mov eax, 0;
      mov ecx, 0;
      mov edx, 0
   while_1:
         
      
      cmp Byte[ebx+ecx],0
      je End_while_1

      mov dl, BYTE[ebx+ecx]
      sub dl,'0'
      add eax,edx
      inc ecx
      jmp while_1

   End_while_1:
   puts hello
   i2a eax, output
   puts output;
   puts endl

   ret

