print_new_line:
	push ax
	mov ah,0x0e
	mov al,0xa
	int 0x10
	mov al,0x0d
	int 0x10
	pop ax
	ret

printing_something_on_screen:
	push ax
	push si
	mov ah,0x0e
	start_print:
		mov al,[si]
		cmp al,0
		je end_print
		int 0x10
		add si,1
		jmp start_print
	end_print:
	pop si
	pop ax
	ret

set_cursor_pos:
	

set_cursor_shape:
	push ax
	mov ah,0x01
	int 0x10
	pop ax
	ret