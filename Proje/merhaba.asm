 [org 0x8000]
 [bits 16]

 main:
  mov ah, 0x0E  ; print function
  mov al, '.'   ; ascii char
  int 0x10   ; IO int

  jmp $
