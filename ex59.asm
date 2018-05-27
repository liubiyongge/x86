data segment
	low_idx dw ?
	high_idx dw ?
	list dw 12, 11, 22, 33, 44, 55, 66, 77, 88, 99, 111, 222, 333
data ends
;*************************88
code segment
main proc far
	assume cs:code, ds:data, es:data
start:
	push ds
	sub ax, ax
	push ax

	mov ax, data
	mov ds, ax
	mov es, ax
	mov ax, 55
	lea di, list
	cmp ax, es:[di + 2]
	ja chk_last
	lea si, es:[di + 2]
	je exit
	stc
	jmp exit
chk_last:
	mov si, es:[di]
	shl si, 1;mul 2
	add si, di
	cmp ax, es:[si]
	jb search
	je exit
	stc
	jmp exit
search:
	mov low_idx, 1
	mov bx, es:[di]
	mov high_idx, bx
	mov bx, di
mid:
	mov cx, low_idx
	mov dx, high_idx
	cmp cx, dx
	ja no_match
	add cx, dx
	shr cx, 1
	mov si, cx
	shl si, 1
compare:
	cmp ax, es:[bx + si]
	je exit
	ja higher
	dec cx
	mov high_idx, cx
	jmp mid
higher:
	inc cx
	mov low_idx, cx
	jmp mid
no_match:
	stc
	jc show
show:
	movs list, 1111
exit:
	ret
main endp
code ends
	end start








