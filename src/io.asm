section .text
    global leer_numero, leer_operacion, mostrar_resultado
    extern mensaje_num, mensaje_op, resultado, nueva_linea, msg_error_div, printf, scanf, getchar

    ; Leer número desde la entrada
leer_numero:
    mov rdi, mensaje_num      ; Mostrar mensaje para ingresar número
    xor eax, eax              ; Limpiar eax antes de llamar a printf
    call printf               ; Llamar a printf para mostrar el mensaje

    mov rdi, format_num        ; Dirección del formato para leer el número
    mov rsi, numero            ; Dirección de la variable donde guardar el número
    xor eax, eax               ; Limpiar eax antes de llamar a scanf
    call scanf                 ; Llamar a scanf para leer el número

    ; Limpiar el buffer de entrada para evitar caracteres no deseados
    call limpiar_buffer

    mov eax, [numero]          ; Cargar el número leído en eax (retorno)
    ret                        ; Retornar el número

    ; Leer la operación (+, -, *, /, %)
leer_operacion:
    mov rdi, mensaje_op        ; Mostrar mensaje para ingresar operación
    xor eax, eax               ; Limpiar eax antes de llamar a printf
    call printf                ; Llamar a printf para mostrar el mensaje

    mov rdi, format_op         ; Dirección del formato para leer la operación
    mov rsi, operacion         ; Dirección de la variable donde guardar la operación
    xor eax, eax               ; Limpiar eax antes de llamar a scanf
    call scanf                 ; Llamar a scanf para leer la operación

    mov al, [operacion]        ; Cargar la operación leída en al (retorno)
    ret                        ; Retornar la operación

    ; Función para limpiar el buffer de entrada
limpiar_buffer:
    xor eax, eax
limpiar_loop:
    call getchar               ; Leer cada carácter residual en el buffer
    cmp al, 10                 ; Comparar con salto de línea (10 es '\n')
    jne limpiar_loop           ; Repetir hasta encontrar un salto de línea
    ret                        ; Terminar limpieza del buffer

    ; Mostrar el resultado en consola
mostrar_resultado:
    cmp rax, -1               ; Compara si rax contiene -1 (error)
    je error_division_msg      ; Si es -1, saltar a mostrar mensaje de error

    mov rdi, resultado         ; Mostrar mensaje de resultado
    mov rsi, rax               ; Pasar el resultado como argumento
    xor eax, eax               ; Limpiar eax
    call printf                ; Mostrar resultado
    jmp fin

error_division_msg:
    mov rdi, msg_error_div     ; Mensaje de error para división
    xor eax, eax
    call printf

fin:
    mov rdi, nueva_linea       ; Añadir una nueva línea
    xor eax, eax
    call printf
    ret                      ; Retornar

section .data
    format_num db "%d", 0      ; Formato para leer un número entero
    format_op db "%c", 0       ; Formato para leer un carácter (operación)
    numero dd 0                ; Variable para almacenar el número
    operacion db 0             ; Variable para almacenar la operación