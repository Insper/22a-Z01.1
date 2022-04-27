; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD

leaw $0, %A
movw %A, %D
notw %D


; leaw $16384, %A
; movw %D, (%A)

leaw $18408, %A ;1
movw %D, (%A)
leaw $18428, %A ;2
movw %D, (%A)
leaw $18448, %A ;3
movw %D, (%A)
leaw $18468, %A ;4
movw %D, (%A)
leaw $18488, %A ;5
movw %D, (%A)
leaw $18508, %A ;6
movw %D, (%A)
leaw $18528, %A ;7
movw %D, (%A)
leaw $18548, %A ;8
movw %D, (%A)
leaw $18568, %A ;9
movw %D, (%A)
leaw $18588, %A ;10
movw %D, (%A)
leaw $18608, %A ;11
movw %D, (%A)
leaw $18628, %A ;12
movw %D, (%A)
leaw $18648, %A ;13
movw %D, (%A)
leaw $18668, %A ;14
movw %D, (%A)
leaw $18688, %A ;15
movw %D, (%A)
leaw $18708, %A ;16
movw %D, (%A)

leaw $18409, %A ;1
movw %D, (%A)
leaw $18429, %A ;2
movw %D, (%A)
leaw $18449, %A ;3
movw %D, (%A)
leaw $18469, %A ;4
movw %D, (%A)
leaw $18489, %A ;5
movw %D, (%A)
leaw $18509, %A ;6
movw %D, (%A)
leaw $18529, %A ;7
movw %D, (%A)
leaw $18549, %A ;8
movw %D, (%A)
leaw $18569, %A ;9
movw %D, (%A)
leaw $18589, %A ;10
movw %D, (%A)
leaw $18609, %A ;11
movw %D, (%A)
leaw $18629, %A ;12
movw %D, (%A)
leaw $18649, %A ;13
movw %D, (%A)
leaw $18669, %A ;14
movw %D, (%A)
leaw $18689, %A ;15
movw %D, (%A)
leaw $18709, %A ;16
movw %D, (%A)

leaw $18728, %A ;1
movw %D, (%A)
leaw $18748, %A ;2
movw %D, (%A)
leaw $18768, %A ;3
movw %D, (%A)
leaw $18788, %A ;4
movw %D, (%A)
leaw $18808, %A ;5
movw %D, (%A)
leaw $18828, %A ;6
movw %D, (%A)
leaw $18848, %A ;7
movw %D, (%A)
leaw $18868, %A ;8
movw %D, (%A)
leaw $18888, %A ;9
movw %D, (%A)
leaw $18908, %A ;10
movw %D, (%A)
leaw $18928, %A ;11
movw %D, (%A)
leaw $18948, %A ;12
movw %D, (%A)
leaw $18968, %A ;13
movw %D, (%A)
leaw $18988, %A ;14
movw %D, (%A)
leaw $19008, %A ;15
movw %D, (%A)
leaw $19028, %A ;16
movw %D, (%A)

leaw $18729, %A ;1
movw %D, (%A)
leaw $18749, %A ;2
movw %D, (%A)
leaw $18769, %A ;3
movw %D, (%A)
leaw $18789, %A ;4
movw %D, (%A)
leaw $18809, %A ;5
movw %D, (%A)
leaw $18829, %A ;6
movw %D, (%A)
leaw $18849, %A ;7
movw %D, (%A)
leaw $18869, %A ;8
movw %D, (%A)
leaw $18889, %A ;9
movw %D, (%A)
leaw $18909, %A ;10
movw %D, (%A)
leaw $18929, %A ;11
movw %D, (%A)
leaw $18949, %A ;12
movw %D, (%A)
leaw $18969, %A ;13
movw %D, (%A)
leaw $18989, %A ;14
movw %D, (%A)
leaw $19009, %A ;15
movw %D, (%A)
leaw $19029, %A ;16
movw %D, (%A)
