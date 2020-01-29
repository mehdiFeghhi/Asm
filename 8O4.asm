%INCLUDE "lib.h"
global _start

section .data
getNumber db "Please Entere your string : ",0
output_char db 0AH,0DH,"",0
orr db " or "
A db 'A'
a db 'a'

save dd 0
save1 dd 1
section .bss
input1 resb 12
output2 resb 12
outt resb 4
section .code
_start:
    puts getNumber
    fgets input1,12
    mov edx,0
    mov ecx,0
    Label_Start:
        cmp edx,26
        jg End_Label
        mov ebx,0

        start_sent:
            cmp byte[input1+ebx],0
            je end_sent
            mov al,'a'
            add al,dl
            mov ah,'A'
            add ah,dl
            cmp byte[input1+ebx],al
            je is_equal
            cmp byte[input1+ebx],ah
            je is_equal
            jmp com_to
            is_equal:
                add ecx,1
            com_to:
            add ebx,1
            jmp start_sent
        end_sent:
        cmp ecx,0
        je lav
        add [A],edx
        add [a],edx
        puts A
        sub [A],edx
        sub [a],edx
        add ecx,'0'
        mov  [outt],ecx
        puts outt
        puts output_char
        mov ecx,0
        lav:
        add edx,1
        jmp Label_Start
    End_Label:
end:
mov eax,1
mov ebx,0
int 0x80
