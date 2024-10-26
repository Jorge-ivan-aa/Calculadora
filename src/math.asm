section .data


section .text
    global suma, resta, multiplicacion, division, modulo
    extern mensaje_suma, mensaje_resta, mensaje_multiplicacion, mensaje_division, mensaje_modulo, printf

suma:
    mov rax, rdi         ; Cargar num1 en rax
    add rax, rsi         ; Sumar num2 a rax
    mov rdi, mensaje_suma; Cargar la dirección del mensaje
    xor rsi, rsi         ; Limpiar rsi para printf
    mov rsi, rax         ; Mover el resultado a rsi
    xor rax, rax         ; Limpiar rax para printf
    call printf           ; Llamar a printf
    ret

resta:
    mov rax, rdi         ; Cargar num1 en rax
    sub rax, rsi         ; Restar num2 de rax
    mov rdi, mensaje_resta; Cargar la dirección del mensaje
    xor rsi, rsi         ; Limpiar rsi para printf
    mov rsi, rax         ; Mover el resultado a rsi
    xor rax, rax         ; Limpiar rax para printf
    call printf           ; Llamar a printf
    ret

multiplicacion:
    mov rax, rdi         ; Cargar num1 en rax
    imul rax, rsi        ; Multiplica num2 por rax
    mov rdi, mensaje_multiplicacion; Cargar la dirección del mensaje
    xor rsi, rsi         ; Limpiar rsi para printf
    mov rsi, rax         ; Mover el resultado a rsi
    xor rax, rax         ; Limpiar rax para printf
    call printf           ; Llamar a printf
    ret

division:
    mov rax, rdi         ; Cargar num1 en rax
    cmp rsi, 0
    je error_division     ; Manejo de error si el divisor es cero
    xor rdx, rdx         ; Limpiar rdx para la división
    idiv rsi             ; Realizar división, resultado en rax
    mov rdi, mensaje_division; Cargar la dirección del mensaje
    xor rsi, rsi         ; Limpiar rsi para printf
    mov rsi, rax         ; Mover el resultado a rsi
    xor rax, rax         ; Limpiar rax para printf
    call printf           ; Llamar a printf
    ret

modulo:
    mov rax, rdi         ; Cargar num1 en rax
    cmp rsi, 0
    je error_division     ; Manejo de error si el divisor es cero
    xor rdx, rdx         ; Limpiar rdx para la operación de módulo
    idiv rsi             ; Realizar división
    mov rdi, mensaje_modulo; Cargar la dirección del mensaje
    xor rsi, rsi         ; Limpiar rsi para printf
    mov rsi, rdx         ; Guardar el resto (resultado) en rsi
    xor rax, rax         ; Limpiar rax para printf
    call printf           ; Llamar a printf
    ret

error_division:
    mov rdi, mensaje_division; Aquí puedes manejar el error de división por cero
    xor rsi, rsi         ; Limpiar rsi para printf
    mov rsi, -1          ; Usar -1 como código de error
    xor rax, rax         ; Limpiar rax para printf
    call printf
    ret