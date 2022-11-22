.MODEL	SMALL
.STACK	100H
.DATA
MSG1	DB	'Enter your ages: $'
MSG2    DB  'birth year is $'
.CODE
MAIN	PROC
; initialize DS
	MOV	AX, @DATA
	MOV	DS, AX		
; display message
	LEA	DX, MSG1		
	MOV	AH, 9		
	INT	21H	

;input number
    MOV AH,1
    INT 21H
    MOV BL,AL

    INT 21H
    MOV CL,AL 

    SUB BL,CL
    ADD BL,48

; display message
	LEA	DX, MSG2		
	MOV	AH, 9		
	INT	21H	

    MOV AH,2
    MOV DL,BL
    INT 21H


; return to DOS
	MOV	AH, 4CH
	INT	21H	

MAIN	ENDP
	END MAIN