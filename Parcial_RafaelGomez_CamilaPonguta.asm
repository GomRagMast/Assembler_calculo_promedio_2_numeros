
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

inicio:  
    ;nota 1
    mov dx, offset msg1
    mov ah, 09h        
    int 21h            
    ;
    call leer  
    sub al, 30h 
    mov nota1, al
    call leer
    call leer   
    sub al, 30h
    mov nota11, al
    
    ;salto de linea
    mov al, 0ah
    mov ah, 0eh
    int 10h
    mov al, 0Dh
    mov ah, 0eh    
    int 10h
    
    ;nota 2 
    mov dx, offset msg1
    mov ah, 09h        
    int 21h
    ;
    call leer 
    sub al, 30h  
    mov nota2, al
    call leer
    call leer  
    sub al, 30h
    mov nota21, al 
    
    ;call calculo
ret

calculo:
    

;    multiplicacion: 
;        mov ax,aux 
;        mul 10
;        mov resu1, ax
;        mov resu2, dx
;    ret

leer:
    mov ah,0
    int 16h
    mov ah, 0eh
    int 10h       
ret

nota1 db 0
nota11 db 0
notaA db 0
nota2 db 0
nota21 db 0
notaB db 0 
aux dw 0

msg1 db "Ingrese la nota 1 (n,n): $"
msg2 db "Ingrese la nota 2 (n,n): $"
msg3 db "Su promedio es: $"