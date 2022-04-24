; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------

leaw $R0, %A
movw (%A), %D
leaw $R1, %A
; Fazer JUMPs com subtracoes ate o valor de R0 ser menor que R1. O resto sera esse valor de R0.
; divw %D, (%A), %D
subw (%A), %D, %D
leaw $R2, %A
movw (%A), %D