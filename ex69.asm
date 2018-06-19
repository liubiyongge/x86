;converts hex on keybord to dec on screen

display equ 2h
key_in equ 1h
doscall equ 21h
;**********************88
hexidec segment
main proc far
	assume cs:hexidec
start:
;set to back dos
	push ds 
	sub ax, ax
	push ax 
;main part of program goes here
	call hexibin ;keybord to binary
	call crlf	 ;print cr&lf
	call binidec ;binary to decimal
	call crlf    ;print cr&lf
	jmp main     ;get next input
	ret			 ;return to DOS
main endp
;--------------------------------
hexibin proc near
	mov bx, 0 ;clear bx for number
newchar:
	mov ah, key_in ;keybord input
	int doscall
	sub al, 30h ;ASCII to binary
	jl exit
	cmp al, 10d
	jl add_to
	sub al, 27h
	cmp al, 0ah
	jl exit
	cmp al, 10h
	jge exit
add_to:
	mov cl, 4
	shl bx, cl
	mov ah, 0
	add bx, ax
	jmp newchar
exit:
	ret
hexibin endp
;------------------------------------
binidec proc near
	mov cx, 10000d ;divide by 10000
	call dec_div
	mov cx, 1000d
	call dec_div
	mov cx, 100d
	call dec_div
	mov cx, 10d
	call dec_div
	mov cx, 1d
	call dec_div
	ret
;-----------------------------------
dec_div proc near
	mov ax, bx
	mov dx, 0
	div cx
	mov bx, dx
	mov dl, al
	add dl, 30h
	mov ah, display
	int doscall
	ret
dec_div endp
binidec endp
;-------------------------------
crlf proc near
	mov dl, 0ah
	mov ah, display
	int doscall
	mov dl, 0dh
	mov ah, display
	int doscall
ret
crlf endp
hexidec ends
	end start



