section .data
        LF      equ     10
        NULL    equ     0
        STDIN   equ     0
        STRLEN  equ     50
        STDOUT  equ     1
        STDERR  equ     2
        SYS_read  equ	0	
        SYS_write equ   1
        msgInputFile     db      "Enter input file name: ", NULL

        newLine db      LF, NULL

section .bss
        buffer	resb	256	
        chr resb 1
        inline resb STRLEN+2
        

extern printString
extern openInputFile

section .text

global getInputFile
getInputFile:
        mov rdi , msgInputFile
        call printString
        ;mov rdi , STDIN
        ;mov rsi , buffer
        ;mov rax , SYS_read
        ;mov rdx , fileName_buffer
        ;syscall
        ;mov rbx , inline
        mov rbx , buffer
        mov r12 , 0

readInput:
        mov rax , SYS_read
        mov rdi , STDIN
        lea rsi , byte [chr]
        mov rdx , 1
        syscall

        mov al , byte [chr]
        cmp al , LF
        je readDone

        inc r12
        cmp r12 , STRLEN
        jae readInput

        mov byte [rbx] , al
        inc rbx

        jmp readInput

readDone:
        mov byte [rbx] , NULL
        mov rdi , buffer
        call openInputFile

        ret

; debugging input file
;       mov	rsi , buffer
;	mov	rax , SYS_write
;	mov	rdi , STDOUT
;	mov	rdx , 10
        
	syscall	
