; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

; -----------------------
; RAM[0] = RAM[1]
; -----------------------


; -----------------------
; RAM[3] = 1
; -----------------------


leaw $0,%A
movw (%A),%A
movw %A,%D
leaw $3,%A    ;armazenando 0 em 3
movw %D,(%A)

leaw $1,%A
movw (%A),%A
movw %A,%D
leaw $0,%A    ;armazenando 1 em 0
movw %D,(%A)

leaw $3,%A
movw (%A),%A
movw %A,%D    ; armazenando 3 em 1
leaw $1,%A
movw %D,(%A)

movw $1,%D  ; armazenando 1 em 3
leaw $3,%A
movw %D,(%A)
