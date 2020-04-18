
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

.DATA
    G DB 'greater$'
    L DB 'lesser$'
       
.CODE
MAIN PROC
    
MOV CH, 0A5h ; load demo data into AL
MOV CL, 4h
SHR CH, CL  ; push the Lower nibble out

        
CMP CH,9H
    
JG GREAT; the number is greater than 9
    
MOV AX, @DATA
MOV DS, AX
MOV AH, 9
LEA DX,L
INT 21h
JMP QUIT
    
GREAT:
MOV AX, @DATA
MOV DS, AX
        
MOV AH, 9
LEA DX, G
INT 21h

QUIT:    
END

ret




