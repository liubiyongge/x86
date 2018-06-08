data segment
	SINGLIST dd sing1
			 dd sing2
			 dd sing3
			 dd sing4
			 dd sing5
	errors db "num must in 1-5$"
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
begin:
	mov ah, 01
	int 21h
	cmp al, 0Dh
	jz exit
	sub al, '1';输入为字符asicc
	cmp al, 4
	jg error
	mov bx, offset SINGLIST
	mov ah, 0
	mov cx, 4
	mul cx
	add bx, ax
	jmp dword ptr[bx]
sing1:
	jmp begin 
sing2:
	jmp begin
sing3:
	jmp begin
sing4:
	jmp begin
sing5:
	jmp begin
error:
	mov dl, offset errors
	mov ah, 09h
	int 21h
	jmp begin
exit:
	ret
main endp
code ends
	end start



