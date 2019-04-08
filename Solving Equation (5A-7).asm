; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.DATA
EQA DB "EQUATION A=5*A-7$"
NOTE DB "TO DISPLAY PROPERLY, THE FINAL RESULT MUST HAVE TO BE WITHIN 0 TO 9$"
MSG DB "ENTER THE VALUE OF A: $"
RSLT DB "RESULT: $"
.CODE

MAIN PROC
    
    ; EQUATION A=5*A-7
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
    MOV DX,OFFSET MSG
    INT 21H
    
    MOV AH,1 
    INT 21H
          
    MOV BL,5      
    MUL BL
    SUB AX,7
    PUSH AX
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9H
    MOV DX,OFFSET RSLT
    INT 21H
    
    POP AX
    MOV DX,AX
    SUB DX,192      ; This value must have to be adjusted every time according to the equation
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN
