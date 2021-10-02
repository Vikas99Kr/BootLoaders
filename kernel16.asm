[org 0x7e00]
[bits 16]
%include 'asmlib/video.asm'
%include 'asmlib/diskio.asm'

mov si,msg
call print_something_on_screen

msg:
	db "Kernel in 16 bit started",0xa,0xd,0x0
times 510-($-$$) db 0