
section .data
    prompt db "Enter n: ",  0
    newline db 10 ; memory

section .bss 
    input resb 32

section .text
    global _start ; globally start
    extern print_uint ; imported from utils.asm

_start:; registers

    ; print prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, 9
    syscall

    ;read input
    mov rax, 0 ; sys_read
    mov rdi, 0  ; stdin
    mov rsi, input
    mov rdx, 32
    syscall

    ; convert ASCII -> int
    mov rsi, input
    call atoi ; results in rax

    mov r14, rax

    mov r12, 0 ; a = 0
    mov r13, 1 ; b = 1




