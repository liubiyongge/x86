data segment
	Save dw ?	
data ends
code segment
	assume cs:code, ds:data
main proc far
start:
	push ds
	sub ax, ax
	push ax

	mov ax, data
	mov ds, ax
	
	mov ch, 4
	mov cl, 4
	mov bx, 0
lop:
	rol bx, cl
	mov ah, 01
	int 21h
	cmp al, 40h
	jl less
	cmp al, 'Z'
	jl less1
	sub al, 20h
less1:
	sub al, 7 
less:
	sub al, 30h
	add bl, al
	dec ch
	jnz lop

	mov Save, bx
	ret
main endp
code ends
	end start
