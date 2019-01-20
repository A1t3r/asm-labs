

org 100h
           
pic db "[___________________################]", 0dh,0ah
    db "]____________________######___######_#]", 0dh,0ah
	db "]__________________#_#####_##############]", 0dh,0ah
	db "]__________________#_##############__#_####]$", 0dh,0ah, 0ah

                
mov dx,offset pic  ;display pic
mov ah,09h
int 21h 
mov ch, 00h
mov cl, 00h
 
comparing:      ;fuction of comparing

mov ah,07h
int 21h 

cmp al,77h
je up
 
cmp al,73h
je down 

cmp al,61h
je left
 
cmp al,64h
je right

jmp wrong ;exception operator   

up:          ; up moving
mov ah, 00h
MOV al,03h 
int 10h
dec ch 
mov dh, ch      ;save position
mov dl, cl
mov ah, 2
int 10h
mov dx,offset pic
mov ah,09h
int 21h
jmp comparing 

down:        ; down moving
mov ah, 00h
MOV al,03h
int 10h
inc ch 
mov dh, ch    ;save position
mov dl, cl
mov ah, 2
int 10h
mov dx,offset pic
mov ah,09h
int 21h
jmp comparing

left:            ;left moving
mov ah, 00h
MOV al,03h 
int 10h         
dec cl 
mov dl, cl
mov dh, ch     ;save position
mov ah, 2
int 10h
mov dx,offset pic
mov ah,09h
int 21h
jmp comparing
 
right:         ;right moving      
mov ah, 00h
MOV al,03h 
int 10h
inc cl  
mov dh, ch    ;save position
mov dl, cl
mov ah, 2
int 10h
mov dx,offset pic
mov ah,09h
int 21h
jmp comparing
 
wrong:

jmp  comparing

END


ret




