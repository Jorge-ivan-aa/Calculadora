section .text
    global leer_numero, leer_operacion, mostrar_resultado

leer_numero:
    ; Leer número desde la entrada
    push mensaje_num
    call printf
    add esp, 4          ; Limpiar la pila
    push numero
    call scanf          ; Leer el número del usuario
    add esp, 4          ; Limpiar la pila
    ret

leer_operacion:
    ; Leer la operación (+, -, *, /, %)
    push mensaje_op
    call printf
    add esp, 4          ; Limpiar la pila
    push operacion
    call scanf          ; Leer la operación del usuario
    add esp, 4          ; Limpiar la pila
    ret

mostrar_resultado:
    ; Mostrar el resultado en consola
    push eax            ; Guardar el resultado en la pila
    push resultado      ; Mensaje del formato de resultado
    call printf
    add esp, 8          ; Limpiar la pila
    ret
