.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC

    MOV BL,80H
    MOV CL,0
    LOOP1:
        CMP CL,10
        JE LOOP2
     
        INC CL
     
        MOV AH,2
        MOV DL,BL
        INT 21H
        INC BL
     
        CMP BL,0FFH
        JE END_
     
        JMP LOOP1
    LOOP2:
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        MOV CL,0
        JMP LOOP1
    END_:
 
    MOV AH,4CH
    INT 21H
         
    MAIN ENDP
END MAIN