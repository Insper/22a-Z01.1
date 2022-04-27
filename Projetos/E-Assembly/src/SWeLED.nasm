leaw $21185,%A ;colhendo resultado das chaves
movw (%A),%D
notw %D
leaw $510,%A
andw %A,%D,%D
leaw $21184,%A
movw %D,(%A)
leaw $0,%A
jmp
nop








