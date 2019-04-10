; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License. 

.MODEL SMALL
.STACK 100H
.DATA
MSG DB "Enter a number between 4 to 7: $"
ODD DB 10,13,"Odd.$" 
EVE DB 10,13,"Even.$"
AGA DB 10,13,"Enter again: $"
.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9H
    MOV DX,OFFSET MSG
    INT 21H

    INPUT:    
        MOV AH,1H
        INT 21H
        MOV BL,AL
        
        CMP BL,'5'
        JE O_OUT
        CMP BL,'7'
        JE O_OUT
        CMP BL,'4'
        JE E_OUT
        CMP BL,'6'
        JE E_OUT
        
        MOV AH,9H
        MOV DX,OFFSET AGA
        INT 21H
        
        JMP INPUT
        
    O_OUT:
        MOV AH,9H
        MOV DX,OFFSET ODD
        INT 21H
        JMP EXIT
        
    E_OUT:
        MOV AH,9H
        MOV DX,OFFSET EVE
        INT 21H
        JMP EXIT
        
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP

END MAIN