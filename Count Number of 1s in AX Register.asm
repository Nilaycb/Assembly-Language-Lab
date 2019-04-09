; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
        
    AND AX,00
    MOV AX,1101D            ; Change this value to check the output
           
    AND CX,0       
    MOV CL,0
    
    AND BX,0
    MOV BL,10D
    
    DIVIDE:
        DIV BX
            
        CMP DX,01D
        JE INCRE
        JMP CHECK
    
    INCRE:
        INC CL
        JMP CHECK
        
    CHECK:
        AND DX,0
        CMP AX,00D
        JG DIVIDE
        JMP EXIT
    
        
    EXIT:
        ADD CL,30H
        
        MOV AH,2
        MOV DL,CL
        INT 21H
    
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    
END MAIN