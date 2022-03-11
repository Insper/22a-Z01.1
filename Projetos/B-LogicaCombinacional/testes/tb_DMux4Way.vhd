-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_DMux4Way.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_DMux4Way is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_DMux4Way is

component DMux4Way is
  port (
      a:   in  STD_LOGIC;
      sel: in  STD_LOGIC_VECTOR(1 downto 0);
      q0:  out STD_LOGIC;
      q1:  out STD_LOGIC;
      q2:  out STD_LOGIC;
      q3:  out STD_LOGIC);
end component;

  signal inA, outQ0, outQ1, outQ2, outQ3 : STD_LOGIC;
  signal inSel : STD_LOGIC_VECTOR(1 downto 0);

  -- Clock
  constant CLK_PERIOD : time := 1 ns;
  signal clk : STD_LOGIC := '0';

begin

  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;  --for 0.5 ns signal is '0'.
    clk <= '1';
    wait for clk_period/2;  --for next 0.5 ns signal is '1'.
  end process;

  mapping: DMux4Way port map(inA, inSel, outQ0, outQ1, outQ2, outQ3);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 1
    inA <= '1'; inSel <= "00";
    wait until clk='1' ;
    assert(outQ0='1' and outQ1='0' and outQ2='0' and outQ3='0')  report "Falha em teste: 1" severity error;

    -- Teste: 2
    inA <= '1'; inSel<= "01";
    wait until clk='1' ;
    assert(outQ0='0' and outQ1='1' and outQ2='0' and outQ3='0')  report "Falha em teste: 2" severity error;

    -- Teste: 3
    inA <= '1'; inSel<= "10";
    wait until clk='1' ;
    assert(outQ0='0' and outQ1='0' and outQ2='1' and outQ3='0')  report "Falha em teste: 3" severity error;

    -- Teste: 4
    inA <= '1'; inSel<= "11";
    wait until clk='1' ;
    assert(outQ0='0' and outQ1='0' and outQ2='0' and outQ3='1')  report "Falha em teste: 4" severity error;

    -- Teste: 5
    inA <= '0'; inSel<= "00";
    wait until clk='1' ;
    assert(outQ0='0' and outQ1='0' and outQ2='0' and outQ3='0')  report "Falha em teste: 5" severity error;

    -- Teste: 6
    inA <= '0'; inSel<= "01";
    wait until clk='1' ;
    assert(outQ0='0' and outQ1='0' and outQ2='0' and outQ3='0')  report "Falha em teste: 6" severity error;

    -- Teste: 7
    inA <= '0'; inSel<= "10";
    wait until clk='1' ;
    assert(outQ0='0' and outQ1='0' and outQ2='0' and outQ3='0')  report "Falha em teste: 7" severity error;

    -- Teste: 8
    inA <= '0'; inSel<= "11";
    wait until clk='1' ;
    assert(outQ0='0' and outQ1='0' and outQ2='0' and outQ3='0')  report "Falha em teste: 8" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
