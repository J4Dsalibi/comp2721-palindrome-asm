section .data
    prompt db "Enter a string: ", 10
    prompt_len equ $ - prompt

section .bss
    input resb 100

section .text
    global _start

_start:

    ; ---- print prompt ----
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; stdout
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; ---- read input ----
    mov eax, 3          ; syscall: read
    mov ebx, 0          ; stdin
    mov ecx, input
    mov edx, 100
    int 0x80

    mov esi, eax        ; store length

    ; ---- print input ----
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, esi
    int 0x80

    ; ---- exit ----
    mov eax, 1
    xor ebx, ebx
    int 0x80
