; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

; carrega R0 em %D:
;   leaw $R0, %A
;   movw (%A), %D

; R0 ---> entrada
; R1 ---> saída
; R2 ---> fator pelo qual vamos multiplicar no loop atual

; R3 ---> iterador da multiplicação atual
; paramos quando R2 == R0

LOAD:
  leaw $1, %A     ; carrega "1" em %A
  movw %A, %D     ; move de %A pra %D
  leaw $R1, %A    ; carrega o endereço de R1 em %A
  movw %D, (%A)   ; coloca %D em R1

FATORIAL:
  ; incrementa o valor em R2 (iterador do fatorial)
  leaw $R2, %A ; carrega R2 (iterador do fatorial) em %A
  movw (%A), %D ; move pro %D
  incw %D ; incrementa %D
  movw %D, (%A) ; salva em R2

  ; salta pro final se R2 == R0
  leaw $R2, %A ; carrega o endereço de R0 em %A
  movw (%A), %D ; copia o que tiver em R0 pra %D
  decw %D ; gambiarra pra parar 1 antes
  leaw $R0, %A ; carrega o endereço de R2 em %A
  subw (%A), %D, %D ; subtrai R2 (endereço em %A) de R0 (valor em %D) e salva em %D
  leaw $OUT, %A ; carrega o endereço do out em %A para um possível salto
  je %D ; tenta saltar pro OUT se %D == 0
  nop

  ; iguala R3 = R2 (R3 é o iterador da multiplicação)
  leaw $R2, %A ; carrega endereço de R2 em %A
  movw (%A), %D ; copia pro %D
  leaw $R3, %A ; carrega endereço de R3 em %A
  movw %D, (%A) ; copia %D pra R3

  ; R4 é o valor atual sendo multiplicado
  leaw $R1, %A
  movw (%A), %D
  leaw $R4, %A
  movw %D, (%A)

; R3 ==> é o iterador da multiplicação, decrescente
MULTIPLY:
  ; diminuir o R3
  leaw $R3, %A
  movw (%A), %D
  decw %D
  movw %D, (%A)

  ; verifica se R3 == 0 e volta pra fatorial se for verdadeiro
  ; copia R3 para %D
  leaw $R3, %A
  movw (%A), %D
  ; carrega os endereço do jump
  leaw $FATORIAL, %A ; pula pra $FATORIAL se R3 = 0
  je %D
  nop

  ; soma R4 em R1 e salva em R1
  leaw $R4, %A        ; carrega endereço de R4
  movw (%A), %D       ; copia o valor de R4 pra %D
  leaw $R1, %A
  addw (%A), %D, %D   ; soma %D com o valor de R1 e guarda em %D
  movw %D, (%A)       ; copia %D para R1

  leaw $MULTIPLY, %A
  jmp
  nop

OUT:

