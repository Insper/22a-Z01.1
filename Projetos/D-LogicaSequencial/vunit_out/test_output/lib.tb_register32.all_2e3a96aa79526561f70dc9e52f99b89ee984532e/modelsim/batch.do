onerror {quit -code 1}
<<<<<<< HEAD
source "/home/borg/Z01.1--Dio/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_register32.all_2e3a96aa79526561f70dc9e52f99b89ee984532e/modelsim/common.do"
=======
source "/home/borg/Documents/Elesis/Z01.1--Dio/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_register32.all_2e3a96aa79526561f70dc9e52f99b89ee984532e/modelsim/common.do"
>>>>>>> main
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0