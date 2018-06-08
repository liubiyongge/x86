data segment
	Save dw 2 dup(?)	
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
	
	mov ch, 8
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
	cmp ch, 4
	jnz countine
	mov [Save+2], bx
	mov bx, 0
countine:
	cmp ch, 0
	jnz lop
	mov Save, bx
	ret
main endp
code ends
	end start
