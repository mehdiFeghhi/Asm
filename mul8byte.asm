%INCLUDE "lib.h"
global _start

section .bss
input resb 12
input2 resb 12
get   resb 12
output resb 12


section .data
outputInt dd 0
endl db 13, 10, 0
slam db "SLAM",13,10,0
please db 0AH,0DH,"Please Enter your number : ",0
xlat_table  DB  '4695031872'


section .code
_start:
    puts please
    fgets input2,12
    a2i 12,input2
    push eax   
    puts please 
    fgets input2,12
    a2i 12,input2
    push eax
    call mulme
    i2a eax,output
    puts output
    puts endl
end:
mov eax,1
mov ebx,0
int 0x80

mulme:
    pop edx
    mov eax,0
    pop eax
    pop ebx
    LabelOne:
        cmp bl,0
        je endLabelOne
        mov cl,bl
        and cl,1
        cmp cl,1
        je goTOadd
        endgoToadd:
        shr ebx,1
        shl eax,1
        jmp LabelOne
        goTOadd:
        add [outputInt],eax
        jmp endgoToadd
    endLabelOne:
    mov eax,[outputInt]
    push edx
ret
