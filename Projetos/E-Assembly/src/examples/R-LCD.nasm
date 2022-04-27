; ####################################################################
; Rafael Corsi @ 2018
; 
; Escreve a letra R na tela
; ####################################################################

; carrega x"FF" em S (todos pxs em '1')
  leaw $0, %A
  movw %A, %D
  notw %D

  ; linha 1
  leaw $18815, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)

  ;; linha 2
  leaw $18835, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)

  ;;  linha 3
  leaw $18855, %A
  movw %D, (%A)

  leaw $18858, %A
  movw %D, (%A)

  ;; linha 4
  leaw $18875, %A
  movw %D, (%A)

  leaw $18878, %A
  movw %D, (%A)

  ;; linha 5
  leaw $18895, %A
  movw %D, (%A)

  leaw $18898, %A
  movw %D, (%A)

  ;; linha 6
  leaw $18915, %A
  movw %D, (%A)

  leaw $18918, %A
  movw %D, (%A)

  ; linha 7
  leaw $18935, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)

  ; linha 8
  leaw $18955, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)

  ; linha 8
  leaw $18975, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)

  ; linha 8
  leaw $18995, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)

	;; linha 6
	leaw $19015, %A
	movw %D, (%A)

	leaw $19017, %A
	movw %D, (%A)
  incw %A
  movw %D, (%A)
  
	;; linha 6
	leaw $19035, %A
	movw %D, (%A)

	leaw $19037, %A
	movw %D, (%A)
	  incw %A
	  movw %D, (%A)

	;; linha 6
	leaw $19055, %A
	movw %D, (%A)

	leaw $19037, %A
	movw %D, (%A)
	  incw %A
	  movw %D, (%A)
  
	;; linha 6
	leaw $19075, %A
	movw %D, (%A)

	leaw $19078, %A
	movw %D, (%A)
	  incw %A
	  movw %D, (%A)

	;; linha 6
	leaw $19095, %A
	movw %D, (%A)

	leaw $19099, %A
	movw %D, (%A)

		;; linha 6
	leaw $19115, %A
	movw %D, (%A)

	leaw $19119, %A
	movw %D, (%A)

  ;;LEDs
  ;; endereco 21184
  leaw $5, %A
  movw %A, %D
  leaw %21184, %A
  movw %D, (%A)
