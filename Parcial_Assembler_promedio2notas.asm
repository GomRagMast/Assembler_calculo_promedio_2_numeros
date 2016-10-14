
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
    mul mult
    mov nota1, al
    call leer
    call leer   
    sub al, 30h
    mov nota11, al
    mov al, nota1
    add al, nota11
    mov nota1, al
    
    ;salto de linea
    mov al, 0ah
    mov ah, 0eh
    int 10h
    mov al, 0Dh
    mov ah, 0eh    
    int 10h
    
    ;nota 1
    mov dx, offset msg2
    mov ah, 09h        
    int 21h            
    ;
    call leer  
    sub al, 30h  
    mul mult
    mov nota2, al
    call leer
    call leer   
    sub al, 30h
    mov nota21, al
    mov al, nota2
    add al, nota21
    mov nota2, al 
    
    call calculo  
    
    ;salto de linea
    mov al, 0ah
    mov ah, 0eh
    int 10h
    mov al, 0Dh
    mov ah, 0eh    
    int 10h
    
    mov dx, offset msg3
    mov ah, 09h        
    int 21h
    
    mov al, notaa
    cmp al, 1
    jl et2
    
et1:
    mov bl, 04h
    jmp fin
et2:
    mov bl, 09h
    jmp fin
fin:    
    mov dl, 17
    mov bh, 0           
    mov ah, 2           
    int 10h  
    
    mov al, notaa 
    mov cx, 1          
    add al, 30h
    mov ah, 09h
    int 10h      
     
    add dl, 1
    mov bh, 0           
    mov ah, 2           
    int 10h
    
    mov al, ','        
    mov cx, 1          
    mov ah, 09h
    int 10h  
    
    add dl, 1
    mov bh, 0           
    mov ah, 2           
    int 10h  
    
    mov al, notab
    mov cx, 1
    add al, 30h
    mov ah, 09h
    int 10h      
    
ret

calculo:
    mov al, nota1
    add al, nota2
    mov aux, al
    xor ax,ax
    mov al, divi
    mov bl, al
    mov al, aux
    div bl     
    mov notaa, al
    mov aux, ah  

    xor ax,ax
    mov al, mult
    mov bl, al
    mov al, divi
    div bl
    mov divi, al                                        

    xor ax,ax
    mov al, divi
    mov bl, al
    mov al, aux
    div bl
    mov notab, al 
                  

ret 

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
aux db 0
mult db 10                 
divi db 20

msg1 db "Ingrese la nota 1 (n,n): $"
msg2 db "Ingrese la nota 2 (n,n): $"
msg3 db "Su promedio es: $"