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

section .bss
        buffer_file_input	resb	256	
        chr resb 1        

extern printString
extern readInputFile

section .text

global getInputFile
getInputFile:
        mov rdi , msgInputFile
        call printString
        mov rbx , buffer_file_input
        ;mov rbx , buffer_input
        xor r12 , r12
        
readInput:
        mov rax , SYS_read ; read from keyboard
        mov rdi , STDIN ; accept input from keyboard
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
        mov rdi , buffer_file_input
        call readInputFile  
        ret

