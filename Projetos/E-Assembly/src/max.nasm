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

leaw $0, %A ; %A = 0
movw (%A), %D ; %D = RAM[0]
leaw $1, %A ; %A = 1
subw (%A), %D, %D ; subtraindo R1 por R0, e se o resultado for negativo, significa que R0 é maior que R1 
leaw $MAXRO, %A ; %A = MAXRO
jl %D, %A ; se R0 for maior que R1, então R0 é maior que R2
nop
leaw $1, %A ; %A = 1
movw (%A), %D ; %D = RAM[1]
leaw $2, %A ; %A = 2
movw %D, (%A) ; %RAM[2] = R1
leaw $END, %A ; %A = END
jmp %A ; retorna para o programa principal
nop
MAXRO:
    leaw $0, %A ; %A = 0
    movw (%A), %D ; %D = RAM[0]
    leaw $2, %A ; %A = 2
    movw %D, (%A) ; %RAM[2] = R0
    leaw $END, %A ; %A = END
    jmp
    nop
END: