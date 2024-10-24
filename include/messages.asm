section .data
global mensaje_num   ; Hace la etiqueta accesible desde otros módulos
mensaje_num db "Ingrese un numero: ", 0

global mensaje_op    ; Hace la etiqueta accesible desde otros módulos
mensaje_op db "Ingrese una operacion: ", 0

global resultado      ; Hace la etiqueta accesible desde otros módulos
resultado db "El resultado es: ", 0

global error_msg      ; Hace la etiqueta accesible desde otros módulos
error_msg db "Ha ocurrido un error", 0