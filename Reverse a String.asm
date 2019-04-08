; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.DATA
MSG DB "Enter a string: $"
RSLT DB "Output in Reverse: $"
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9H
    MOV DX,OFFSET MSG
    INT 21H
    
    MOV CX,0
    
    INPUT:
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        CMP BL,0DH              ; CHECK CRET
        JE OUTPUT
        PUSH BX
        INC CX
        JMP INPUT
        
    OUTPUT: 
        MOV AH,2H
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        MOV AH,9H
        MOV DX,OFFSET RSLT
        INT 21H
        
    CHECK_COUNTER:
        CMP CX,0
        JG DISPLAY
        JMP EXIT
        
    DISPLAY:
        MOV AH,2
        POP DX
        INT 21H
        DEC CX
        JMP CHECK_COUNTER
        
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP

END MAIN 
