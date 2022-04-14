-- Elementos de Sistemas
-- tb_A-FlipFlopT.vhd

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_FlipFlopT is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_FlipFlopT is

	component FlipFlopT is
    port(
      clock:  in std_logic;
      t:      in std_logic;
      q:      out std_logic:= '0';
      notq:   out std_logic:= '1'
      );
	end component;

	signal clk : std_logic := '0';
  signal int,outq,outnotq : std_logic;

begin

	mapping: FlipFlopT port map(clk, int, outq, outnotq);

	clk <= not clk after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 0
		int <= '0';
    wait until clk'event and clk='0';
		assert(outq = '0')  report "Falha em teste: 0" severity error;

      -- Teste: 1
		int <= '1';
    wait until clk'event and clk='0';
		assert(outq = '1')  report "Falha em teste: 1" severity error;

    -- finish
    wait until clk'event and clk='0';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
