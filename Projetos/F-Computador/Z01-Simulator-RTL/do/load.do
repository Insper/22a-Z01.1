vlib work

vcom -reportprogress 300 -work work ../../B-LogicaCombinacional/src/*.vhd
vcom -reportprogress 300 -work work ../../C-UnidadeLogicaAritmetica/src/*.vhd
vcom -reportprogress 300 -work work ../../D-LogicaSequencial/src/*.vhd

vcom -reportprogress 300 -work work ../src/MemoryIO.vho
vcom -reportprogress 300 -work work ../src/ControlUnit.vhd
vcom -reportprogress 300 -work work ../src/CPU.vhd
vcom -reportprogress 300 -work work ../src/Computador.vhd

#vcom -reportprogress 300 -work work ../src/Dispositivos/PLL/*.vhd
vcom -reportprogress 300 -work work ../src/Dispositivos/PLL/PLL_sim/PLL.vho
vcom -reportprogress 300 -work work ../src/Dispositivos/RAM/*.vho
vcom -reportprogress 300 -work work ../src/Dispositivos/ROM/*.vhd
vcom -reportprogress 300 -work work ../src/Dispositivos/Screen/FIFO/*.vhd
vcom -reportprogress 300 -work work ../src/Dispositivos/Screen/*.vho

vcom -reportprogress 300 -work work ../testes/Computador_tb.vhd
