data segment
	arg dw 100 dup(5)
	count dw 100
	sum dw ?
data ends
;******************
code segment
main proc far
	assume cs:code, ds:data
start:
	push ds
	sub ax, ax
	push ax

	mov ax,data
	mov ds, ax
	call near ptr proadd
	ret
main endp
proadd proc near
	push ax
	push cx
	push si
	lea si, arg
	mov cx, count
	xor ax,ax
next:
	add ax, [si]
	add si, 2
	loop next
	mov sum, ax
	pop si
	pop cx
	pop ax
	ret
proadd endp
code ends
	end start