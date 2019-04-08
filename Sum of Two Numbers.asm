; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.DATA
A DB "Enter 1st Number: $"
B DB "Enter 2nd Number: $"
C DB "The Sum is : $"
.CODE

MAIN PROC
    
    ; The sum must have to be within 0 to 9
    
    MOV AX,@DATA
    MOV DS,AX       
    
    MOV AH,9H
    MOV DX,OFFSET A       ;PRINT  A
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H       
    
    MOV AH,9H
    MOV DX,OFFSET B       ;PRINT B
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ADD BL,CL
    SUB BL,48
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H       
    
    MOV AH,9H
    MOV DX,OFFSET C       ;PRINT C
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN
