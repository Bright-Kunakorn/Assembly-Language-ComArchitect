.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB '?$'
.CODE
MAIN PROC
; initialize DS
	MOV	AX,@DATA
	MOV	DS,AX		
; display message1
	LEA	DX,MSG1		
	MOV	AH,9		
	INT	21H

;input
MOV AH,1  
INT 21H    
MOV BL,AL

INT 21H    
MOV BH,AL

;carriage return
    MOV AH,2                    
    MOV DL,0DH
    INT 21H
    
;line feed
    MOV DL,0AH                 
    INT 21H

;print
    MOV AH,2    
    MOV DL,BH   
    INT 21H

    MOV AH,2    
    MOV DL,BL   
    INT 21H
    

; DOS exit	
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN