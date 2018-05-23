datarea segemnt
	a dw 8, 5, 16, 84, 32
datarea ends
;************************88
code segemnt
;**************************88
main proc far
	assume cs:code,ds:datarea
start:
	
;set up for return
	push dx
	sub ax,ax
	push ax

;set Ds register to current data segment
	mov ax,datarea
	mov dx,ax
;main part of program goes here
	mov cx,5
	dec cx
loop1:
	mov di,cx
	mov bx,0
loop2:
	mov ax,a[bx]
	cmp ax,a[bx+2]
	jge coutinue
	xchg ax,a[bx+2]
	mov a[bx],ax
coutinue:
	add bx,2
	loop loop2
	mov cx,di
	loop loop1
	ret

main endp
;***********************
code ends
	end start