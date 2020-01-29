%INCLUDE "lib.h"
global _start

section .data
out_put db "please Enter output_string ",0
output_char db "                                                          ",0
output_char2 db 0AH,0DH,"",0
section .bss
input resb 26
output resb 26
x resb 12
Save resd 1
Save2 resd 1
section .code
_start:
    puts out_put
    fgets input,26
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
    mov eax,[ebp+8]
    mov ecx,0
    mov ebx,eax
    Loop:
        cmp byte[ebx],' '
        jne End_Loop
        inc ebx
        jmp Loop

    End_Loop:
    Loop2:
        cmp byte[ebx],0
        je End_Loop2
        mov edx,[ebx]
        mov [eax],edx
        inc ebx
        inc eax
        jmp Loop2
    End_Loop2:
        mov edx,0
        mov [eax],edx
    leave
ret
