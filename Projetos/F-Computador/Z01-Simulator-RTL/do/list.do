onerror {resume}
add list /computador_tb/c1/MAIN_CPU/clock
add list /computador_tb/c1/MAIN_CPU/instruction
add list /computador_tb/c1/MAIN_CPU/pcout
add list /computador_tb/c1/MAIN_CPU/s_regDout
add list /computador_tb/c1/MAIN_CPU/s_regAout
add list /computador_tb/c1/MAIN_CPU/c_muxALUI_A
add list /computador_tb/c1/MAIN_CPU/c_muxAM
add list /computador_tb/c1/MAIN_CPU/outM
add list /computador_tb/c1/MAIN_CPU/writeM
add list /computador_tb/c1/MAIN_CPU/inM
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta none
configure list -signalnamewidth 1
configure list -datasetprefix -1
configure list -namelimit 1
configure list -usegating 1
configure list -gateexpr { (/computador_tb/c1/MAIN_CPU/clock 'rising) && (/computador_tb/c1/MAIN_CPU/reset == 0)}
