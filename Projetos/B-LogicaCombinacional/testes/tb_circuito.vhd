-- Elementos de Sistemas
-- developed by Rafael Corsi
-- file: tb_circuito.vhd
-- date: fev/2020

library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_circuito is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_circuito is

	component circuito is
    port (
      A,B,C : in  STD_LOGIC;
      x     : out STD_LOGIC);
	end component;

  signal A,B,C,X  : STD_LOGIC;

  -- Clock
  constant CLK_PERIOD : time := 1 ns;
  signal clk : STD_LOGIC := '0';

begin

  uCircuito : circuito port map(A,B,C,X);

  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;  --for 0.5 ns signal is '0'.
    clk <= '1';
    wait for clk_period/2;  --for next 0.5 ns signal is '1'.
  end process;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    A <= '0'; B <= '0'; C <= '0';
    wait until clk='1' ;
    assert(X = '0')  report "Falha em BCD=0" severity error;

    A <= '1'; B <= '1'; C <= '0';
    wait until clk='1' ;
    assert(X = '1')  report "Falha em BCD=0" severity error;

    A <= '1'; B <= '1'; C <= '1';
    wait until clk='1' ;
    assert(X = '0')  report "Falha em BCD=0" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
