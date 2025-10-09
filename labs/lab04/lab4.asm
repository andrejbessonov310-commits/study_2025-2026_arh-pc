; lab4.asm
SECTION .data
	lab4:	DB 'Bessonov Andrey',10
	
	lab4Len: EQU $-lab4
	
SECTION .text
	GLOBAL _start
	
_start:
	mov eax,4
	mov ebx,1
	mov ecx,lab4
	mov edx,lab4Len
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
