%INCLUDE "lib.h"
global _start

section .data
    out_Put db "please input your string : ",0
    output_char db 0AH,0DH,"",0
section .bss
    input resb 26
section .code
_start:
    puts out_Put
    fgets input,26
    push input
    call remove_all_blank_first
    push eax
    call remove_all_blank
    mov ebx,eax
    puts ebx
end:
mov eax,1
mov ebx,0
int 0x80
remove_all_blank_first:
    enter 0,0
    mov eax,[ebp+8]
    loop1:
        cmp byte[eax],' ' 
        jne end_Loop1
            mov edx,eax
            Loop2:
                cmp byte[edx],0
                je end_loop2
                    mov ebx,0
                    mov bl,[edx+1]
                    mov [edx],bl
                    inc edx
                    jmp Loop2
        end_loop2:    
        jmp loop1
    end_Loop1:
    leave
    ret

remove_all_blank:
    enter 0,0
    mov eax,[ebp+8]
    dec eax
    Labele1:
        inc eax
        cmp byte[eax],0
        je End_Labele1
        cmp byte[eax]," "
            je Work_After_Blank
            inc eax
            jmp Labele1
        Work_After_Blank:
            cmp byte[eax+1]," "
            jne Labele1
            mov edx,eax
            Label_in_label:            
                cmp byte[edx],0
                je End_in_Label
                mov ebx,0
                mov bl,[edx+1]
                mov [edx],bl
                inc edx
                jmp Label_in_label
            End_in_Label:
            jmp Work_After_Blank
    End_Labele1:   
    mov eax,[ebp+8] 
    leave
ret 
