%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
result: DB 'f(g(x))=2*(3x-1)+7=',0

SECTION .bss
x: RESB 80
res: RESB 80

SECTION .text
GLOBAL _start

_start:
    ;------------------------------------------
    ; Основная программа
    ;------------------------------------------
    mov eax, msg
    call sprint          ; Вывод приглашения
    
    mov ecx, x
    mov edx, 80
    call sread           ; Ввод x с клавиатуры
    
    mov eax, x
    call atoi            ; Преобразование x в число
    call _calcul         ; Вызов подпрограммы _calcul
    
    mov eax, result
    call sprint          ; Вывод строки результата
    
    mov eax, [res]
    call iprintLF        ; Вывод результата на экран
    
    call quit

;------------------------------------------
; Подпрограмма вычисления f(g(x))
; Вход:  eax = x
; Выход: eax = 2*(3x-1)+7
;------------------------------------------
_calcul:
    push ebx            ; Сохраняем ebx в стеке
    
    ; Вычисляем g(x) = 3x-1
    call _subcalcul     ; Вход: eax = x, Выход: eax = g(x) = 3x-1
    
    ; Вычисляем f(g(x)) = 2*g(x) + 7
    mov ebx, 2
    mul ebx             ; eax = 2*g(x)
    add eax, 7          ; eax = 2*g(x) + 7
    
    mov [res], eax      ; Сохраняем результат
    
    pop ebx             ; Восстанавливаем ebx
    ret

;------------------------------------------
; Подпрограмма вычисления g(x) = 3x-1
; Вход:  eax = x
; Выход: eax = 3x-1
;------------------------------------------
_subcalcul:
    mov ebx, 3
    mul ebx             ; eax = 3*x
    sub eax, 1          ; eax = 3*x - 1
    ret                 ; Возвращаем результат в _calcul
