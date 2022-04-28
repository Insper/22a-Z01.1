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

; if R[5]==0, then GoTo line 40 (R[0]=1)
leaw $5,%A
movw (%A), %D
leaw $20,%A
je %D
nop

;if R[5]<0, then R[5]=-R[5]
leaw $11,%A
jge %D
nop
negw %D
leaw $5,%A
movw (%A), %D

; %D=2
leaw $2,%A
movw %A,%D
leaw $5,%A

; D = RAM[5] - 2
subw (%A),%D, %D
movw %D,(%A)

;Se %D > 0, then goto line 0
leaw $0,%A
jg %D
nop

;Se %D!=0, then goto line 30
;Else, RAM[0]=1
leaw $30,%A
jne %D
nop
leaw $0,%A
movw $1,(%A)



