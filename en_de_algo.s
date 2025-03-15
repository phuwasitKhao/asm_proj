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


section .bss
        buffer_output	resb	256

extern printString

global algorithm1
algorithm1:
  mov rdi , r15
  call printString
  ret
    
