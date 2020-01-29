%include "lib.h"

global _start

section .data
    massage1 times 10 db 0
    pth times 100 db 0
    inp_msg db "enter a path to move to: ",0
    massage4 db "error happen :  ", 0
    massage2 db "directory exists", 0
    massage3 db 10, 13, 0

section .code
_start:
    puts inp_msg
    fgets pth, 100
    push pth
    call move
    cmp eax, 0
    je if_do_good
    puts massage4
    i2a eax, massage1
    puts massage1
    puts massage3
    jmp done
if_do_good:
    puts massage2
    puts massage3
done:
    mov eax, 1
    mov ebx, 0
    int 0x80

move:
    enter 0, 0
    push ebx
    mov eax, 12
    mov ebx, [ebp+8]
    int 0x80
    pop ebx
    leave 
    ret 4
