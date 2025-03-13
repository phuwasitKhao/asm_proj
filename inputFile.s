section .data
        LF      equ     10
        NULL    equ     0
        STDIN   equ     0
        STDOUT  equ     1
        STDERR  equ     2
        SYS_read  equ	0	
        SYS_write equ   1
        msgInputFile     db      "Enter input file name: ", NULL

        newLine db      LF, NULL

section .bss
buffer	resb	256	
fileName resb 256


extern printString
extern openInputFile

section .text

global getInputFile
getInputFile:
        mov rdi , msgInputFile
        call printString
        mov rdi , STDIN
        mov rsi , buffer
        ;mov fileName , r9
        mov rax , SYS_read
        mov rdx , 10
        syscall

        mov	rsi , buffer
	mov	rax , SYS_write
	mov	rdi , STDOUT
	mov	rdx , 10
        
	syscall	
        mov rcx, buffer
        mov rdi, buffer     ; Correctly pass filename address
        call openInputFile

strCountLoop:
        cmp     byte [rbx], 10        ;calculate string length
        je      strCountDone
        inc     rdx
        inc     rbx
        jmp     strCountLoop
strCountDone:
        cmp     rdx, 0
        je      prtDone
        mov     rax, SYS_write          ;write to console
        mov     rsi, rdi
        mov     rdi, STDOUT
        syscall
prtDone:
        pop     rbx
        ret


