; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.DATA
EQA DB "EQUATION 3A-B+2C$"
NOTE DB "TO DISPLAY PROPERLY, THE FINAL RESULT MUST HAVE TO BE WITHIN 0 TO 9$"
MSG_A DB "ENTER THE VALUE OF A: $"
MSG_B DB 10,13,"ENTER THE VALUE OF B: $"
MSG_C DB 10,13,"ENTER THE VALUE OF C: $"
RSLT DB 10,13,"RESULT: $"
A DW ?
B DW ?
C DW ? 
.CODE

MAIN PROC
    
    ; EQUATION 3A-B+2C
    ; TO DISPLAY PROPERLY, THE FINAL RESULT MUST HAVE TO BE WITHIN 0 TO 9
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9H
    MOV DX,OFFSET EQA
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9H
    MOV DX,OFFSET NOTE
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9H
    MOV DX,OFFSET MSG_A
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV AH,00
    MOV A,AX
    
    MOV AH,9H
    MOV DX,OFFSET MSG_B
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV AH,00
    MOV B,AX
    
    MOV AH,9H
    MOV DX,OFFSET MSG_C
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV AH,00
    MOV C,AX
    
    MOV AX,3
    IMUL A
    SUB AX,B
    MOV A,AX
    
    MOV AX,2
    IMUL C
    ADD A,AX
    SUB A,90H
    
    MOV AH,9H
    MOV DX,OFFSET RSLT
    INT 21H
    
    MOV AH,2
    MOV DX,A
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    
END MAIN


