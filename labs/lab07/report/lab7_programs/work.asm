%include 'in_out.asm'
section .data
msg_result db "Наименьшее число: ",0h
a dd 32
b dd 6
c dd 54
section .bss
min resb 10
section .text
global _start
_start:
; ---------- Преобразование a, b, c в числа (если нужно)
mov eax, [a]
mov [a], eax
mov eax, [b]
mov [b], eax
mov eax, [c]
mov [c], eax

; ---------- Находим наименьшее число
; Сначала сравниваем a и b, находим минимум
mov ecx, [a]    ; ecx = a
cmp ecx, [b]    ; Сравниваем a и b
jl compare_c    ; если a < b, переходим к сравнению с c
mov ecx, [b]    ; иначе ecx = b (b меньше)

compare_c:
; Теперь сравниваем найденный минимум (a или b) с c
cmp ecx, [c]    ; Сравниваем min(a,b) с c
jl save_result  ; если min(a,b) < c, сохраняем результат
mov ecx, [c]    ; иначе ecx = c (c меньше)

save_result:
mov [min], ecx  ; сохраняем наименьшее число

; ---------- Вывод результата
mov eax, msg_result
call sprint     ; Вывод сообщения 'Наименьшее число: '
mov eax, [min]
call iprintLF   ; Вывод наименьшего числа

call quit       ; Выход
