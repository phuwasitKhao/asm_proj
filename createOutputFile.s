section .data
        LF      equ     10
        NULL    equ     0
        STDIN   equ     0
        STDOUT  equ     1
        STDERR  equ     2
        SYS_read  equ	0	
        SYS_write equ   1
        STRLEN  equ     50
        msgOutputFile     db      "Enter output file name: ", NULL

        newLine db      LF, NULL

section .bss
        buffer_output	resb	256
        chr resb 1

extern printString
extern writeToOutputFile

section .text

global getOutputFile
getOutputFile:
        mov rdi , msgOutputFile
        call printString
        mov rbx , buffer_output
        mov r12 , 0

readStringPrompt:
        mov rax , SYS_read
        mov rdi , STDIN
        lea rsi , byte [chr]
        mov rdx , 1
        syscall

        mov al , byte [chr]
        cmp al , [newLine]
        je DoneRead

        inc r12
        cmp r12 , STRLEN
        jae readStringPrompt

        mov byte [rbx] , al
        inc rbx

        jmp readStringPrompt

DoneRead:
        mov byte [rbx] , NULL
        mov rdi , buffer_output
        call writeToOutputFile

        ret