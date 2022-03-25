-- Elementos de Sistemas
-- developed by Luciano Soares
-- tb_FlipFlopD.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_PC is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_PC is

  component PC is
      port(
          clock     : in  STD_LOGIC;
          increment : in  STD_LOGIC;
          load      : in  STD_LOGIC;
          reset     : in  STD_LOGIC;
          input     : in  STD_LOGIC_VECTOR(15 downto 0);
          output    : out STD_LOGIC_VECTOR(15 downto 0)
      );
    end component;

	signal inClock      : std_logic := '0';
	signal inIncrement  : std_logic;
	signal inLoad       : STD_LOGIC;
	signal inReset      : STD_LOGIC;
	signal inInput      : STD_LOGIC_VECTOR(15 downto 0);
  signal inOutput     : STD_LOGIC_VECTOR(15 downto 0);

begin

  mapping: PC port map(inClock, inIncrement,
                       inLoad, inReset,
                       inInput, inOutput);

	inClock <= not inClock after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

		-- Teste: 0
    inIncrement <= '1'; inLoad <= '0'; inReset <= '0';
    inInput <= x"0000";
    wait until inClock'event and inClock='0';
		assert(inOutput = x"0001")  report "Falha em teste: 0" severity error;

    inIncrement <= '1'; inLoad <= '0'; inReset <= '0';
    inInput <= x"0000";
    wait until inClock'event and inClock='0';
		assert(inOutput = x"0002")  report "Falha em teste: 1" severity error;

    inIncrement <= '0'; inLoad <= '0'; inReset <= '0';
    inInput <= x"5555";
    wait until inClock'event and inClock='0';
		assert(inOutput = x"0002")  report "Falha em teste: 2" severity error;

    inIncrement <= '0'; inLoad <= '0'; inReset <= '1';
    inInput <= x"5555";
    wait until inClock'event and inClock='0';
		assert(inOutput = x"0000")  report "Falha em teste: 3" severity error;

    inIncrement <= '0'; inLoad <= '1'; inReset <= '0';
    inInput <= x"5555";
    wait until inClock'event and inClock='0';
		assert(inOutput = x"5555")  report "Falha em teste: 4" severity error;

    inIncrement <= '1'; inLoad <= '0'; inReset <= '0';
    inInput <= x"0000";
    wait until inClock'event and inClock='0';
		assert(inOutput = x"5556")  report "Falha em teste: 5" severity error;

    -- finish
    wait until inClock'event and inClock='0';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
