
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

NOP
    
MOV AL, 13H

AND AL, 0AAh  ; change the ODDLY indexed bits of AL

END

ret




