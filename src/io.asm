section .text
    global leer_numero, leer_operacion, mostrar_resultado

    ; Leer número desde la entrada
leer_numero:
    push mensaje_num
    call printf
    add esp, 4          ; Limpiar
    push numero
    call scanf          ; Leer el número
    add esp, 4          ; Limpiar
    ret

    ; Leer la operación (+, -, *, /, %)
leer_operacion:
    push mensaje_op
    call printf
    add esp, 4          ; Limpiar
    push operacion
    call scanf          ; Leer la operación
    add esp, 4          ; Limpiar
    ret

    ; Mostrar el resultado en consola
mostrar_resultado:
    push eax            ; Guardar el resultado
    push resultado      ; Mensaje del formato
    call printf
    add esp, 8          ; Limpiar
    ret
