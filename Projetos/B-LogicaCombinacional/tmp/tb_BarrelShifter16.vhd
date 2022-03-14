-- Generated automatically by vhdl_sim
-- developed by Renan Trevisoli
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_BarrelShifter16 is
end entity;

architecture tb of tb_BarrelShifter16 is
	component BarrelShifter16 is
	port (
	a: in STD_LOGIC_VECTOR(15 downto 0);
	dir: in STD_LOGIC;
	size: in STD_LOGIC_VECTOR(2 downto 0);
	q: out STD_LOGIC_VECTOR(15 downto 0)
	);
	end component;

	signal in_a:  STD_LOGIC_VECTOR(15 downto 0);
	signal in_dir:  STD_LOGIC;
	signal in_size:  STD_LOGIC_VECTOR(2 downto 0);
	signal out_q:  STD_LOGIC_VECTOR(15 downto 0);
begin
	uBarrelShifter16 : BarrelShifter16 port map(in_a,in_dir,in_size,out_q);
	in_a <= "0000000000000100";
	in_dir <= '1';
	in_size <= "001";
end architecture;
