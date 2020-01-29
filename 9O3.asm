%INCLUDE "lib.h"
global _start

section .data
lat db 0AH,0DH,"",0
hello db "please",0
section .bss
input resb 12
helper resb 13
output2 resb 35
sign resb 3
exponent resb 12
mantissa resb 30
section .code
_start:
    fgets input,12
    mov ebx,input
    call main
    call is_signe
    call what_is_exponent
    call what_is_mantissa
    puts output2
    puts lat
    puts sign
    puts lat
    puts mantissa
    puts lat
    puts helper
end:
mov eax,1
mov ebx,0
int 0x80


main:
    mov eax,0
    mov ecx,0
    Label1:
    cmp byte[ebx],0
    je end_Label1
    mov edx,0
    mov dl,byte[ebx]
    jmp make_to_binery_from_string
    come_back:
    inc ebx
    add eax,4
    jmp Label1
    end_Label1:
    mov byte[output2+eax],0
    ret

make_to_binery_from_string:
    cmp dl,'9'
    jg is_alfa
    sub dl,'0'
    contunie:
    jmp add_to_output23
    come_back2:
    jmp come_back
is_alfa:
    sub dl,'A'
    add dl,10
    jmp contunie


add_to_output23:
    mov ecx,3
    add_to_output2:
    cmp ecx,0
    jl  come_back2
    add eax,ecx
    sar dl,1
    jc  be_one
    mov byte[output2+eax],'0'
    contunie2:
    sub eax,ecx
    dec ecx
    jmp add_to_output2
be_one:
    mov byte[output2+eax],'1'
jmp contunie2

is_signe:
cmp byte[output2],'0'
    je tamam
    mov byte[sign],'1'
    mov byte[sign+1],'0'
    jmp end2
    tamam:
    mov byte[sign],'0'
    mov byte[sign+1],0
    end2:
ret
what_is_exponent:
   mov ecx,1
   mov eax,0
   loop1:
   mov ebx,0
   cmp ecx,8
   jg end_Loop1
   mov bl,byte[output2+ecx]
   mov byte[helper+eax],bl
   inc eax
   inc ecx   
   jmp loop1
   end_Loop1:
   mov byte[helper+eax],0
ret
what_is_mantissa:
    mov ecx,9
    mov ebx,0
    mov byte[mantissa],'1'
    mov byte[mantissa+1],'.'
    mov eax,2
    loop2:
        cmp byte[output2+ecx],0
        je end_2
        mov bl,byte[output2+ecx]
        mov byte[mantissa+eax],bl
        inc ecx
        inc eax
        jmp loop2
    end_2:
        mov byte[mantissa+eax],0
    ret
