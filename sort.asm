section .data
    inputMessage: db 'Enter Numbers: ', 0
    inputMessageLen: equ $-inputMessage

    buffer: times 100 db 0
    bufferLen: equ $-buffer

section .text
    global _start

    %define STDIN 0
    %define STDOUT 1
    %define SYS_READ 0
    %define SYS_WRITE 1
    %define SYS_EXIT 60

_start:
    
    ; Print input message
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, inputMessage
    mov rdx, inputMessageLen
    syscall

    ; Read input
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, buffer
    mov rdx, bufferLen
    syscall

    ; Exit
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall