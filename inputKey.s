section .data
        LF      equ     10
        NULL    equ     0
        STDIN   equ     0
        STRLEN  equ     50
        STDOUT  equ     1
        STDERR  equ     2
        SYS_read  equ	0	
        SYS_write equ   1

        msgInputKey      db      "Enter key (max. 3 characters): " , NULL

    ;msgReading       db      "Reading input file...OK", NULL
        
    ;msgGenerating    db      "Generating output file...OK", NULL

    ;msgErrorEnterKey db      "Error: Enter key (max. 3 characters): ", NULL

        newLine db      LF, NULL
    


section .bss
    buffer_key	resb	255	   
    chr resb 1        
     
extern printString

section .text

global getKey
getKey:
        mov rdi , msgInputKey
        call printString
        mov rbx , buffer_key
        mov r12 , 0

readInput:
        mov rax , SYS_read
        mov rdi , STDIN ; accept input from keyboard
        lea rsi , byte [chr] ; store input in chr
        mov rdx , 1 ; read 1 byte
        syscall

        mov al , byte [chr] ; get character just read   
        cmp al , [newLine] ; linefeed , input done
        je readDone

        inc r12
        cmp r12 , STRLEN
        jae readInput

        mov byte [rbx] , al
        inc rbx

        jmp readInput

readDone:
        mov byte [rbx] , NULL
        mov rdi , buffer_key
        mov rax , rdi

        ret