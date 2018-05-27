data segment 
	save_cnt dw ?
	start_addr dw ?
data ends
;******************************8
edata segment
	array dw 10,6,7,13,2,45,32,23,12,13,15
code segment
main proc far
start:
	assume cs:code, ds:data, es:edata
	push ds
	push cx
	push ax
	push bx
;init ds 
	mov ax, data
	mov ds, ax
	mov ax, edata
	mov es, ax

	lea di, array
	mov start_addr, di
	mov cx, es:[di]
	mov save_cnt,cx
init:
	mov bx,1
	dec save_cnt
	jz sorted
	mov cx, save_cnt
	mov di,start_addr
next:
	add di,2
	mov ax, es:[di]
	cmp es:[di+2], ax
	jae cont
	xchg es:[di+2], ax
	mov es[di], ax
	sub bx, bx
cont: 
	loop next
	cmp bx,0
	je init
sorted:
	mov di,start_addr
	pop bx
	pop ax
	pop cx
	pop ds
	ret
main endp
code ends
	end start


