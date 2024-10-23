section .text
    global SUMA, RESTA, MULTIPLICACION, DIVISION, MODULO

%macro SUMA 2
    mov eax, %1      ; Mueve el primer operando a eax
    add eax, %2      ; Suma el segundo operando
%endmacro

%macro RESTA 2
    mov eax, %1      ; Mueve el primer operando a eax
    sub eax, %2      ; Resta el segundo operando
%endmacro

%macro MULTIPLICACION 2
    mov eax, %1      ; Mueve el primer operando a eax
    imul eax, %2     ; Multiplica por el segundo operando
%endmacro

%macro DIVISION 2
    mov eax, %1      ; Mueve el dividendo a eax
    mov edx, 0       ; Limpiar edx para evitar desbordamiento
    mov ebx, %2      ; Mueve el divisor a ebx
    cmp ebx, 0
    je ERROR_DIVISION
    idiv ebx         ; Realiza la división
%endmacro

%macro MODULO 2
    mov eax, %1      ; Mueve el dividendo a eax
    mov edx, 0       ; Limpiar edx para evitar desbordamiento
    mov ebx, %2      ; Mueve el divisor a ebx
    cmp ebx, 0
    je ERROR_DIVISION
    idiv ebx         ; Realiza la división
    mov eax, edx     ; El residuo queda en edx
%endmacro

%macro ERROR_DIVISION 0
    push error_msg
    call printf
    add esp, 4       ; Limpiar la pila
    ret
%endmacro

