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
      q:      inout std_logic:= '0';
      notq:   inout std_logic:= '1'
      );
	end component;

	signal clk : std_logic := '0';
  signal t,q,notq : std_logic;

begin

	mapping: FlipFlopT port map(clk, t, q, notq);

	clk <= not clk after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

  -- Teste 0
    t <= '0';
  wait until clk'event and clk='0';
    assert(q = '0' and notq = '1')  report "Falha em teste: 0" severity error;

  -- Teste 1
    t <= '1';
  wait until clk'event and clk='0';
    assert(q = '1' and notq = '0')  report "Falha em teste: 1" severity error;

  -- Teste 2
    t <= '1';
  wait until clk'event and clk='0';
    assert(q = '0' and notq = '1')  report "Falha em teste: 2" severity error;
  
  -- Teste 3
    t <= '1';
  wait until clk'event and clk='0';
    assert(q = '1' and notq = '0')  report "Falha em teste: 3" severity error;
  
  -- Teste 4
    t <= '0';
  wait until clk'event and clk='0';
    assert(q = '1' and notq = '0')  report "Falha em teste: 4" severity error;
    
  -- Teste 5
    t <= '0';
  wait until clk'event and clk='0';
    assert(q = '1' and notq = '0')  report "Falha em teste: 5" severity error;

  test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
