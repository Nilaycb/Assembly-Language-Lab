; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.DATA
MENU DB "--------MENU----------$"
MENUEND DB 10,13,"----------------------$"
MENU1 DB 10,13,"1. Apple$"
MENU2 DB 10,13,"2. Banana$"
MENU3 DB 10,13,"3. Cherry$"
MENU4 DB 10,13,"4. Dates$"
MENU5 DB 10,13,"5. Egg$"
MENU6 DB 10,13,"6. EXIT$"
MSG DB 10,13,"Choose a number from the options to see more details: $" 
NL DB 10,13,"$"                        
DETAILS DB "--------DETAILS----------$"
DETAILSEND DB 10,13,"-------------------------$"
DETAILS1 DB 10,13,"Apple is a fruit.$"
DETAILS2 DB 10,13,"Banana is a fruit.$"
DETAILS3 DB 10,13,"Cherry is a fruit.$"
DETAILS4 DB 10,13,"Dates is a fruit.$"
DETAILS5 DB 10,13,"Egg is food.$"
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    MOV DX,OFFSET MENU
    INT 21H
    MOV DX,OFFSET MENU1
    INT 21H
    MOV DX,OFFSET MENU2
    INT 21H
    MOV DX,OFFSET MENU3
    INT 21H
    MOV DX,OFFSET MENU4
    INT 21H
    MOV DX,OFFSET MENU5
    INT 21H
    MOV DX,OFFSET MENU6
    INT 21H
    MOV DX,OFFSET MENUEND
    INT 21H
    
    INPUT:
        MOV AH,9H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET MSG
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        
        MOV AH,1
        INT 21H
        
        CMP AL,'1'
        JE M1
        CMP AL,'2'
        JE M2
        CMP AL,'3'
        JE M3
        CMP AL,'4'
        JE M4
        CMP AL,'5'
        JE M5
        CMP AL,'6'
        JE EXIT
        JMP INPUT
    
    M1:
        MOV AH,9H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET DETAILS
        INT 21H
        MOV DX,OFFSET DETAILS1
        INT 21H        
        MOV DX,OFFSET DETAILSEND
        INT 21H
        JMP EXIT
    
    M2:
        MOV AH,9H
        MOV DX,OFFSET NL
        INT 21H 
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET DETAILS
        INT 21H
        MOV DX,OFFSET DETAILS2
        INT 21H        
        MOV DX,OFFSET DETAILSEND
        INT 21H
        JMP EXIT
    
    M3:
        MOV AH,9H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET DETAILS
        INT 21H
        MOV DX,OFFSET DETAILS3
        INT 21H        
        MOV DX,OFFSET DETAILSEND
        INT 21H
        JMP EXIT
    
    M4:
        MOV AH,9H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET DETAILS
        INT 21H
        MOV DX,OFFSET DETAILS4
        INT 21H        
        MOV DX,OFFSET DETAILSEND
        INT 21H
        JMP EXIT
    
    M5:
        MOV AH,9H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET DETAILS
        INT 21H
        MOV DX,OFFSET DETAILS5
        INT 21H        
        MOV DX,OFFSET DETAILSEND
        INT 21H
        JMP EXIT
    
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP

END MAIN