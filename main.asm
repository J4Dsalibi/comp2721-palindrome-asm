section .data
    prompt db "Enter a string: ", 10
    prompt_len equ $ - prompt

section .bss
    input resb 100

section .text
    global _start

_start:

    mov rax, 1 ; syscall: write
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    mov rax, 0 ; syscall: read
    mov rdi, 0
    mov rsi, input
    mov rdx, 100
    syscall

    mov rbx, rax ; store length

    ; print input
    mov rax, 1
    mov rdi, 1
    mov rsi, input
    mov rdx, rbx ; print only actual length
    syscall

    mov rax, 60 ; syscall: exit
    xor rdi, rdi
    syscall