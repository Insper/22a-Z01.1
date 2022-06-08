; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 2 - POP local 0
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $0,%A
movw %A,%D
leaw $1,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 3 - PUSH argument 1
leaw $2,%A
movw (%A),%D
leaw $1,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 4 - POP local 1
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $1,%A
movw %A,%D
leaw $1,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
loop:
; 5 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 6 - PUSH local 1
leaw $1,%A
movw (%A),%D
leaw $1,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 7 - EQ
; 8 - Goto Condicional
leaw $0,%A
movw (%A),%A
decw %A
movw (%A),%D
leaw $-1,%A
subw %A,%D,%D
leaw $PULA,%A
je %D
nop
PULA:
leaw $end,%A
jmp
nop
NAOPULA:
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
END:
; 9 - PUSH local 0
leaw $1,%A
movw (%A),%D
leaw $0,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 10 - PUSH argument 0
leaw $2,%A
movw (%A),%D
leaw $0,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 11 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 12 - POP local 0
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $0,%A
movw %A,%D
leaw $1,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 13 - PUSH local 1
leaw $1,%A
movw (%A),%D
leaw $1,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 14 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 15 - SUB
; 16 - POP local 1
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $1,%A
movw %A,%D
leaw $1,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 17 - Goto Incondicional
leaw $loop,%A
jmp
nop
end:
; 18 - PUSH local 0
leaw $1,%A
movw (%A),%D
leaw $0,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 21 - PUSH constant 7
leaw $7, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 22 - PUSH constant 2
leaw $2, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 23 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 24 - PUSH constant 3
leaw $3, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
END:
; 26 - Goto Incondicional
leaw $END,%A
jmp
nop
; End
