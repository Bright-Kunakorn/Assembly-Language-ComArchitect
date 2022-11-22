TITLE	PRINT STRING PROGRAM
.MODEL	SMALL
.STACK	100H
.DATA
STRING_1 DB 'Enter 3 number :$'
STRING_2 DB 'Most number is $' 

.CODE
MAIN	PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, STRING_1             ; load & display the STRING_1  
     MOV AH, 9            
     INT 21H

     MOV AH, 2                    ; carriage return
     MOV DL, 0DH
     INT 21H
 
     MOV DL, 0AH                  ; line feed
     INT 21H

     LEA DX, STRING_2             ; load & display the STRING_2  
     MOV AH, 9
     INT 21H



; return to DOS
	MOV	AH, 4CH
	INT	21H		; DOS exit
MAIN	ENDP
	END MAIN