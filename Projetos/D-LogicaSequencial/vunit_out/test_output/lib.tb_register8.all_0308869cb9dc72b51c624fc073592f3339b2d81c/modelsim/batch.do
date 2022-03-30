onerror {quit -code 1}
source "/home/borg/elementos_de_sistemas/Z01.1-Boolean/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_register8.all_0308869cb9dc72b51c624fc073592f3339b2d81c/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
