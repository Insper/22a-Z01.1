onerror {quit -code 1}
source "/home/borg/elementos_de_sistemas/Z01.1-Boolean/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_flipflopjk.all_9d64ce8fdac1f786e8a805d2925482d388c3ef65/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
