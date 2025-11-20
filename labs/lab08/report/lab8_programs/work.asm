%include 'in_out.asm'
SECTION .data
msg_func db "Функция: f(x)=6x+13",0
msg_result db "Результат: ",0
SECTION .text
global _start
_start:
pop ecx         ; Извлекаем количество аргументов
pop edx         ; Извлекаем имя программы
sub ecx, 1      ; Уменьшаем количество аргументов на 1
mov esi, 0      ; Используем esi для хранения суммы

; Вывод сообщения о функции
mov eax, msg_func
call sprintLF

next:
cmp ecx, 0      ; Проверяем, есть ли еще аргументы
jz _end         ; Если аргументов нет - выход

pop eax         ; Извлекаем аргумент (x) из стека
call atoi       ; Преобразуем в число

; Вычисляем f(x) = 6x + 13
mov ebx, eax    ; Сохраняем x в ebx
imul eax, 6     ; eax = 6x
add eax, 13     ; eax = 6x + 13

; Добавляем результат к общей сумме
add esi, eax    ; esi = esi + f(x)

loop next       ; Переход к следующему аргументу

_end:
; Вывод результата
mov eax, msg_result
call sprint
mov eax, esi    ; Записываем сумму в eax
call iprintLF   ; Печать результата
call quit       ; Завершение программы
