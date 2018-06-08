;书本212子程序
public proadd
;********************88common俩个程序使用同一个数据段地址
data segment common
	ary dw 100 dup(5)
	count dw 100
	sum dw ?
data ends
code2 segment
proadd proc far
	assume cs:code2, ds:data

	mov ax, data
	mov ds, ax

	push ax
	push cx
	push si
	lea si, ary
	mov cx, count
	xor ax, ax
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
;--------------
code2 ends
	end