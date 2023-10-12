mov ah, 0x0E ; teletype mode

mov al, 'B'
int 0x10
mov al, 'o'
int 0x10
mov al, 'o'
int 0x10
mov al, 't'
int 0x10
mov al, 'i'
int 0x10
mov al, 'n'
int 0x10
mov al, 'g'
int 0x10
mov al, ' '
int 0x10
mov al, 'b'
int 0x10
mov al, 'i'
int 0x10
mov al, 'g'
int 0x10
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10
mov al, '.'
int 0x10
mov al, '.'
int 0x10
mov al, '.'
int 0x10
mov al, 0x0A  ; LF (newline)
int 0x10
mov al, 0x0D  ; CR (needed to reset text back to left edge of the screen)
int 0x10

mov al, 0x60 ; ascii 
loop:
    inc al
    xor al, 32
    int 0x10
    cmp al, 0x7A
    jne loop

jmp $
times 510-($-$$) db 0
db 0x55, 0xAA