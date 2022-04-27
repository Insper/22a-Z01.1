; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]
leaw $0, %A 
movw %A, %D

leaw $3, %A
movw %D, (%A)

LOOP:
  leaw $3, %A
  movw (%A), %D

  leaw $1, %A
  addw (%A), %D, %D 

  leaw $3, %A
  movw %D, (%A)

  leaw $0, %A ; leitura de RAM[0]
  movw (%A), %D ; movendo o valor de RAM[0] para %D

  decw %D       ;tira 1 de D
  movw %D, (%A) ; salva o valor de D em RAM[0]
  leaw $END, %A 
  je %D ; Pula para o fim se for igual a 0
  nop

leaw $LOOP, %A
jmp
nop

END: