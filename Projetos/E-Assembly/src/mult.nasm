; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

leaw $1, %A		    ;
movw (%A), %D		; salva ram[1] em D
leaw $0, %A		    ; 
mul (%A), %D, %D	; Multiplica ram[0] por D, guarda em D
leaw $3, %A;		;
movw %D, (%A)		; Guarda D em ram[3]