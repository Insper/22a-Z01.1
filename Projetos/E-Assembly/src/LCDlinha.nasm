; Arquivo: LCDLinha.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD
; LCD = 320x240


; 1. enderecos_porLinha    = 320/16 
;                          = 20
;
;2. offset_linhaCentral   = 20*240/2
;                         = 2400
;
;3. endereco_linhaCentral = 16384 + 2400
;                         = 18784
;
;4. px_central            = 18784 + 10 
;                         = 18794


leaw $18784, %A
movw $-1, (%A)
leaw $18785, %A
movw $-1, (%A)
leaw $18786, %A
movw $-1, (%A)
leaw $18787, %A
movw $-1, (%A)
leaw $18788, %A
movw $-1, (%A)
leaw $18789, %A
movw $-1, (%A)
leaw $18790, %A
movw $-1, (%A)
leaw $18791, %A
movw $-1, (%A)
leaw $18792, %A
movw $-1, (%A)
leaw $18793, %A
movw $-1, (%A)
leaw $18794, %A
movw $-1, (%A)
leaw $18795, %A
movw $-1, (%A)
leaw $18796, %A
movw $-1, (%A)
leaw $18797, %A
movw $-1, (%A)
leaw $18798, %A
movw $-1, (%A)
leaw $18799, %A
movw $-1, (%A)
leaw $18800, %A
movw $-1, (%A)
leaw $18801, %A
movw $-1, (%A)
leaw $18802, %A
movw $-1, (%A)
leaw $18803, %A
movw $-1, (%A)
leaw $18804, %A
movw $-1, (%A)
