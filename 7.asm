
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

NOP

MOV AX, 0000h
MOV DS, AX   
MOV BX, 0000h      
MOV BYTE PTR [BX], 3h
    
MOV AX, 0F000h
MOV DS, AX
MOV BX, 0FFFFh
MOV BYTE PTR [BX], 4h ;In this section we are Storing Data for Test 
    


MOV AX,0000H
MOV DS, AX                  ; Storing First Memory Location Segment Part In DS 
MOV BX, 0000H               ; Storing First Memory Location OFFSET Part In BX 
MOV AL, BYTE PTR DS:[BX]    ; Taking the Value From First MEmory Location Into AL 
MOV CL, AL                  ; Storing the Value from al to cl for previnting data loss 

MOV AX, 0F000H
MOV DS, AX                  ; Storing LAST Memory Location Segment Part In DS 
MOV BX, 0FFFFH              ; Storing LAST Memory Location OFFSET Part In BX 
MOV AH, BYTE PTR DS:[BX]    ; Taking the Value From First MEmory Location Into AH 
MOV CH, AH                  ; Storing the Value from ah to ch for previnting data loss 

SUB CH, CL                  ; adding ah and ch and storing the reasult in cl
JS NEGATIVE                    ; If the reasult is not positive then jump Quit Lebel

MOV AL,CH   
MOV DX,0FFFFH
OUT DX,AL                  ; Storing LAST even Memory Location Segment Part In DS 
JMP QUIT   

NEGATIVE: 
    MOV AL ,CH
    OUT 00H ,AL
    

QUIT:
END

ret
