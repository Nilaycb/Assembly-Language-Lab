; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License. 

.MODEL SMALL
.STACK 100H
.DATA
MSG DB "Enter a character: $"
DIG DB 10,13,"The input is a Digit.$" 
CAP DB 10,13,"The input is a Capital Letter.$"
OTH DB 10,13,"The input is OTHER.$"
.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9H
    MOV DX,OFFSET MSG
    INT 21H
    
    MOV AH,1H
    INT 21H
    MOV BL,AL
    
    CMP BL,'0'
    JGE D_CAP_CHECK
    JMP O_OUT
    
    D_CAP_CHECK:
        CMP BL,'9'
        JLE D_OUT
        CMP BL,'A'
        JGE CAP_CHECK
        JMP O_OUT
        
    D_OUT:
        MOV AH,9H
        MOV DX,OFFSET DIG
        INT 21H
        JMP EXIT
        
    CAP_CHECK:
        CMP BL,'Z'
        JLE CAP_OUT
        JMP O_OUT
        
    CAP_OUT:
        MOV AH,9H
        MOV DX,OFFSET CAP
        INT 21H
        JMP EXIT
        
    O_OUT:
        MOV AH,9H
        MOV DX,OFFSET OTH
        INT 21H
        JMP EXIT
        
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP

END MAIN