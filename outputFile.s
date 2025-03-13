section .data
        LF      equ     10
        NULL    equ     0
        STDIN   equ     0
        STDOUT  equ     1
        STDERR  equ     2
        SYS_read  equ	0	
        SYS_write equ   1

        msgOutputFile     db      "Enter output file name: ", NULL

        newLine db      LF, NULL

section .bss
buffer	resb	255	

extern printString


section .text

global getOutputFile
getOutputFile:
        mov rdi , msgOutputFile
        call printString
        mov rdi , STDIN
        mov rsi , buffer
        mov rax , SYS_read
        mov rdx , 10
        syscall


        mov	rsi , buffer
	mov	rax , SYS_write
	mov	rdi , STDOUT
	mov	rdx , 10
    	
	syscall


