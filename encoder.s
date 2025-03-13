global _start

section.data
    STDOUT	equ	1
    STDERR 	equ	2	
    SYS_write equ 1

    div_ANS dq 0
    div_rem dq 0

    dot db "."
    ENDLINE db "",10
    four_zero db "0000",10
    zero db "0"
    const10 dq 10
    

    msgReading db "Reading input file...OK"
        
    msgGenerating db "Generating output file...OK"

extern getInputFile
extern getOutputFile
extern getKey
extern openInputFile
extern printString

section .text
_start:

    call getInputFile
    ;mov rdi, msgReading
    ;call openInputFile

    call getOutputFile

    call getKey

    syscall
