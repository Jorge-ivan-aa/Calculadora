section .data
global mensaje_num   ; Hace la etiqueta accesible desde otros módulos
mensaje_num db "Ingrese un numero: ", 0

global mensaje_op    ; Hace la etiqueta accesible desde otros módulos
mensaje_op db "Ingrese una de estas operaciones: (+, -, *, /, %): ", 0

global resultado      ; Hace la etiqueta accesible desde otros módulos
resultado db "El resultado es: ", 0

global error_msg      ; Hace la etiqueta accesible desde otros módulos
error_msg db "Ha ocurrido un error.", 0

global nueva_linea
nueva_linea db " ", 0

global msg_error_div
msg_error_div db "No se puede dividir por cero: ", 0