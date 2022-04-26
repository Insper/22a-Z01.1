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

leaw $0, %A
movw (%A), %D
leaw $1, %A
subw (%A), %D, %D ; subtraindo R1 por R0, e se o resultado for negativo, significa que R0 é maior que R1 
leaw $MAXRO, %A
jl %D
nop
leaw $1, %A ; significa que R0 < R1
movw (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $END, %A
jmp
nop
MAXRO:
    leaw $0, %A 
    movw (%A), %D
    leaw $2, %A 
    movw %D, (%A) 
    leaw $END, %A 
    jmp
    nop

END: