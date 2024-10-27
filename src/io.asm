section .text
    global leer_numero, leer_operacion, mostrar_resultado
    extern ciclo, mensaje_error_num, mensaje_num, mensaje_op, mensaje_mensaje_inicio_ciclo, nueva_linea, msg_error_div, printf, scanf, getchar

leer_numero:
    mov rdi, mensaje_num
    xor eax, eax
    call printf

intentar_entrada:
    mov rdi, format_num
    mov rsi, numero
    xor eax, eax
    call scanf

    cmp eax, 1
    jne numero_invalido

    call limpiar_buffer

    mov eax, [numero]
    ret

numero_invalido:
    call limpiar_buffer

    mov rdi, mensaje_error_num
    xor eax, eax
    call printf

    jmp leer_numero

leer_operacion:
    mov rdi, mensaje_op
    xor eax, eax
    call printf

    mov rdi, format_op
    mov rsi, operacion
    xor eax, eax
    call scanf

    mov al, [operacion]
    ret

limpiar_buffer:
    xor eax, eax

limpiar_loop:
    call getchar
    cmp al, 10
    jne limpiar_loop
    ret

section .data
    format_num db "%d", 0
    format_op db "%c", 0
    numero dd 0
    operacion db 0