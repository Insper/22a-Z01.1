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
subw (%A), %D, %D ; R1 - R0
; Se essa conta der negativa é porque R0 > R1
leaw MAXR0, %A
jl %D
nop

; Se chegou aqui é porque R0 < R1
leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $END, %A
jmp
nop

MAXR0:
  leaw $0, %A
  movw (%A), %D
  ;; Não sei porque o jump está sendo feito a partir daqui!
  leaw $0, %A
  movw (%A), %D
  leaw $2, %A
  movw %D, (%A)

  leaw $END, %A
  jmp
  nop

END:

 