; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.DATA
MSG DB "Enter a lowercase letter: $"
RSLT DB "The uppercase letter is: $"
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    MOV DX,OFFSET MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    SUB BL,20H
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN