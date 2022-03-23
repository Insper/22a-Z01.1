onerror {quit -code 1}
source "/home/borg/Desktop/-Z01.1-EdnaldoPereira/vunit_out/test_output/lib.tb_inc16.all_2eeb55b34fbd7b5d1c8fa04094fa8e04485ace6a/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
