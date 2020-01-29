%INCLUDE "lib.h"
global _start
extern _getch
section .data
list dw 10,13,15
size dw 3
list2 dw 8,9,16
size2 dw 3
section .bss
response resb 12
section .code
_start:

   mov eax,0x6e
   mov ebx,3
   mov ecx,0
   int 0x80
   mov eax,0
   loop1:
      cmp al,'s'
      je end
         mov ebx,eax
         in  al,0x60
         i2a eax,response
         puts response
      jmp loop1
end:
mov eax,1
int 0x80
