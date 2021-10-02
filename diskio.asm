write_in_disk:
	push si
	push dx
	push es
	push ax
	mov bx,si
	mov dl,0
	xor ax,ax
	mov es,ax
	mov ah,3
	mov al,1
	mov ch,0
	mov cl,2
	mov dh,0
	int 0x13
	pop ax
	pop es
	pop dx
	pop si
	ret

read_from_disk:
	push si
	push dx
	push ax
	xor ax,ax
	mov es,ax
	mov ah,2
	mov al,1
	mov ch,0
	mov cl,2
	mov dh,0
	mov bx,si
	int 0x13
	pop ax
	pop dx
	pop si
	ret