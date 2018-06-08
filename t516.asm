datas segment
	DATA dw 100h dup(5)
datas ends
code segment
	assume cs:code, ds:datas
main proc far
start:
	push ds
	sub ax, ax
	push ax

	mov ax, datas
	mov ds, ax

	mov si, 0
	mov ax, 0
	mov dx, 0
	mov cx, 100h
lop:
	add ax, DATA[si]
	adc dx, 0
	add si,2
	loop lop

	mov bx, 100h
	idiv bx
	mov si, 0
	mov bx, 0
	mov cx, 100h
	cmp dx, 0
	jnz lop2

lop1:
	cmp DATA[si], ax
	jnl countinue
	inc bx
countinue:
	add si, 2
	loop lop1
	jmp exit

lop2:
	cmp DATA[si], ax
	jg countinue1
	inc bx
countinue1:
	inc si
	loop lop1

exit:
;测试
	mov DATA, ax
	mov DATA[2], bx
	ret
main endp
code ends
	end start


