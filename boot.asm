[org 0x7c00]							; SHIFT MEMORY BY INTERRUPT DEFINITIONS
mov ah, 0x0e							; TTY MODE


mov bx, inputmsg					; SET POINTER TO BOOTMSG
printinputmsg:							
	mov al, [bx]						; PUT DEREFERENCED VALUE OF BX INTO REGISTER
	cmp al, 0x00						; COMPARE VALUE AGAINST NULL
	je endprintinputmsg			; IF IT'S NULL, STOP PRINTING
	int 0x10								; INTERRUPT TO PRINT
	inc bx									; INCREMENT POINTER
	jmp printinputmsg				; LOOP BACK
endprintinputmsg:

mov ah, 0x00							; WAIT FOR KEY PRESS MODE
int 0x16									; BIOS INTERRUPT FOR WAITING FOR KEYPRESS
mov [input], al						; this puts ascii into al, scancode into ah

mov ah, 0x0e							
mov al, [input]
int 0x10

mov bx, hellomsg
mov al, 0x0A
int 0x10
mov al, 0x0D
int 0x10
printhellomsg:
	mov al, [bx]
	cmp al, 0x00
	je endprinthellomsg
	int 0x10
	inc bx
	jmp printhellomsg
endprinthellomsg:
mov al, [input]
int 0x10
mov al, '!'
int 0x10

mov bx, nicemsg
mov al, 0x0A
int 0x10
mov al, 0x0D
int 0x10
printnicemsg:
	mov al, [bx]
	cmp al, 0x00
	je endprintnicemsg
	int 0x10
	inc bx
	jmp printnicemsg
endprintnicemsg:

;-------------------------;
; DATA

bootmsg:
	db "BOOTING BIGOS...", 0x00

inputmsg:
	db "Which letter best represents you? ", 0x00

hellomsg:
	db "Hello, ", 0x00

nicemsg:
	db "Nice to meet you!", 0x00

input:
	db 0x00, 0x00

;--------------------------;
; BOOT END

jmp $
times 510-($-$$) db 0x00
db 0x55, 0xaa