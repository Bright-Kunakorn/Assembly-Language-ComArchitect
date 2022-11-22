.MODEL	SMALL
.STACK	100H
.DATA
STRING_1 DB 'Enter your number:$'
STRING_2 DB 'guess?$'
STRING_3 DB 'correct $'
STRING_4 DB 'more than $' 
STRING_5 DB 'less than $' 

.CODE
MAIN	PROC
    MOV AX,@DATA                ;initialize DS
    MOV DS,AX

    LEA DX,STRING_1             ; 'Enter your number:' 
    MOV AH,9            
    INT 21H

    MOV AH,1                    ;input number
    INT 21H
    MOV BL,AL
    
    MOV AH,2                    ;carriage return
    MOV DL,0DH
    INT 21H
    MOV DL,0AH                  ;line feed
    INT 21H

    LEA DX,STRING_2             ; 'guess?'
    MOV AH,9
    INT 21H
    MOV AH,2                    ;carriage return
    MOV DL,0DH
    INT 21H
    MOV DL,0AH                  ;line feed
    INT 21H

    MOV AH,1                    ;input guess number
    INT 21H
    MOV BH,AL

    CMP BL,BH ;Compare BL,BH
    JL b                        ;more than
    JE c

    a:
    MOV AH,2                    ;carriage return
    MOV DL,0DH
    INT 21H
    MOV DL,0AH                  ;line feed
    INT 21H

    LEA DX,STRING_5             ;load & display 'less than ' 
    MOV AH,9
    INT 21H
    MOV AH,2                    ;carriage return
    MOV DL,0DH
    INT 21H
    MOV DL,0AH                  ;line feed
    INT 21H
    MOV AH,1                    ;input new guess number
    INT 21H
    MOV BH,AL

    CMP BL,BH ;Compare BL,BH
    JG a                        ;less than
    JE c

    b:
    MOV AH,2                    ;carriage return
    MOV DL,0DH
    INT 21H
    MOV DL,0AH                  ;line feed
    INT 21H
    LEA DX,STRING_4             ;load & display 'more than'
    MOV AH,9
    INT 21H
    MOV AH,2                    ;carriage return
    MOV DL,0DH
    INT 21H
    MOV DL,0AH                  ;line feed
    INT 21H
    MOV AH,1                    ;input guess number
    INT 21H
    MOV BH,AL


    CMP BL,BH ;Compare BL,BH
    JG a                        ;less than
    JL b                        ;more than

    c:
    MOV AH,2                    ;carriage return
    MOV DL,0DH
    INT 21H
    MOV DL,0AH                  ;line feed
    INT 21H
    LEA DX,STRING_3             ;''correct''
    MOV AH,9
    INT 21H



; return to DOS
	MOV	AH,4CH
	INT	21H		; DOS exit
MAIN	ENDP
	END MAIN