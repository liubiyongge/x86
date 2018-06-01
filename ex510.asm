data segment
datatable  dw routine_1
		   dw routine_2
		   dw routine_3
		   dw routine_4
		   dw routine_5
		   dw routine_6
		   dw routine_7
		   dw routine_8
result dw ?
data ends
;********************88
code segment
main proc far
	assume cs:code, ds:data
start:
	mov  ax, data
	mov ds, ax
;mian proc start here
;set al = 1
	mov al,  1
	cmp al, 0
	je coutinue_main_line
	mov si,0
l:
	shr al, 1
	jnb not_yet
	jmp datatable[si]
not_yet:
	add  si, type datatable
	jmp l
coutinue_main_line:
	mov result, 1110h
	jmp exit
routine_1:
	mov result, 1111h
	jmp exit
routine_2:
routine_3:
routine_4:
routine_5:
routine_6:
routine_7:
routine_8:
exit:
	mov ah, 4ch
	int 21h
	ret
main endp
code ends
	end start

