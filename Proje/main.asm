[bits 16]
[org 0x7c00]

 start:
  mov ah, 0x0E  ; ekrana basma
  mov al, '.'   ; ascii karakteri
  int 0x10      ; I/O kesmesi

 reset:
  mov ah, 0x00   ; reset
  mov dl, 0x00   ; drive
  int 0x13       ; disk kesmesi
  jc reset

 oku:
  mov ax, 8000h ; segment
  mov es, ax
  xor bx, bx    ; offset

  mov ah, 0x02     ; disk okuması
  mov al, 0x02     ; okunacak sector sayisi
  mov ch, 0x00     ; silindir
  mov cl, 0x03     ; sector
  mov dh, 0x00     ; head
  mov dl, 0x00     ; drive
  int 0x13  	   ; disk kesmesi
  jc oku
  
  jmp 8000:0000 

;--------------------------------------------

dw 8000h
dw 0000h
 times 510 - ($ - $$) db 0x00
 dw 0xAA55
