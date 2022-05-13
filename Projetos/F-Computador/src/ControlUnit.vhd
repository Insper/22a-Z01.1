-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e
                                                                     -- ng (se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- instrução  e ALU para reg. A
		muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- reg. A e Mem. RAM para ALU
                                                                     -- A  e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A,
                                                                     -- reg. D, Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is
begin

loadD <= '1' when (instruction(17) and instruction(4)) = '1' else '0';
loadA <= '1' when((not(instruction(17))) or instruction(3)) = '1' else '0';
loadM <= '1' when (instruction(17) and instruction(5)) = '1' else '0';
loadPC <= '1' when ((instruction(17) and instruction(1) and zr and (not(ng))) or ((instruction(0) and instruction(17) and not(ng) and not(zr)) or ((instruction(2) and instruction(17) and ng and (not(zr)))))) = '1' else '0';

zx<='1' when (instruction(12) and instruction(17)) = '1' else '0';
nx<= '1'when (instruction(11) and instruction(17)) = '1' else '0';
zy<='1' when (instruction(10) and instruction(17)) = '1' else '0';
ny<= '1'when (instruction(9) and instruction(17)) = '1' else '0';
f<= '1'when (instruction(8) and instruction(17)) = '1' else '0';
no<= '1'when (instruction(7) and instruction(17)) = '1' else '0';

muxALUI_A <= '1' when ((instruction(14) and instruction(17)) or (not(instruction(17)))) = '1' else '0';
muxAM<= '1'when (instruction(13))  = '1' else '0';



end architecture;