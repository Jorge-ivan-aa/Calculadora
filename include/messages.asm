section .data
global mensaje_num    
mensaje_num db "Ingrese un numero: ", 0

global mensaje_op     
mensaje_op db "Ingrese una de estas operaciones: (+, -, *, /, %): ", 0

global mensaje_inicio_ciclo       
mensaje_inicio_ciclo db "", 10, "-_-_-_-_ Calculadora en Asembler _-_-_-_- ", 10, 10, "Desarrollada por jorge-ivan-aa y chaos086", 10, "para salir escriba 'exit' como parametro", 10, 10, 0

global mensaje_ciclo       
mensaje_ciclo db "", 10, 10, ".. Continuando.", 10, "para salir escriba 'exit' como parametro.", 10, 10, 0

global error_msg       
error_msg db "Ha ocurrido un error.", 0

global nueva_linea
nueva_linea db " ", 0

global msg_error_div
msg_error_div db "No se puede dividir por cero: ", 0

; Mensaje para math.asm
global mensaje_suma
mensaje_suma db "El resultado de la suma es: %lld", 10, 0

global mensaje_resta
mensaje_resta db "El resultado de la resta es: %lld", 10, 0

global mensaje_multiplicacion
mensaje_multiplicacion db "El resultado de la multiplicación es: %lld", 10, 0

global mensaje_division
mensaje_division db "El resultado de la división es: %lld", 10, 0

global mensaje_modulo
mensaje_modulo db "El resultado del módulo es: %lld", 10, 0

global mensaje_operacion_invalida
mensaje_operacion_invalida db "No se ha seleccionado ninguna operación válida", 10, 0  ; Agregando salto de línea