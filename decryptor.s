global _start

section.data

    LF equ 10
    NULL equ 0
    newline db LF , NULL

    msgReading db "Reading input file...OK" , NULL
        
    msgGenerating db "Generating output file...OK" , NULL

    msgSuccess db  " generated" , NULL

extern getInputFile
extern getOutputFile
extern getKey
extern printString

section .text
_start:

    call getInputFile
    
    call getOutputFile

    xor rdi , rdi
    
     
    mov rdi , msgReading
    call printString
  
    mov rdi , newline
    call printString

    mov rdi , msgGenerating
    call printString

    mov rdi , newline
    call printString

    mov rdi , r13
    call printString
   
    mov rdi , msgSuccess
    call printString
    
    mov rax , 60
    xor rdi , rdi
    syscall
    
