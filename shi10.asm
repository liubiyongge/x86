code segment
	assume cs:code
main proc far
start:
	push ds
	sub ax, ax
	push ax

	mov cx, 15
lop1:
	call outspaces
	call outrow
	loop lop1
	
	ret
main endp
;-----------------------output 8 head of space 如果设置cx为0，会循环ffff次
outspaces proc near
	push cx
	mov ax, 15
	sub ax, cx
	mov cx, ax
	cmp cx, 0
	jz exit
lop2:
	call outspace
	loop lop2
exit:
	pop cx
	ret

outspaces endp
;-----------------------output onerow 8 and followed space
outrow proc near
	push cx
	mov cx, 15
lop3:
	call out8
	call outspace
	loop lop3
	call outcrlf
	pop cx
	ret
outrow endp
;-----------------------output space
outspace proc near
	push ax
	push dx
	mov dl, 20h
	mov ah, 2h
	int 21h
	pop dx
	pop ax
	ret
outspace endp
;------------------------output 8
out8 proc near
	push ax
	push dx
	mov dl, 38h
	mov ah, 2h
	int 21h
	pop dx
	pop ax
	ret
out8 endp
;------------------------output ctrl+left
outcrlf proc near
	push ax
	push dx
	mov dl, 0dh
	mov ah, 2h
	int 21h
	mov dl, 0ah
	mov ah, 2h
	int 21h
	pop dx
	pop ax
	ret
outcrlf endp
;-----------------------
code ends
	end start