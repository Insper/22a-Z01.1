-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_nand.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_Nand2 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_Nand2 is

  component Nand2 is
    port(a:in  STD_LOGIC;
         b:in  STD_LOGIC;
         q:out STD_LOGIC
         );
  end component;

  signal  inA, inB, outQ : STD_LOGIC;

  -- Clock
  constant CLK_PERIOD : time := 1 ns;
  signal clk : STD_LOGIC := '0';

begin

  mapping: Nand2 port map(inA, inB, outQ);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 0 0
    inA <= '0'; inB <= '0';
    wait for 200ps;
    assert(outQ = '1')  report "Falha em teste: 0 nand 0 != 1" severity error;

    -- Teste: 0 1
    inA <= '0'; inB <= '1';
    wait for 200ps;
    assert(outQ = '1')  report "Falha em teste: 0 nand 1 != 1" severity error;

    -- Teste: 1 0
    inA <= '1'; inB <= '0';
    wait for 200ps;
    assert(outQ = '1')  report "Falha em teste: 1 nand 0 != 1" severity error;

    -- Teste: 1 1
    inA <= '1'; inB <= '1';
    wait for 200ps;
    assert(outQ = '0')  report "Falha em teste: 1 nand 1 != 0" severity error;

    test_runner_cleanup(runner); -- Simulation ends here

    wait;
  end process;
end architecture;
