section .data
    message db 'g', 0        ; message to be encrypted
    key db 'A', 0                ; Encryption key 

section .bss
    encrypted resb 256             ; buffer for encrypted output 

section .text
global algorithm

algorithm:
    ; cal string length 
    call stringlen                 ; call function get string length
    mov r15, rax                   ; store message length in r15 register
    mov rsi, rax                   ; store message length in rsi register

    ; cal key length
    mov rdi, r15
    call stringlen                 ; call function get stringlen  length
    mov r10, rax                   ; store key length in r10 register
    
    ; setup parameters for encryption 
    mov     rdi, message             ; 1st parameter: pointer to original message
    lea     rcx, [encrypted]         ; 2nd parameter: pointer to output buffer
    mov     rdx, key                 ; 3rd parameter: pointer to encryption key

    call    encriptCore              ; call the encryption function

    ;show encrypted result
    mov rax, 1                   
    mov rdi, 1                    
    lea rsi, [encrypted]          
    mov rdx, r15                  
    syscall                      

    ; exit the program
    mov rax, 60                   
    xor rdi, rdi                  
    syscall

encriptCore:
    push    rbx                   
    push    r8
    push    r9
    push    r11
      
    mov     r8, rdi               ; r8 = pointer to input message
    mov     r9, rcx               ; r9 = pointer to output buffer
    mov     rcx, rsi              ; rcx = message length
    xor     rbx, rbx              ; rbx = ตัวนับสำหรับ key
    
encode_loop:
    cmp     rcx, 0                ; check if message length is 0
    je      end_encode            ; exit loop if message length is 0

    mov     al, [r8]              ; load current message byte
    movzx   r11, byte [rdx + rbx] ; load current key byte
    xor     al, r11b              ; xor message byte with key byte
    mov     [r9], al              ; store result in output buffer

    inc     r8                    ; move to next byte in message buffer
    inc     r9                    ; move to next byte in output buffer
    inc     rbx                   ; move to next byte in key buffer
    cmp     rbx, r10              ; check if key index reached key length
    jne     skip_key_reset
    xor     rbx, rbx              ; reset key index to 0
    
skip_key_reset:
    dec     rcx                   ; decrement message length
    jmp     encode_loop           ; repeat loop

end_encode:
    pop     r11
    pop     r9
    pop     r8
    pop     rbx
    ret


stringlen:
    push    rcx
    push    rdi
    xor     rax, rax              
    mov     rcx, -1               
    repnz   scasb                 
    mov     rax, -2               
    sub     rax, rcx              
    pop     rdi
    pop     rcx
    ret

; yasm -f elf64 encryptFi.s -o encryptFi.o
; ld encryptFi.o -o encryptFi
; ./encryptFi
