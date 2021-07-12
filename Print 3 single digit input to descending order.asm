; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License. 

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "Enter the first number: $"   
MSG2 DB "Enter the second number: $"
MSG3 DB "Enter the third number: $"
RSLT1 DB "The 1st output is: $"
RSLT2 DB "The 2nd output is: $"
RSLT3 DB "The 3rd output is: $"
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    MOV DX,OFFSET MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
           
    MOV AH,9
    MOV DX,OFFSET MSG2
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
   
    MOV AH,9
    MOV DX,OFFSET MSG3 
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    
    
    
    CMP BL,CH
    JGE CHECK1
    JMP CHECK2
   
   
   
   
    CHECK1:
    CMP CL,CH
    JLE OUT1
    JMP CHECK3
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
    
    
    OUT1:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT1
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT2
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT3
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H 
    
    JMP EXIT
    
    
    
    
    CHECK3:
    CMP CL,BL
    JG OUT2
    JMP OUT3
    
    
    
    
    OUT2:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT1
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT2
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT3
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    JMP EXIT
    
    
    
    
    OUT3:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT1
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT2
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT3
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    JMP EXIT
    
    
    
    
    CHECK2:
    CMP BL,CH
    JL CHECK4
    JMP EXIT
    
    
    
    
    CHECK4:
    CMP CL,BL
    JLE OUT4
    JMP CHECK5
    
    
    
    
    OUT4:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT1
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT2
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT3
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    JMP EXIT
    
    
    
    
    CHECK5:
    CMP CL,CH
    JG OUT5
    JMP OUT6
    
    
    
    
    OUT5:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT1
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT2
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT3
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    JMP EXIT
    
    
    
    
    OUT6:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT1
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT2
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET RSLT3
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    JMP EXIT
    
    
 
 
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN






;LOGIC
;
;A = BL
;B = CH
;C = CL
;
;
;A >= B:
;	C <= B CHECK1
;	== A B C (OUT1)
;
;	C > A CHECK3
;	== C A B (OUT2)
;
;	== A C B (OUT3)
;
;CHECK2
;A < B:
;	C <= A CHECK4
;	== B A C (OUT4)
;
;	C > B CHECK5
;	== C B A (OUT5)
;
;	== B C A (OUT6)
