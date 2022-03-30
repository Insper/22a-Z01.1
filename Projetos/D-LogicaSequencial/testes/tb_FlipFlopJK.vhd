-- Elementos de Sistemas
-- tb_A-FlipFlopJK.vhd

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_FlipFlopT is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_FlipFlopT is

	component FlipFlopJK is
    port(
      clock:  in std_logic;
      J:      in std_logic;
      K:      in std_logic;
      q:      out std_logic:= '0';
      notq:   out std_logic:= '1'
      );
	end component;

	signal clk : std_logic := '0';
  signal j,k,sq,snotq : std_logic;

begin

	mapping: FlipFlopJK port map(clk, j, k, sq, snotq);

	clk <= not clk after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

  -- Teste 0
    j <= '0'; k <= '0';
  wait until clk'event and clk='1';
    assert(sq = '0' and snotq = '1')  report "Falha em teste: 0" severity error;

  -- Teste 1
    j <= '0'; k <= '1';
  wait until clk'event and clk='1';
    assert(sq = '0' and snotq = '1')  report "Falha em teste: 1" severity error;

  -- Teste 2
    j <= '1'; k <= '1';
  wait until clk'event and clk='1';
    assert(sq = '1' and snotq = '0')  report "Falha em teste: 2" severity error;

  -- Teste 3
    j <= '1'; k <= '0';
  wait until clk'event and clk='1';
    assert(sq = '1' and snotq = '0')  report "Falha em teste: 3" severity error;
  
  -- Teste 4
  j <= '0'; k <= '0';
  wait until clk'event and clk='1';
    assert(sq = '1' and snotq = '0')  report "Falha em teste: 4" severity error;
  
  -- Teste 5
  j <= '1'; k <= '1';
  wait until clk'event and clk='1';
    assert(sq = '0' and snotq = '1')  report "Falha em teste: 5" severity error;
  
  -- Teste 6
  j <= '0'; k <= '0';
  wait until clk'event and clk='1';
    assert(sq = '0' and snotq = '1')  report "Falha em teste: 6" severity error;
  
  -- Teste 7
  j <= '1'; k <= '0';
  wait until clk'event and clk='1';
    assert(sq = '1' and snotq = '0')  report "Falha em teste: 7" severity error;
    
  test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
