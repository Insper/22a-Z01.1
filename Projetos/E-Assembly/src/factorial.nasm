; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $1, %A
movw $0, (%A)

leaw $0, %A 
movw (%A), %D 
leaw $CASOZERO, %A
je %D
nop 

leaw $0, %A
movw (%A), %D; D = r[0] = 4
leaw $COUNTER, %A ; 
movw %D, (%A) ;r[cont] = 4
leaw $2, %A  
movw %D, (%A)  ; r[2] = D = 4
leaw $COUNTER, %A  
movw (%A), %D ; D = r[cont]
subw %D, $1, (%A); r[cont] = D - 1 = r[cont] -1 = 3

WHILE:

leaw $2, %A
movw (%A), %D ; D = r[2] = 4
subw %D, $1, (%A) ; r[2] = D - 1 = 4 -1 = 3
leaw $2, %A
movw (%A), %D ; D = r[2] = 3
leaw $END, %A 
jle %D
nop 

leaw $0, %A
movw (%A), %D ; D = r[0] = 4
leaw $1, %A 
addw (%A), %D, %D ; D = D + r[1] = r[0] + r[1] = 4 + 0 = 4
movw %D, (%A) ; r[1] = D = 4

leaw $WHILE, %A
jmp 
nop

WHILEE:

leaw $1, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A) 

leaw $WHILE, %A
jmp 
nop

CASOZERO:
leaw $1, %A
movw %A, (%A)

END:

leaw $COUNTER, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $2, %A
movw %D, (%A)

leaw $ENDD, %A
jle %D
nop

leaw $WHILEE, %A
jmp 
nop

END2:
