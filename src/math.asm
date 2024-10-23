section .text
    global suma, resta, multiplicacion, division, modulo

suma:
    add eax, ebx
    ret

resta:
    sub eax, ebx
    ret

multiplicacion:
    imul eax, ebx
    ret

division:
    cmp ebx, 0
    je error_division
    xor edx, edx   ; Limpiar edx para la división
    idiv ebx
    ret

modulo:
    cmp ebx, 0
    je error_division
    xor edx, edx   ; Limpiar edx para la operación de módulo
    idiv ebx
    mov eax, edx   ; El resto de la división se encuentra en edx
    ret

error_division:
    mov eax, -1    ; Usar -1 como código de error
    ret