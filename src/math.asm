section .data


section .text
    global suma, resta, multiplicacion, division, modulo
    extern msg_error_div, mensaje_suma, mensaje_resta, mensaje_multiplicacion, mensaje_division, mensaje_modulo, printf

suma:
    mov rax, rdi
    add rax, rsi
    mov rdi, mensaje_suma
    xor rsi, rsi
    mov rsi, rax
    xor rax, rax
    call printf
    ret

resta:
    mov rax, rdi
    sub rax, rsi
    mov rdi, mensaje_resta
    xor rsi, rsi
    mov rsi, rax
    xor rax, rax
    call printf
    ret

multiplicacion:
    mov rax, rdi
    imul rax, rsi
    mov rdi, mensaje_multiplicacion
    xor rsi, rsi
    mov rsi, rax
    xor rax, rax
    call printf
    ret

division:
    mov rax, rdi
    cmp rsi, 0
    je error_division

    xor rdx, rdx
    idiv rsi

    mov rdi, mensaje_division
    xor rsi, rsi
    mov rsi, rax
    xor rax, rax
    call printf
    ret

error_division:
    mov rdi, msg_error_div
    xor rax, rax
    call printf
    ret

modulo:
    mov rax, rdi
    cmp rsi, 0
    je error_division
    xor rdx, rdx
    idiv rsi
    mov rdi, mensaje_modulo
    xor rsi, rsi
    mov rsi, rdx
    xor rax, rax
    call printf
    ret