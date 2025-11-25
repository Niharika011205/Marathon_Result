include 'emu8086.inc'

JMP START

DATA SEGMENT
    N        DB ?
    NUM      DB 25 DUP(?)
    TIME     DB 25 DUP(?)

    MSG0 DB 'Enter number of players (max 25): ',0
    MSG1 DB 0DH,0AH,'Enter player numbers:',0
    MSG2 DB 0DH,0AH,'Enter time of players:',0
    MSG3 DB 0DH,0AH,'After sorting (Player  Time):',0DH,0AH,0
    MSG4 DB 0DH,0AH,'Top 3 Winners:',0DH,0AH,0
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX

    DEFINE_SCAN_NUM
    DEFINE_PRINT_STRING
    DEFINE_PRINT_NUM_UNS

; ===== READ NUMBER OF PLAYERS =====
    LEA SI, MSG0
    CALL PRINT_STRING
    CALL SCAN_NUM
    MOV N, CL

    MOV BL, N
    XOR BH, BH

; ===== INPUT PLAYER NUMBERS =====
    LEA SI, MSG1
    CALL PRINT_STRING
    MOV SI, 0

READ_NUM:
    CALL SCAN_NUM
    MOV NUM[SI], CL
    PRINT 0DH
    PRINT 0AH
    INC SI
    CMP SI, BX
    JL READ_NUM

; ===== INPUT PLAYER TIMES =====
    LEA SI, MSG2
    CALL PRINT_STRING
    MOV SI, 0

READ_TIME:
    CALL SCAN_NUM
    MOV TIME[SI], CL
    PRINT 0DH
    PRINT 0AH
    INC SI
    CMP SI, BX
    JL READ_TIME

; ===== BUBBLE SORT BY TIME (ASCENDING) =====
    MOV CX, BX
    DEC CX

OUTER:
    MOV SI, 0

INNER:
    MOV AL, TIME[SI]
    MOV AH, TIME[SI+1]
    MOV DL, NUM[SI]
    MOV DH, NUM[SI+1]

    CMP AL, AH
    JBE NO_SWAP

    MOV TIME[SI], AH
    MOV TIME[SI+1], AL
    MOV NUM[SI], DH
    MOV NUM[SI+1], DL

NO_SWAP:
    INC SI
    CMP SI, CX
    JL INNER
    LOOP OUTER

; ===== DISPLAY SORTED LIST =====
    LEA SI, MSG3
    CALL PRINT_STRING
    MOV SI, 0

SHOW_ALL:
    MOV AL, NUM[SI]
    MOV AH, 0
    CALL PRINT_NUM_UNS
    PRINT 09H

    MOV AL, TIME[SI]
    MOV AH, 0
    CALL PRINT_NUM_UNS
    PRINT 0DH
    PRINT 0AH

    INC SI
    CMP SI, BX
    JL SHOW_ALL

; ===== DISPLAY TOP 3 WINNERS =====
    LEA SI, MSG4
    CALL PRINT_STRING

    MOV SI, 0
    MOV CX, 3

TOP3:
    CMP SI, BX
    JAE END_PROGRAM

    MOV AL, NUM[SI]
    MOV AH, 0
    CALL PRINT_NUM_UNS
    PRINT 09H

    MOV AL, TIME[SI]
    MOV AH, 0
    CALL PRINT_NUM_UNS
    PRINT 0DH
    PRINT 0AH

    INC SI
    LOOP TOP3

; ===== EXIT PROGRAM =====
END_PROGRAM:
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
