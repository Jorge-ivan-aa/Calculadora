section .data
global mensaje_num   ;Mensajes correspondientes.
mensaje_num db "Ingrese un numero: ", 0

global mensaje_op    ;Mensajes correspondientes.
mensaje_op db "Ingrese una de estas operaciones: (+, -, *, /, %): ", 0

global resultado      ;Mensajes correspondientes.
resultado db "El resultado es: ", 0

global error_msg      ;Mensajes correspondientes.
error_msg db "Ha ocurrido un error.", 0

global nueva_linea
nueva_linea db " ", 0

global msg_error_div
msg_error_div db "No se puede dividir por cero: ", 0

; Mensaje para math.asm (Validar información)
global mensaje_suma
mensaje_suma db "Se ha seleccionado la suma.", 10, 0

global mensaje_resta
mensaje_resta db "Se ha seleccionado la resta.", 10, 0

global mensaje_multiplicacion
mensaje_multiplicacion db "Se ha seleccionado la multiplicacion.", 10, 0

global mensaje_division
mensaje_division db "Se ha seleccionado la division.", 10, 0

global mensaje_modulo
mensaje_modulo db "Se ha seleccionado el modulo.", 10, 0

global mensaje_operacion_invalida
mensaje_operacion_invalida db "No se ha seleccionado ninguna operación válida", 10, 0  ; Agregando salto de línea