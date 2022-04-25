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

leaw $0,%A ;guarda R0 em D e escreve D em R2
movw (%A),%D
leaw $2,%A
movw %D,(%A)

leaw $1,%A  ; guarda R1 em A
movw (%A),%A

subw %D,%A,%D ; guarda R0 - R1 em D

leaw $MAX,%A ; se D >= 0 pula para MAX
jge %D
nop

leaw $1,%A ;guarda R1 em D e escreve D em R2 (so vai rodar se D for menor que 0)
movw (%A),%D 
leaw $2,%A
movw %D,(%A)

MAX:
    nop
