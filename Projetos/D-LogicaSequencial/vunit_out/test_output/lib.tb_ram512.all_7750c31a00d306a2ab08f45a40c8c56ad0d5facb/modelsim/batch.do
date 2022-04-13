onerror {quit -code 1}
source "/home/borg/Documents/Elesis/Z01.1--Dio/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_ram512.all_7750c31a00d306a2ab08f45a40c8c56ad0d5facb/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
