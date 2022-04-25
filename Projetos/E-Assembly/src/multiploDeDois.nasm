; Arquivo: multiploDeDois.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; multiplo de dois, se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.


leaw $5,%A ;salva R5 em D
movw (%A),%D

leaw $1,%A    ;and entre 000000000000001 e D (retorna 0 caso primeiro bit de D seja 0 e retorna 1 caso primeiro bit de D seja 1)
andw %A,%D,%D

notw %D     ;inverte D e faz outra bitmask igual
leaw $1,%A
andw %A,%D,%D

leaw $0,%A ;guarda D em R0
movw %D,(%A)
