[org 0x7c00]
[bits 16]
xor ax,ax
mov ds,ax
mov es,ax
mov bp,es
mov sp,bp
cld
jmp boot

%include 'asmlib/video.asm'
%include 'asmlib/diskio.asm'

video_service_test:
	push ax
	push si
	push cx
	mov ah,0x00
	mov al,0x03
	int 0x10
	mov si,msg
	call printing_something_on_screen
	mov si,msg2
	call printing_something_on_screen
	mov cx,0x0001
	call set_cursor_shape
	pop cx
	pop si
	pop ax
	ret

boot:
	cli
	call video_service_test
	mov si,go_into_disk
	call write_in_disk
	mov si,empty
	call read_from_disk
	call printing_something_on_screen
	call printing_something_on_screen
	hlt
	
msg:
	db "-----------------------Welcome to Fibre-Boot-Manager----------------------------",0xa,0xd,0x0
msg2:
	db "Intializing Disk!....",0xa,0xd,0x0
go_into_disk:
	db "Aesop",0x0a,0x0d,0x0
empty:
	times 100 db 0

times 510-($-$$) db 0
dw 0xaa55