.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER THREE INITIALS $'
.CODE
MAIN PROC
; initialize DS
	MOV	AX,@DATA
	MOV	DS,AX	
; display message1
	LEA	DX,MSG1		
	MOV	AH,9		
	INT	21H	
; input name
    MOV AH,1  
    INT 21H    
    MOV BL,AL	

    INT 21H    
    MOV BH,AL

    INT 21H    
    MOV CL,AL

;carriage return
    MOV AH,2                    
    MOV DL,0DH
    INT 21H
    
;line feed
    MOV DL,0AH                 
    INT 21H

;1
    MOV AH,2    
    MOV DL,BL
    INT 21H   

;carriage return
    MOV AH,2                    
    MOV DL,0DH
    INT 21H
    
;line feed
    MOV DL,0AH                 
    INT 21H 

;2
    MOV AH,2    
    MOV DL,BH
    INT 21H   

;carriage return
    MOV AH,2                    
    MOV DL,0DH
    INT 21H
    
;line feed
    MOV DL,0AH                 
    INT 21H 

;3
    MOV AH,2    
    MOV DL,CL
    INT 21H   

;carriage return
    MOV AH,2                    
    MOV DL,0DH
    INT 21H
    
;line feed
    MOV DL,0AH                 
    INT 21H 
    
MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
