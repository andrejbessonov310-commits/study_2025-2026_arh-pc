%include 'in_out.asm'
section .data
msg_x db 'x: ',0h
msg_a db 'a: ',0h
msg_result db "Результат: ",0h
x dd 0
a dd 0
result dd 0
section .bss
section .text
global _start
_start:
; ---------- Ввод x
mov eax, msg_x
call sprint
mov ecx, x
mov edx, 10
call sread
mov eax, x
call atoi
mov [x], eax

; ---------- Ввод a
mov eax, msg_a
call sprint
mov ecx, a
mov edx, 10
call sread
mov eax, a
call atoi
mov [a], eax

; ---------- Вычисление функции f(x)
; Сравниваем x и a
mov ebx, [x]
mov ecx, [a]
cmp ebx, ecx    ; Сравниваем x и a
jl less_than    ; если x < a, переходим на less_than

; x ≥ a: f(x) = x + 10
greater_or_equal:
add ebx, 10     ; ebx = x + 10
mov [result], ebx
jmp output

; x < a: f(x) = a + 10
less_than:
add ecx, 10     ; ecx = a + 10
mov [result], ecx

; ---------- Вывод результата
output:
mov eax, msg_result
call sprint     ; Вывод сообщения 'Результат: '
mov eax, [result]
call iprintLF   ; Вывод результата вычислений

call quit       ; Выход
