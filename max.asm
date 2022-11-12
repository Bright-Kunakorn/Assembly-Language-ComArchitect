.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter 3 number: $'
    MSG2 DB 'The most number is $'
.code 
MAIN PROC
; initialize DS
	MOV	AX,@DATA
	MOV	DS,AX		
; display message1
	LEA	DX,MSG1		
	MOV	AH,9		
	INT	21H	

; input number 
    MOV AH,1  
    INT 21H    ;input first number
    MOV BL,AL

    INT 21H    ;input second number
    MOV BH,AL

    INT 21H    ;input third number
    MOV CL,AL

;carriage return
    MOV AH,2                    
    MOV DL,0DH
    INT 21H
    
;line feed
    MOV DL,0AH                 
    INT 21H

; display message2
	LEA	DX,MSG2		
	MOV	AH,9		
	INT	21H	

    CMP BL,BH ;Compare BL,BH
    JGE A     ;if yes,Jump Greater/Equal A

    B:
    CMP BH,CL ;Compare B,C
    JGE C     ;if yes,Jump Greater/Equal C
    MOV AH,2    ;if not,move cl to dl and print the most number
    MOV DL,CL
    INT 21H
    JMP EXIT    ;end program

    C:
    MOV AH,2    ;move bl to dl and print the most number 
    MOV DL,BH
    INT 21H
    JMP EXIT    ;end program

    A:
    CMP BL,CL   ;Compare BL,CL
    JGE D       ;if yes,Jump Greater/Equal D
    MOV AH,2    ;if not,move cl to dl and print the most number
    MOV DL,CL
    INT 21H
    JMP EXIT    ;end program

    D:
    MOV AH,2    
    MOV DL,BL   ;move bl to dl and print the most number
    INT 21H

    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN