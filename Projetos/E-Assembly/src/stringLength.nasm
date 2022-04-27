; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000


leaw $0, %A
movw %A, (%A) ; Inicia RAM[0] (contador)

LOOP:
  leaw $8, %A
  movw %A, %D
  leaw $0, %A 
  addw (%A), %D, %A ; Pega sempre o próximo endereço da memória -> No primeiro vai ser o próprio 8 porque (%A) = 0
  movw (%A), %D
  leaw $END, %A
  je %D ; Pula para o fim se for igual a 0
  nop

leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $LOOP, %A
jmp
nop

END:





