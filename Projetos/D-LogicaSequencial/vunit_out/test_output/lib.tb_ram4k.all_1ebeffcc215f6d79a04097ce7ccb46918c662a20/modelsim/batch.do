onerror {quit -code 1}
source "/home/borg/elementos_de_sistemas/Z01.1-Boolean/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_ram4k.all_1ebeffcc215f6d79a04097ce7ccb46918c662a20/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
