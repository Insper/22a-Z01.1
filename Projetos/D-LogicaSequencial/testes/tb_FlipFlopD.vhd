-- Elementos de Sistemas
-- developed by Luciano Soares
-- tb_FlipFlopD.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_FlipFlopD is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_FlipFlopD is

	component FlipFlopD is
		port(
			clock:  in std_logic;
			d:      in std_logic;
			clear:  in std_logic;
			preset: in std_logic;
			q:     out std_logic
		);
	end component;

	signal inClock : std_logic := '0';
	signal inD : std_logic;
	signal inClear : STD_LOGIC;
	signal inPreset : STD_LOGIC;
	signal outQ : STD_LOGIC;

begin

	mapping: FlipFlopD port map(inClock, inD, inClear, inPreset, outQ);

	inClock <= not inClock after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

		-- Teste: 0
		inD <= '0'; inClear <= '1'; inPreset <= '0';
    wait until inClock'event and inClock='0';
		assert(outQ = '0')  report "Falha em teste: 0" severity error;

		-- Teste: 1
		inD <= '1'; inClear <= '0'; inPreset <= '0';
    wait until inClock'event and inClock='0';
		assert(outQ = '1')  report "Falha em teste: 1" severity error;

		-- Teste: 2
		inD <= '0'; inClear <= '0'; inPreset <= '1';
    wait until inClock'event and inClock='0';
		assert(outQ = '1')  report "Falha em teste: 2" severity error;

		-- Teste: 3
		inD <= '0'; inClear <= '0'; inPreset <= '0';
    wait until inClock'event and inClock='0';
		assert(outQ = '0')  report "Falha em teste: 3" severity error;

		-- Teste: 4
		inD <= '1'; inClear <= '0'; inPreset <= '0';
    wait until inClock'event and inClock='0';
		assert(outQ = '1')  report "Falha em teste: 4" severity error;

		-- Teste: 5
		inD <= '1'; inClear <= '1'; inPreset <= '0';
    wait until inClock'event and inClock='0';
		assert(outQ = '0')  report "Falha em teste: 5" severity error;

    -- finish 
    wait until inClock'event and inClock='0';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
