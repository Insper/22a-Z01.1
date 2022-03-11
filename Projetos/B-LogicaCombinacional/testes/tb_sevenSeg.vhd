-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_sevenSeg.vhd
-- date: fev/2020

library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_sevenSeg is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_sevenSeg is

	component sevenSeg is
	port (
    bcd : in  STD_LOGIC_VECTOR(3 downto 0);
    leds: out STD_LOGIC_VECTOR(6 downto 0));
	end component;

  signal bcd  : STD_LOGIC_VECTOR(3 downto 0);
  signal leds : STD_LOGIC_VECTOR(6 downto 0);

  -- Clock
  constant CLK_PERIOD : time := 1 ns;
  signal clk : STD_LOGIC := '0';

begin

  uSevenSeg : sevenSeg port map(bcd,leds);

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

    bcd <= "0000";
    wait until clk='1' ;
    assert(leds = "1000000")  report "Falha em BCD=0" severity error;

    bcd <= "0011";
    wait until clk='1' ;
    assert(leds = "0110000")  report "Falha em BCD=3" severity error;

    bcd <= "0111";
    wait until clk='1' ;
    assert(leds = "1111000")  report "Falha em BCD=7" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
