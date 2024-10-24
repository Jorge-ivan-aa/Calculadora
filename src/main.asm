section .data
    mensaje_op db "Ingrese la operación (+, -, *, /, %): ", 0
    mensaje_num db "Ingrese un número: ", 0
    resultado db "Resultado: %d", 10, 0  ; Agrega salto de línea para el resultado

section .bss
    num1 resd 1  ; Reservar espacio para el primer número
    num2 resd 1  ; Reservar espacio para el segundo número
    operacion resb 1  ; Reservar espacio para el operador

section .text
    global main
    extern leer_numero, leer_operacion, mostrar_resultado, suma, resta, multiplicacion, division, modulo

main:
    ; Leer primer número
    call leer_numero
    mov [num1], eax  ; Guardar primer número en memoria

    ; Leer segundo número
    call leer_numero
    mov [num2], eax  ; Guardar segundo número en memoria

    ; Leer la operación
    call leer_operacion
    mov [operacion], al  ; Guardar la operación en memoria

    ; Realizar operación según el operador
    cmp byte [operacion], '+'
    je realizar_suma
    cmp byte [operacion], '-'
    je realizar_resta
    cmp byte [operacion], '*'
    je realizar_multiplicacion
    cmp byte [operacion], '/'
    je realizar_division
    cmp byte [operacion], '%'
    je realizar_modulo

    ; Si no se encuentra la operación, termina el programa
    jmp salir

realizar_suma:
    mov eax, [num1]
    mov ebx, [num2]
    call suma
    jmp mostrar_res

realizar_resta:
    mov eax, [num1]
    mov ebx, [num2]
    call resta
    jmp mostrar_res

realizar_multiplicacion:
    mov eax, [num1]
    mov ebx, [num2]
    call multiplicacion
    jmp mostrar_res

realizar_division:
    mov eax, [num1]
    mov ebx, [num2]
    call division
    jmp mostrar_res

realizar_modulo:
    mov eax, [num1]
    mov ebx, [num2]
    call modulo
    jmp mostrar_res

mostrar_res:
    call mostrar_resultado  ; Mostrar el resultado de la operación
    jmp salir

salir:
    mov rax, 60      ; syscall número para salir en 64 bits
    xor rdi, rdi     ; código de salida 0
    syscall          ; Llamada al sistema para salir
