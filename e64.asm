;书本211，列6.4
;主程序与子程序不在同一模块
; main module
extrn proadd:far
;********************88
data segment common
	ary dw 100 dup(5)
	count dw 100
	sum dw ?
data ends
;**************88
code1 segment
main proc far
	assume cs:code1, ds:data
start:
	mov ax, data
	mov ds,ax
;.............
	call far ptr proadd
	mov ax, 4c00h
	int 21h
main endp
;-----------------------------
code1 ends
	end start