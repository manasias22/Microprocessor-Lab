AIM: write  APL for addition using macro

CODE:
DATA SEGMENT
    NO1 DW 1000H    ; First number
    NO2 DW 2000H    ; Second number
    RESULT DW ?     ; Result of the addition
DATA ENDS

; Define the code segment
CODE SEGMENT
START:
    MOV AX, @DATA   ; Initialize the data segment
    MOV DS, AX
    
    ADDITION_MACRO NO1, NO2, RESULT  ; Call the macro to perform the addition
    
    ; Display the result
    MOV AH, 09H
    MOV DX, OFFSET MSG
    INT 21H
    
    ; Display the result value
    MOV AH, 02H
    MOV DL, ' '
    INT 21H
    MOV AX, RESULT
    ADD AX, 30H
    MOV DL, AH
    INT 21H
    MOV DL, AL
    INT 21H
    
    ; Exit the program
    MOV AH, 4CH
    INT 21H
    
; Define the macro for addition
ADDITION_MACRO MACRO NO1, NO2, RESULT
    MOV AX, NO1     ; Move first number to AX
    MOV BX, NO2     ; Move second number to BX
    ADD AX, BX      ; Add BX to AX
    MOV RESULT, AX  ; Move sum to RESULT
ENDM

; Define the message to display the result
MSG DB 'The result of the addition is: $'

CODE ENDS
END START


OUTPUT:

The result of the addition is: 3000
