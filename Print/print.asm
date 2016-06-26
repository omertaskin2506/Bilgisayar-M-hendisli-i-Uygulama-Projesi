[ORG 0x7C00]

xor ax, ax
mov ds, ax

mov si, mesaj
call main

dongu:
	jmp dongu

main:
	lodsb
	or al, al
	jz bitir
	mov ah, 0Eh
	int 10h
	jmp main

bitir:
	ret

mesaj db 'Hello World', 13, 10, 0
   times 510-($-$$) db 0
   db 0x55
   db 0xAA

