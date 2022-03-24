onerror {quit -code 1}
source "/home/borg/Z01.1--Dio/Projetos/C-UnidadeLogicaAritmetica/vunit_out/test_output/lib.tb_halfadder.all_2a9f30afe01faed90d95ca9cf2cee2354e984c4c/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
