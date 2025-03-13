section .data
    LF      equ     10
    NULL    equ     0
    STDIN   equ     0
    STDOUT  equ     1
    STDERR  equ     2
    SYS_read  equ	0	
    SYS_write equ   1
    SYS_exit equ    60
    EXIT_SUCCESS equ 0 
    NOTINPUT equ -1

    msgInputKey      db      "Enter key (max. 3 characters): " , NULL

    msgReading       db      "Reading input file...OK", NULL
        
    msgGenerating    db      "Generating output file...OK", NULL

    msgErrorEnterKey db      "Error: Enter key (max. 3 characters): ", NULL

    newLine db      LF, NULL
    

extern printString

section .bss
buffer	resb	255	

section .text

global getKey
getKey:
    mov rdi , msgInputKey
    call printString
    mov rdi , STDIN
    mov rsi , buffer
    mov rax , SYS_read
    mov rdx , 3
    syscall


    mov	rsi , buffer
	mov	rax , SYS_write
	mov	rdi , STDOUT
	mov	rdx , 3
    	
	syscall

    mov	rdi , newLine
	call	printString	
    
	mov	rax , SYS_exit
	mov rdi , EXIT_SUCCESS
	syscall

