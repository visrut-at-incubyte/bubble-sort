%define STDIN 0
%define STDOUT 1
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60

section .rodata
    inputMessage: db 'Enter Numbers: ', 0
    inputMessageLen: equ $-inputMessage

section .data
    buffer: times 100 db 0
    bufferLen: equ $-buffer

section .text
    global _start

_start:
    call printInputMessage
    call readUserInput
    call exitWithSuccess

printInputMessage:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, inputMessage
    mov rdx, inputMessageLen
    syscall
    ret

readUserInput:
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, buffer
    mov rdx, bufferLen
    syscall
    ret

exitWithSuccess:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall