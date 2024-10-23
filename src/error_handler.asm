section .data
    error_msg db "Error: División por cero", 0

section .text
    global manejar_error

manejar_error:
    push error_msg
    call printf
    add esp, 4
    ret
