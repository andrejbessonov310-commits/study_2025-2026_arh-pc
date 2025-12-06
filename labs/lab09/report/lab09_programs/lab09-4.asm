%include 'in_out.asm'

SECTION .data
    result_msg: DB 'Результат: ',0

SECTION .text
    GLOBAL _start

_start:
    ; ---- Вычисление выражения (3+2)*4+5
    mov ebx, 3          ; ebx = 3
    mov eax, 2          ; eax = 2
    add ebx, eax        ; ebx = 3 + 2 = 5
    
    ; Теперь нужно умножить ebx (5) на 4
    mov eax, ebx        ; eax = 5 (перемещаем результат сложения в eax)
    mov ecx, 4          ; ecx = 4
    mul ecx             ; eax = 5 * 4 = 20
    
    add eax, 5          ; eax = 20 + 5 = 25
    mov edi, eax        ; сохраняем результат
    
    ; ---- Вывод результата на экран
    mov eax, result_msg
    call sprint
    mov eax, edi
    call iprintLF
    
    call quit
