section .bss
    buffer resb 32

section .text 
    global print_uint

print_uint:
    mov rcx, buffer + 31
    mov byte [rcx], 0 ; move memory address byte

    cmp rax, 0
    jne .convert

    dec rcx
    mov byte [rcx], '0' ;eof
    jmp .print

.convert:
    mov rbx, 10

.repeat:
    xor rdx , rdx
    div rbx
    add dl, '0' ;eof
    dec rcx
    mov [rcx], dl
    test rax, rax
    jnz .repeat

.print:
    mov rax, 1 ;sys write
    mov rdi, 1
    mov rsi, rcx
    mov rdx, buffer + 31
    sub rdx, rcx
    syscall
    ret
