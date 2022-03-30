-- Elementos de Sistemas
-- developed by Luciano Soares
-- tb_Register64.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_Register64 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_Register64 is

	component Register64 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(63 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(63 downto 0)
		);
	end component;

	signal inClock : std_logic := '0';
	signal inInput : STD_LOGIC_VECTOR(63 downto 0);
	signal inLoad : STD_LOGIC;
	signal outOutput : STD_LOGIC_VECTOR(63 downto 0);

begin

	mapping: Register64 port map(inClock, inInput, inLoad, outOutput);

	inClock <= not inClock after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 0
		inInput <= x"0F0F0F0F0F0F0F0F"; inLoad <= '1';
    wait until inClock'event and inClock='0';
		assert(outOutput = x"0F0F0F0F0F0F0F0F")  report "Falha em teste: 0" severity error;

		-- Teste: 1
		inInput <= x"5555555555555555"; inLoad <= '0';
    wait until inClock'event and inClock='0';
		assert(outOutput = x"0F0F0F0F0F0F0F0F")  report "Falha em teste: 1" severity error;

		-- Teste: 2
		inInput <= x"5555555555555555"; inLoad <= '1';
    wait until inClock'event and inClock='0';
		assert(outOutput = x"5555555555555555")  report "Falha em teste: 2" severity error;

		-- Teste: 3
		inInput <= x"AAAAAAAAAAAAAAAA"; inLoad <= '0';
    wait until inClock'event and inClock='0';
		assert(outOutput = x"5555555555555555")  report "Falha em teste: 2" severity error;

    -- finish
    wait until inClock'event and inClock='0';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
