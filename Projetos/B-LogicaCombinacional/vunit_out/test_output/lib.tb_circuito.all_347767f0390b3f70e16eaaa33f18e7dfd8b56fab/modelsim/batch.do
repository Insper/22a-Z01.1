onerror {quit -code 1}
source "/home/gustavoeso/Documents/insper/trancando/elementos/Z01.1-Boolean/Projetos/B-LogicaCombinacional/vunit_out/test_output/lib.tb_circuito.all_347767f0390b3f70e16eaaa33f18e7dfd8b56fab/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
