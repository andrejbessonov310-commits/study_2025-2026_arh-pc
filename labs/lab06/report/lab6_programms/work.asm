%include 'in_out.asm'

SECTION .data
    msg db 'Программа вычисления функции y = (5 + x)^2 - 3',0
    expr db 'Вычисляем: y = (5 + x)^2 - 3',0
    prompt db 'Введите значение x: ',0
    result db 'Результат: y = ',0
    newline db 10,0

SECTION .bss
    x resb 10

SECTION .text
global _start

_start:
    ; Вывод выражения для вычисления
    mov eax, msg
    call sprint
    mov eax, newline
    call sprint
    
    mov eax, expr
    call sprint
    mov eax, newline
    call sprint
    mov eax, newline
    call sprint

    ; Запрос ввода значения x
    mov eax, prompt
    call sprint
    
    ; Чтение ввода
    mov ecx, x
    mov edx, 10
    call sread

    ; Проверка и преобразование ввода
    mov eax, x
    call atoi        ; Преобразуем строку в число в EAX

    ; Вычисление y = (5 + x)^2 - 3
    mov ebx, eax     ; Сохраняем x в EBX
    
    add ebx, 5       ; ebx = 5 + x
    mov eax, ebx     ; eax = 5 + x
    imul eax, ebx    ; eax = (5 + x)^2
    sub eax, 3       ; eax = (5 + x)^2 - 3

    ; Сохраняем результат
    push eax

    ; Вывод результата
    mov eax, result
    call sprint
    
    pop eax          ; Восстанавливаем результат
    call iprint      ; Выводим число
    
    mov eax, newline
    call sprint

    call quit
