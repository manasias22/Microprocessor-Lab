 .model small
 .data
a dw 6789H
b dw 1232H
c dw ?
car db ?
.code
mov ax,@data
mov ds,ax
mov ax,a
mov bx,b
add al,bl
daa
mov cl,al
mov al,ah
adc al,bh
daa
mov ch,al
mov c,cx
mov al,00H
adc al,al
mov car,al
mov ah,4CH
int 21H
end
