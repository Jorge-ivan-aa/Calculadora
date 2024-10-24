section .text
    global leer_numero, leer_operacion, mostrar_resultado
    extern mensaje_num, mensaje_op, resultado, printf, scanf

    ; Leer número desde la entrada
leer_numero:
    mov rdi, mensaje_num
    xor eax, eax 
    call printf
    mov rdi, numero
    mov rsi, format_num
    xor eax, eax 
    call scanf 
    mov eax, [numero]  ;retornar el numero
    ret

    ; Leer la operación (+, -, *, /, %)
    leer_operacion:
    mov rdi, mensaje_op      ; Primer argumento de printf (cadena)
    xor eax, eax             ; Limpiar eax
    call printf              ; Llamar a printf
    mov rdi, operacion       ; Dirección de la variable donde guardar la operación
    mov rsi, format_op       ; Formato para scanf (espera un carácter)
    xor eax, eax             ; Limpiar eax antes de llamar a scanf
    call scanf               ; Llamar a scanf
    mov al, [operacion]      ; Cargar la operación leída en al (retorno)
    ret                      ; Retornar la operación

    ; Mostrar el resultado en consola
    mostrar_resultado:
    mov rdi, resultado       ; Primer argumento de printf (cadena de formato)
    mov rsi, rax             ; Pasar el resultado como segundo argumento
    xor eax, eax             ; Limpiar eax
    call printf              ; Llamar a printf
    ret

    section .data
    format_num db "%d", 0      ; Formato para leer un número entero
    format_op db "%c", 0       ; Formato para leer un carácter
    numero dd 0                ; Variable para almacenar el número
    operacion db 0             ; Variable para almacenar la operación