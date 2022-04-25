 ; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01
;
; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros


; R5 = bool(executado?)

; R3=R0-R1
leaw $0, %A
movw (%A),%D
leaw $1,%A
subw %D,(%A),%D
leaw $3,%A
movw %D,(%A)
leaw $18,%A
jge %D
; if R0-R1>0,then goto line ???
nop

;R4=R1-R0
leaw $0,%A
movw (%A),%D
leaw %1,%D
subw (%A),%D,%D
leaw $4,%A
movw %D,(%A)
leaw $29,%A
jge %D 
; if R1-R0>0,then goto line ???
nop


leaw $5,%A
movw (%A),%D
leaw $50,%A
jne %D
nop

leaw $0,%A
movw (%A),%D
leaw $2,%A
movw %D,(%A)
leaw $5,%A
movw $1,(%A)

leaw $5,%A
movw (%A),%D
leaw $50,%A
jne %D
nop

leaw $1,%A
movw (%A),%D
leaw $2,%A
movw %D,(%A)
leaw $5,%A
movw $1,(%A)

