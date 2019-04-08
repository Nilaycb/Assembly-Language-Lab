; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.DATA
RSLT DB "RESULT: $"
HX DB " (HEX VALUE)$"
EXC DB "The count is more than 15.$"
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CL,0
    
    INPUT:
        MOV AH,1
        INT 21H
        INC CL
        CMP AL,0DH
        JE RESULT
        JMP INPUT
    
    RESULT:
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        MOV AH,9H
        MOV DX,OFFSET RSLT
        INT 21H
        
        SUB CL,1
        ADD CL,30H
        
        CMP CL,3AH
        JGE ADDMORE
        MOV AH,2
        MOV DL,CL
        INT 21H
        JMP EXIT
    
    ADDMORE:
        ADD CL,7
        
        CMP CL,47H               
        JGE EXCEED               ; EXCEEDS F (HEX VALUE)
        MOV AH,2
        MOV DL,CL
        INT 21H
        
        MOV AH,9H
        MOV DX,OFFSET HX
        INT 21H
        JMP EXIT
    
    EXCEED:
        MOV AH,9H
        MOV DX,OFFSET EXC
        INT 21H
        JMP EXIT
    
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP

END MAIN
