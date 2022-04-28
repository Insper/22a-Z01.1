; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.


; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.


; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.


; R[6]=R[5]
; if R[5]==0, then GoTo line 40 (R[0]=1)
leaw $5,%A
movw (%A), %D
leaw $6,%A
movw %D,(%A)
leaw $22,%A
je %D
nop

;if R[6]<0, then R[6]=-R[6]
leaw $13,%A
jge %D
nop
negw %D
leaw $6,%A
movw %D,(%A)

; %D=2
leaw $2,%A
movw %A,%D
leaw $6,%A

; D = RAM[6] - 2
subw (%A),%D, %D
movw %D,(%A)

;Se %D > 0, then goto line 13
leaw $13,%A
jg %D
nop

;Se %D<0, then goto line 50
;Else, RAM[0]=1
leaw $26,%A
jl %D
nop
leaw $0,%A
movw $1,(%A)
leaw $50,%A
jg %D
nop
leaw $0,%A
movw $0,(%A)


