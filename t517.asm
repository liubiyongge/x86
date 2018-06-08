data segment
	men db 4 dup(?)
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

;设置ax威2a49h
	mov ax, 2a49h
	mov cl, 4
	mov ch, 4
	mov si, 0
lop:
	mov bl, al
	and bl, 0fh
	cmp bl, 9
	jg big
	add bl, 30h
	jmp next
big:
	add bl, 37h
next:
	mov men[si], bl
	inc si
	ror ax, cl
	dec ch
	jnz lop
	ret
main endp
code ends
	end start



