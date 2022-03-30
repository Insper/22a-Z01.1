-- Elementos de Sistemas
-- tb_CounterDown.vhd

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_CounterDown is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_CounterDown is

	component CounterDown is
    port(
      clock:  in std_logic;
      q:      out std_logic_vector(2 downto 0)
      );
	end component;

	signal clk : std_logic := '0';
  signal q, outQ   : std_logic_vector(2 downto 0);

begin

	mapping: CounterDown port map(clk, q);

	clk <= not clk after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- IMPLEMENTE AQUI!
      q <= "000";
    wait for 1000 ps;
    assert(outQ = "111")  report "Falha em teste: 0" severity error;


    -- finish
    wait until clk'event and clk='1';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
