%INCLUDE "lib.h"
global _start

section .data
out_put db "please Enter output_string ",0
output_char db "                                                          ",0
output_char2 db 0AH,0DH,"",0
section .bss
input resb 12
output resb 12
x resb 12
Save resd 1
Save2 resd 1
section .code
_start:

    puts out_put
    fgets input,12
    mov eax,input
    push eax
    call revers
    puts input
    puts output_char2
    ;puts  output
end:
mov eax,1
mov ebx,0
int 0x80

revers:
    enter 0,0
    ;push ESI
    ;mov ESI,ebp    
    mov eax,[ebp+8]
    mov ecx,0
    mov ebx,eax
    Loop:
        inc ecx
        cmp byte[eax],0
        je End_Loop
        inc eax
        jmp Loop

    End_Loop:
    dec eax
    Loop2:  
        cmp eax,ebx
        jle End_Loop2   
        movzx edx,byte[eax]
        movzx ecx ,byte[ebx]
        mov [eax],cl
        mov [ebx],dl
        inc ebx
        dec eax
        jmp Loop2
    End_Loop2:
    sub eax,[Save2]
    leave
ret
