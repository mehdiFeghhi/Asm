%INCLUDE "lib.h"
global _start

section .bss
input resb 12
get   resb 12
output resb 1


section .data
endl db 13, 10, 0
slam db "SLAM",13,10,0
hello db 0AH,0DH,"Do you want to quit (Y/N):",0
please db "please enter number that want to encribt :",0
xlat_table  DB  '4695031872'


section .code
_start:
   call main
   call end
end:
mov eax,1
mov ebx,0
int 0x80
main:

  mov ebx,xlat_table
 
  
  while_2:
    puts hello
    fgets get,12
    cmp byte[get],'Y'
    je end_while_2
    cmp byte[get],'y'
    je end_while_2
    cmp byte[get],'n'
    je while_2_1
    cmp byte[get],'N'
    je while_2_1
    jmp while_2
    while_2_1:
      puts please
      mov ecx,0
      fgets get,12
  while_1
     cmp Byte[get+ecx],0    
     je End_while_1
     mov al, BYTE[get+ecx]
     inc ecx
     sub al,'0'
     xlat
     mov byte[output],al
     puts output
     jmp while_1
   End_while_1:
    jmp while_2
 end_while_2:   
 ret
