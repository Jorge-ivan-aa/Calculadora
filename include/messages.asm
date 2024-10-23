section .data
    mensaje_num db "Ingrese un número: ", 0
    mensaje_op db "Ingrese la operación (+, -, *, /, %): ", 0
    resultado db "Resultado: %d", 10, 0
    error_msg db "Error: División por cero.", 10, 0
