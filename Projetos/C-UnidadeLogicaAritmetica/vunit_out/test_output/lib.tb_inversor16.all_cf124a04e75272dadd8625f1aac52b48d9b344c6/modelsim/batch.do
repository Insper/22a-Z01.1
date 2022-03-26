onerror {quit -code 1}
source "/home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/C-UnidadeLogicaAritmetica/vunit_out/test_output/lib.tb_inversor16.all_cf124a04e75272dadd8625f1aac52b48d9b344c6/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
