onerror {quit -code 1}
<<<<<<< HEAD
source "/home/borg/Z01.1--Dio/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_ram8.all_479863c9f9014a9dc9b05b00557ba5ed5848a6ed/modelsim/common.do"
=======
source "/home/borg/Documents/Elesis/Z01.1--Dio/Projetos/D-LogicaSequencial/vunit_out/test_output/lib.tb_ram8.all_479863c9f9014a9dc9b05b00557ba5ed5848a6ed/modelsim/common.do"
>>>>>>> main
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0