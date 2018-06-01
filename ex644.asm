;通过寄存器传递参数地址法的程序实现
;*****************************8
data segment
	ary dw 100 dup(3)
	count dw 100
	sum dw ?
data ends
;****************************
stack segment
	dw 100 dup(?)
	tos label word
stack ends
;************************88
code1 segment
main proc far
	assume cs:code1, ds:data, ss:stack
start:
	mov ax, stack
	mov ss, ax
	mov sp, tos

	push ds
	sub ax, ax
	push ax

	mov ax, data
	mov ds, ax
	mov bx, offset ary
	push bx
	mov bx, offset count
	push bx
	mov bx, offset sum
	push bx
	call far ptr proadd
	ret
main endp
code1 ends
;**************************8
code2 segment
	assume cs: code2
proadd proc far
	push bp
	mov bp, sp
	push ax
	push cx
	push si
	push di
	mov si, [bp+0ah]
	mov di, [bp+8]
	mov cx, [di]
	mov di, [bp+6]
	xor ax, ax
next:
	add ax, [si]
	add si, 2
	loop next
	mov [di], ax
	pop di
	pop si
	pop cx
	pop ax
	pop bp
	ret 6
proadd endp
code2 ends
	end start
