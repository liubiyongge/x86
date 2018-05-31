.386
data segment
	data1 dq 123456789abcdefh
	data2 dq 0fedcba987654321h
	data3 dq ?
data ends
;***************************8
code segment
start:
	mov ax, data
	mov ds, ax
	clc
	lea si, data1
	lea di, data2
	lea bx, data3
	mov cx, 2
back:
	mov eax, [si]
	adc eax, [di]
	mov [bx], eax
	inc si
	inc si
	inc si
	inc si
	inc di
	inc di
	inc di
	inc di
	inc bx
	inc bx
	inc bx
	inc bx
	loop back
	mov ax, 4c00h
	int 21h
code ends
	end start