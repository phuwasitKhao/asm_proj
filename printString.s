section .data
    NULL    equ     0
    STDOUT  equ     1
    SYS_write equ   1

section .text

global printString

printString:
        push    rbx
        ; count characters in string
        mov     rbx, rdi
        mov     rdx, 0
strCountLoop:
        cmp     byte [rbx], NULL        ;calculate string length
        je      strCountDone
        inc     rdx
        inc     rbx
        jmp     strCountLoop
strCountDone:
        cmp     rdx, 0
        je      prtDone
        ; Call OS to output string
        mov     rax, SYS_write          ;write to console
        mov     rsi, rdi
        mov     rdi, STDOUT
        syscall
prtDone:
        pop     rbx
        ret

