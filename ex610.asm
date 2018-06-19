;信息检索系统
;-------------------
datarea segment
thirty db 30
;message table
msg0 db 'I like my IBM_PC--------------'
msg1 db '8088 programming is fun-------'
msg2 db 'Time to buy more diskettes----'
msg3 db 'This program works------------'
msg4 db 'Turn off that printer---------'
msg5 db 'I have more memory than you---'
msg6 db 'The PSP can be useful---------'
msg7 db 'BASIC was easier than this----'
msg8 db 'DOS is indispensable----------'
msg9 db 'Last massage of the day-------'
;error message
errmsg db 'error!!! invalid parameter'
datarea ends
stack segment ;define code segment
	db 256 dup(0)
	tos label word
stack ends
;----------------------------
program segment
main proc far
	assume cs:program, ds:datarea, ss:stack
start:
	
	
	mov ax, stack
	mov ss, ax
	mov sp, offset tos;设置自己堆栈是要注意返回dos时候的push ds push ax

	
	push ds
	sub ax, ax
	push ax
	
	mov ax, datarea
	mov ds, ax
begin:
	mov ah, 1
	int 21h
	sub al, '0'
	jc error
	cmp al, 9
	ja error
	mov bx, offset msg0
	mul thirty
	add bx, ax
	call display
	jmp begin
error:
	mov bx, offset errmsg
	call display
	ret
;--------------------
display proc near
	mov cx, 30
displ:
	mov dl, [bx]
	call dispchar
	inc bx
	loop displ
	mov dl, 0dh
	call dispchar
	mov dl, 0ah
	call dispchar
	ret
display endp
;-----------------------------
dispchar proc near
	mov ah, 2
	int 21h
	ret
dispchar endp
;-----------------------------
main endp
program ends
	end start
