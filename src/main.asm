section .bss
    num1 resq 1
    num2 resq 1
    operacion resb 1

section .text
    global main, salir, ciclo
    extern mensaje_ciclo, mensaje_inicio_ciclo, leer_numero, leer_operacion, suma, resta, multiplicacion, division, modulo, printf
    extern mensaje_operacion_invalida

main:
    mov rdi, mensaje_inicio_ciclo 
    xor eax, eax
    call printf

ciclo:

    call leer_numero
    mov [num1], rax

    call leer_numero
    mov [num2], rax

    call leer_operacion
    mov [operacion], al


    cmp byte [operacion], 'q'
    je salir
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

    call mostrar_msj_op_invalida
    jmp ciclo

mostrar_msj_op_invalida:
    mov rdi, mensaje_operacion_invalida
    xor rax, rax
    call printf
    ret
    
realizar_suma:
    mov rdi, [num1]
    mov rsi, [num2]
    call suma
    jmp iterar

realizar_resta:
    mov rdi, [num1]
    mov rsi, [num2]
    call resta
    jmp iterar

realizar_multiplicacion:
    mov rdi, [num1]
    mov rsi, [num2]
    call multiplicacion
    jmp iterar

realizar_division:
    mov rdi, [num1]
    mov rsi, [num2]
    call division
    jmp iterar

realizar_modulo:
    mov rdi, [num1]
    mov rsi, [num2]
    call modulo
    jmp iterar

iterar:
    mov rdi, mensaje_ciclo 
    xor eax, eax
    call printf
    jmp ciclo

salir:
    mov rax, 60
    xor rdi, rdi
    syscall