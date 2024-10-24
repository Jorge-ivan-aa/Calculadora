section .data
    mensaje_op db "Ingrese la operación (+, -, *, /, %): ", 0
    mensaje_num db "Ingrese un número: ", 0
    resultado db "Resultado: %d", 0

section .bss
    num1 resd 1
    num2 resd 1
    operacion resb 1

section .text
    global main
    extern leer_numero, leer_operacion, mostrar_resultado, suma, resta, multiplicacion, division, modulo

main:
    ; Leer primer número
    call leer_numero
    mov [num1], eax

    ; Leer segundo número
    call leer_numero
    mov [num2], eax

    ; Leer la operación
    call leer_operacion
    mov [operacion], al

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
    call mostrar_resultado
    jmp salir

salir:
    mov eax, 1          ; syscall para salir
    xor ebx, ebx        ; código de salida 0
    int 0x8