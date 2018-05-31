data segment
	string db "In 1990, the exchange rate was 8.1 /$"
	num db ?
	char db ?
	other db ?
data ends
code segment
	assume cs:code, ds:data
main proc far
start:
	push ds
	sub ax, ax
	push ax
;***************************88
	mov ax, data
	mov ds, ax
;***************************
	mov si, 0
	lea ax, string
	lea cx, num
	sub cx, ax
lop:
	cmp string[si], 30h
	jl others
	cmp string[si], 40h
	jl nums
	cmp string[si], 41h
	jl others
	cmp string[si], 5Bh
	jl chars
	cmp string[si], 61h
	jl others
	cmp string[si], 7Bh
	jl chars
others:
	inc other
	jmp all
nums:
	inc num
	jmp all
chars:
	inc char
all:
	inc si
	loop lop
	ret
main endp
code ends
	end start


