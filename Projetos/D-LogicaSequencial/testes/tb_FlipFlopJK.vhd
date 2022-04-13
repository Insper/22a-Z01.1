-- Elementos de Sistemas
-- tb_A-FlipFlopJK.vhd

-- Implementa o teste do flipflopJK
-- arquivo : tb_FlipFlopJK.vhd

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
  signal j,k,q,notq : std_logic;

begin

	mapping: FlipFlopJK port map(clk, j, k, q, notq);

	clk <= not clk after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- IMPLEMENTE AQUI!
    -- Teste do flipflopJK
    J <= '0'; 
    K <= '0';
    wait until clk'event and clk='0';
    assert(
      q = '0' 
      and notq='1') 
    report "Teste 1 nao passou" severity error;

    J <= '0'; 
    K <= '1';
    wait until clk'event and clk='0';
    assert(
      q = '0' 
      and notq='1')
    report "Teste 2 nao passou" severity error;
	 
    J <= '1'; 
    K <= '0';
    wait until clk'event and clk='0';
    assert(
      q = '1' 
      and notq='0')
    report "Teste 3 nao passou" severity error;
    
    J <= '1'; 
    K <= '1';
    wait until clk'event and clk='0';
    assert(
      q ='0' 
    and notq='1')  
    report "Teste 4 nao passou" severity error;
	 
	 wait until clk'event and clk='0';
    assert(
      q ='1' 
      and notq='0')  
    report "Teste 5 nao passou" severity error;

    -- finish
    wait until clk'event and clk='0';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
