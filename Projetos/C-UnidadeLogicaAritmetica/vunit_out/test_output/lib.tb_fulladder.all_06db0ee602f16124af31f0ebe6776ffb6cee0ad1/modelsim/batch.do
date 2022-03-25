onerror {quit -code 1}
source "/home/borg/Desktop/-Z01.1-EdnaldoPereira/Projetos/C-UnidadeLogicaAritmetica/vunit_out/test_output/lib.tb_fulladder.all_06db0ee602f16124af31f0ebe6776ffb6cee0ad1/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
