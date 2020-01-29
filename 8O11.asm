%INCLUDE "lib.h"
global _start

section .data
getfirtsNumber db "please enter your first number",13,10,0
getsizeOne db "please eneter long of this number",13,10,0
getsecentNumber db "please enter your secend number,",13,10,0
getsizeTwo db "please enter size of this number",13,10,0
output_char db "                                                          ",0
section .bss
input resb 14
output resb 20
sizeOn resw 3
SizeOne resw 3
sizeTow resw 3
number1 resw 14
number2 resb 14 
section .code
_start:
    puts getfirtsNumber
    fgets  number1,12
    puts  getsizeOne
    mov eax,0
    fgets input,12
    a2i   12,input
    mov [sizeOn],ax
    mov [SizeOne],ax
    mov esi,number1
    add esi,eax
    sub esi,1
    puts getsecentNumber
    mov eax,0
    fgets number2,12
    puts getsizeTwo
    mov eax,0
    fgets input,12
    a2i  12,input
    mov  [sizeTow],ax
    mov ebp,number2
    add ebp,eax
    sub ebp,1
    mov ecx,0
    mov edx,0
    FirstLoop:
        cmp word[sizeTow],0
            je End_FirstLoop
        mov eax,0
        mov ax,[SizeOne]
        mov [sizeOn],ax
        mov eax,0
        mov cl,0
        secendLoop:
            cmp word[sizeOn],0
                je End_SecendLoop
            mov edx,0
            mov dl,ah
            mov al,byte[ebp]
            sub al,'0'  
            mov bl,byte[esi]
            sub bl,'0'
            mul bl
            aam 
            Zarb_dar_dah:
                cmp ecx,0
                    jne Zarb_Kon_dar_dah
                add dl,al
            Agear_zarb_shod:
                inc cl
                push edx
                sub word[sizeOn],1
                dec esi 
            jmp secendLoop
        End_SecendLoop:
        dec ebp
        sub word[sizeTow],1
        inc ch
        jmp FirstLoop 
    End_FirstLoop:
    jmp zarb_ten
    Loop_for_pop_cl:
        cmp cl,0
            je end_for_pop_cl
        pop edx
        add eax,edx
        dec cl
        jmp Loop_for_pop_cl
    end_for_pop_cl:
    Loop_for_pop_ch:
        cmp ch,0
            je end_for_pop_ch
        pop edx
        add eax,edx
        dec ch
        jmp Loop_for_pop_ch
    end_for_pop_ch:
    mov edx,eax
    i2a edx,output
    puts output
end:
mov eax,1
mov ebx,0
int 0x80



Zarb_Kon_dar_dah:
    push ecx
    mov  ebx,eax
    push ebx
    mov  eax,0
    mov  al,bl
    add  al,dl
    mov  ebx,0
    mov  ebx,10
        for_Cl_:
            cmp cl,0
                je end_for_CL
            mul bx
            jmp  for_Cl_
        end_for_CL:
            cmp ch,0
                je end_for_ch_
            mul bx
            dec ch
            jmp end_for_CL
        end_for_ch_:
        pop ebx
        pop ecx
        mov edx,eax
        mov eax,ebx
        mov al,0
        jmp Agear_zarb_shod
zarb_ten:
    push ecx
    mov  al,ah
    mov ah,0
    mov bl,10
    dec cl
    for_1:
        cmp cl,0
            je End_for_1
        mul bl
        dec cl
        jmp for_1
        End_for_1:
    for_2:
        cmp ch,0
            je End_for_2
        mul bl
        dec ch
        jmp End_for_2
    End_for_2:
    pop ecx
    jmp Loop_for_pop_cl
