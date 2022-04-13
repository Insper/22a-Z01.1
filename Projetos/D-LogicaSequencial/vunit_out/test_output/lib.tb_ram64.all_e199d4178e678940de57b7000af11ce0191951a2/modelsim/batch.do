onerror {quit -code 1}
source "/home/borg/elementos_de_sistemas/Z01.1-Boolean/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_ram64.all_e199d4178e678940de57b7000af11ce0191951a2/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
