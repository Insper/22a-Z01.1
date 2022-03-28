onerror {quit -code 1}
source "/home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/test_output/lib.tb_dmux8way.all_cd99140b7e67911c824fd741770dff369a28e4ff/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
