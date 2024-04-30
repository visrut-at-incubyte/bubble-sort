section .data
    inputMessage: db 'Enter Numbers: ', 0
    inputMessageLen: equ $-inputMessage

section .text
    global _start

_start:
    
    ; Print input message
    mov rax, 1
    mov rdi, 1
    mov rsi, inputMessage
    mov rdx, inputMessageLen
    syscall

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall