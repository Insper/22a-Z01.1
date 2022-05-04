onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /computador_tb/c1/MAIN_CPU/clock
add wave -noupdate /computador_tb/c1/MAIN_CPU/instruction
add wave -noupdate /computador_tb/c1/MAIN_CPU/REG_D/output
add wave -noupdate /computador_tb/c1/MAIN_CPU/REG_A/output
add wave -noupdate /computador_tb/c1/MAIN_CPU/pcout
add wave -noupdate /computador_tb/c1/MAIN_CPU/outM
add wave -noupdate /computador_tb/c1/MAIN_CPU/writeM
add wave -noupdate /computador_tb/c1/MAIN_CPU/inM
add wave -noupdate -radix hexadecimal /computador_tb/c1/MAIN_CPU/ULA/x
add wave -noupdate -radix hexadecimal /computador_tb/c1/MAIN_CPU/ULA/y
add wave -noupdate -radix hexadecimal /computador_tb/c1/MAIN_CPU/ULA/saida
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49668 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 743
configure wave -valuecolwidth 378
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {19446 ps} {104240 ps}
