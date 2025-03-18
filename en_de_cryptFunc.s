section .data

      NULL equ 0

section .bss
    encrypted resb 1024         

extern printString
  
section .text
global xor_algorithm
; store encryption data in rax
xor_algorithm:
    ; len plaintext and key
    mov rdi, r9
    call stringlen        ; rax = plaintext length
    mov rbx, rax          ; rbx = length ของข้อความ

    mov rdi, r15
    call stringlen        ; rax = key length
    mov rcx, rax          ; rcx = key length

    ; initial state 
    xor r8, r8            
    lea rsi, [encrypted]  ; rsi = pointer output buffer

en_loop:
    cmp rbx, NULL
    je en_done

    mov al, [r9]          ; load string Input per byte
    mov dl, [r15 + r8]    ; load string Key per byte
    xor al, dl           
    mov [rsi], al       

    inc r9                
    inc rsi               
    dec rbx               
    inc r8            
    cmp r8, rcx          
    jl no_reset
    xor r8, r8           ; reset key index
no_reset:
    jmp en_loop

en_done:
    mov byte [rsi], NULL
    lea rax, [encrypted] 
    mov r14 , rax  
    ret

; calc string len
stringlen:
    xor rax, rax
len_loop:
    cmp byte [rdi+rax], NULL
    je len_done
    inc rax
    jmp len_loop
len_done:
    ret

