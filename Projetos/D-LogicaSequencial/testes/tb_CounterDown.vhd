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
  signal q   : std_logic_vector(2 downto 0);

begin

	mapping: CounterDown port map(clk, q);

	clk <= not clk after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- IMPLEMENTE AQUI!
    wait until clk'event and clk='0';
		assert(q = "111")  report "Teste falhou" severity error;

    wait until clk'event and clk='0';
		assert(q = "110")  report "Teste falhou" severity error;

    wait until clk'event and clk='0';
    assert(q = "101")  report "Teste falhou" severity error;

    wait until clk'event and clk='0';
    assert(q = "100")  report "Teste falhou" severity error;
    
    wait until clk'event and clk='0';
    assert(q = "011")  report "Teste falhou" severity error;

    wait until clk'event and clk='0';
    assert(q = "010")  report "Teste falhou" severity error;
    
    -- finish
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
