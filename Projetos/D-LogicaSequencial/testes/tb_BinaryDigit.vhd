-- Elementos de Sistemas
-- developed by Luciano Soares
-- tb_BinaryDigit.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_BinaryDigit is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_BinaryDigit is

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;

	signal inClock : std_logic := '0';
	signal inInput, inLoad, outOutput : std_logic;

begin

	mapping: BinaryDigit port map(inClock, inInput, inLoad, outOutput);

	inClock <= not inClock after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

		-- Teste: 0
		inInput <= '0'; inLoad <= '1';
    wait until inClock'event and inClock='0';
		assert(outOutput = '0')  report "Falha em teste: 0" severity error;

		-- Teste: 1
		inInput <= '1'; inLoad <= '0';
    wait until inClock'event and inClock='0';
		assert(outOutput = '0')  report "Falha em teste: 1" severity error;

		-- Teste: 2
		inInput <= '1'; inLoad <= '1';
    wait until inClock'event and inClock='0';
		assert(outOutput = '1')  report "Falha em teste: 2" severity error;


		-- Teste: 3
		inInput <= '0'; inLoad <= '0';
    wait until inClock'event and inClock='0';
		assert(outOutput = '1')  report "Falha em teste: 3" severity error;


    wait until inClock'event and inClock='0';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
