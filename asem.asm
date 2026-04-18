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


fib_loop:
    cmp r14, 0
    je exit

    ; print current value
    mov rax, r12
    call print_uint

    ; new line
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; a + b
    mov r15, r12
    add r15, r13

    ; transfer the next values on registers so the old r13 becomes the new r12 and r15 becomes the new r13
    mov r12, r13
    mov r13, r15 

    dec r14
    jmp fib_loop

exit:
    mov rax, 60 ; sys exit
    xor rdi, rdi
    syscall

atoi:
    xor rax, rax
    xor rcx, rcx

.convert:
    mov bl, [rsi]

    cmp bl, 10
    je .done
    cmp bl, 0
    je .done

    sub bl, '0'
    imul rax, rax, 10
    add rax, rbx

    inc rsi
    jmp .convert

.done:
    ret