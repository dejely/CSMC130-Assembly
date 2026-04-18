
section .data
    newline db 10 ; memory

section .text
    global _start ; globally start
    extern utils ; call utils file

_start:; registers
    mov rax, 123; a = 0 (first iteration)
    call print_uint ; b = 1 (2nd iteration)
    
    ; print current fibonnaci iteration

    mov rax, 1  ; 1st param
    mov rdi, 1 ; sys write and std out
    mov rsi, newline
    mov rdx, 1 ; length of new line which is equal to 1
    syscall

    mov rax, 60 ; sys exit
    xor rdi, rdi
    syscall



