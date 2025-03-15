global _start

section.data


    

    msgReading db "Reading input file...OK"
        
    msgGenerating db "Generating output file...OK"

extern getInputFile
extern getOutputFile
extern getKey
extern printString

section .text
_start:

    call getInputFile
    
    call getOutputFile

   ; call getKey

    mov rdi , msgReading
    call printString 

    mov rdi , msgGenerating
    call printString

    mov rax , 60
    xor rdi , rdi
    syscall
    
