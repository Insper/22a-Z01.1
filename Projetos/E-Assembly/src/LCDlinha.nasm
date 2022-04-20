; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD

leaw $16384, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

leaw $20, %A
movw %A, %D
leaw $1, %D
movw %D, (%A)

LOOP:
  leaw $0, %A
  movw (%A), %D
  movw %D, %A
  movw $-1, (%A)

  leaw $0, %A
  movw (%A), %D
  addw $1, %D, %D
  movw %D, (%A)

  leaw $1, %A
  movw (%A), %D
  decw %D
  movw %D, (%A)

  leaw $FIM, %A
  je %D
  nop

  leaw $LOOP, %A
  jmp
  nop

FIM: