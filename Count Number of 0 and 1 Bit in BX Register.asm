; @author: Nilay Chandra Barman (https://github.com/Nilaycb)
; Copyright (c) 2019, All rights reserved.
; Copyrights licensed under the GNU AGPLv3 License.

.MODEL SMALL
.STACK 100H
.DATA
A DB "Number of 1s in BX: $"
D DB 10,13,"Number of 0s in BX: $"
.CODE

MAIN PROC
      AND BX,0
      MOV BL,11111011B           
      MOV BH,00001100B           
                
      MOV AX,@DATA
      MOV DS,AX          
                
      MOV CX,0             
      
      MOV AX,0              ; AL stores the number of 1 Bits in BX
      MOV DX,0              ; DH stores the number of 0 Bits in BX 
      
      GO:
        CMP CX,16           ; Checks 16 Bits
        JGE RESULT
        ROL BX,1
        INC CX
        JNC INCRE_DH        ; Checks CF (Flag) and Jumps if CF=0
        INC AL
        JMP GO
        
      INCRE_DH:
        INC DH
        JMP GO
      
      
      RESULT:
        MOV CL,AL             ; Changing the 1 bits count location from AL to CL  
        MOV CH,DH             ; Changing the 0 bits count location from DH to CH 
      
        ADD CL,30H
        ADD CH,30H
        
        MOV AH,9H
        MOV DX,OFFSET A
        INT 21H
      
        MOV AH,2
        MOV DL,CL
        INT 21H
      
        MOV AH,9H
        MOV DX,OFFSET D
        INT 21H
        
        MOV AH,2
        MOV DL,CH
        INT 21H

              
      MOV AH,4CH
      INT 21H
      MAIN ENDP
    
END MAIN


