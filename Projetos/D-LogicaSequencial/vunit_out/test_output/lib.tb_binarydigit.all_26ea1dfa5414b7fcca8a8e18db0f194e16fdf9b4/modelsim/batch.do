onerror {quit -code 1}
source "/home/borg/Documents/Elesis/Z01.1--Dio/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_binarydigit.all_26ea1dfa5414b7fcca8a8e18db0f194e16fdf9b4/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
