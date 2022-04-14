onerror {quit -code 1}
source "/home/borg/Z01.1-Invencible/Projetos/C-UnidadeLogicaAritmetica/vunit_out/test_output/lib.tb_zerador16.all_45f7988ffd33f2e3938d5b4b7eee25de1517305e/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
