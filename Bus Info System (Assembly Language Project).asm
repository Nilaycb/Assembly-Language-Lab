.MODEL SMALL
.STACK 100H
.DATA
BUS_INFO_SYS DB "                   Bus Info Sysyem$"
CHOOSE_BUS DB 10,13,"Choose your desired Bus from following list: $"
NL DB 10,13,"$"
PRODUCTS_NAME DB 10,13,"Buses Name: $"
BAHON DB 10,13,09,"1. Bahon$"
ETL DB 10,13,09,"2. ETL$"
TURAG DB 10,13,09,"3. TURAG$"
BORDER DB 10,13,"..........................................$"
HOME_PRESS DB 10,13,"Press 1, 2 or 3$"
NOT_F_MSG DB 10,13,"Sorry!!! Enter correct number again.$"
B_RT DB 10,13,"Route: 36 [Khilgaon-Paltan-Shahbag-Dhanmondi-Mirpur]$"
B_ST DB 10,13,"Number of Seat: 70$"
B_TIME DB 10,13,"Time: 24*7$"
E_RT DB 10,13,"Route: 36 [Khilgaon-Paltan-Shahbag-Dhanmondi-Mirpur]$"
E_ST DB 10,13,"Number of Seat: 70$"
E_TIME DB 10,13,"Time: 24*7$"
T_RT DB 10,13,"Route: 36 [Khilgaon-Paltan-Shahbag-Dhanmondi-Mirpur]$"
T_ST DB 10,13,"Number of Seat: 70$"
T_TIME DB 10,13,"Time: 24*7$"
OPT1 DB 10,13,"Press 1 to know ticket price$"
OPT2 DB 10,13,"Press 2 for Home$"
OPT3 DB 10,13,"Press any key for exit.$"
TICKET_P DB 10,13,"Ticket Price: $"
OPT3_1 DB 10,13,"Press 1 for Home$"
RT1 DB 10,13,"Khilgaon to Shahbag: 20 Taka$"
RT2 DB 10,13,"Shahbag to Dhanmondi: 10 Taka$"
RT3 DB 10,13,"Khilgaon to Mirpur: 50 Taka$"
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
      
      
    HOME:  
        MOV AH,9H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET BUS_INFO_SYS
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET CHOOSE_BUS
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET PRODUCTS_NAME
        INT 21H
        MOV DX,OFFSET BAHON
        INT 21H
        MOV DX,OFFSET ETL
        INT 21H
        MOV DX,OFFSET TURAG
        INT 21H
        MOV DX,OFFSET BORDER
        INT 21H             
        MOV DX,OFFSET HOME_PRESS
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        CMP BL,'1'
        JE BAHON1
        CMP BL,'2'
        JE ETL1
        CMP BL,'3'
        JE TURAG1
        JMP NOT_FOUND
    
    BAHON1:
        MOV AH,9H
        MOV DX,OFFSET BAHON
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET B_RT
        INT 21H    
        MOV DX,OFFSET B_ST
        INT 21H           
        MOV DX,OFFSET B_TIME
        INT 21H
        MOV DX,OFFSET BORDER
        INT 21H
        MOV DX,OFFSET OPT1
        INT 21H
        MOV DX,OFFSET OPT2
        INT 21H
        MOV DX,OFFSET OPT3
        INT 21H 
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        CMP BL,'1'
        JE TICKET
        CMP BL,'2'
        JE HOME
        JMP EXIT
        
    ETL1:
        MOV AH,9H
        MOV DX,OFFSET ETL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET E_RT
        INT 21H    
        MOV DX,OFFSET E_ST
        INT 21H           
        MOV DX,OFFSET E_TIME
        INT 21H
        MOV DX,OFFSET BORDER
        INT 21H
        MOV DX,OFFSET OPT1
        INT 21H
        MOV DX,OFFSET OPT2
        INT 21H
        MOV DX,OFFSET OPT3
        INT 21H 
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        CMP BL,'1'
        JE TICKET
        CMP BL,'2'
        JE HOME
        JMP EXIT
        
    TURAG1:
        MOV AH,9H
        MOV DX,OFFSET TURAG
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET T_RT
        INT 21H    
        MOV DX,OFFSET T_ST
        INT 21H           
        MOV DX,OFFSET T_TIME
        INT 21H
        MOV DX,OFFSET BORDER
        INT 21H
        MOV DX,OFFSET OPT1
        INT 21H
        MOV DX,OFFSET OPT2
        INT 21H
        MOV DX,OFFSET OPT3
        INT 21H 
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        CMP BL,'1'
        JE TICKET
        CMP BL,'2'
        JE HOME
        JMP EXIT
        
    TICKET:
        MOV AH,9H
        MOV DX,OFFSET TICKET_P
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET RT1
        INT 21H
        MOV DX,OFFSET RT2
        INT 21H
        MOV DX,OFFSET RT3
        INT 21H
        MOV DX,OFFSET BORDER
        INT 21H
        MOV DX,OFFSET OPT3_1
        INT 21H
        MOV DX,OFFSET OPT3
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        CMP BL,'1'
        JE HOME
        JMP EXIT
    
    NOT_FOUND:
        MOV AH,9H
        MOV DX,OFFSET NOT_F_MSG
        INT 21H
        MOV DX,OFFSET NL
        INT 21H
        
        JMP HOME
        
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP

END MAIN    
