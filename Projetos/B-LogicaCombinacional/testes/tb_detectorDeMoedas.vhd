-- Elementos de Sistemas
-- developed by Rafael Corsi
-- file: tb_detectorDeMoedas.vhd
-- date: fev/2020

library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_detectorDeMoedas is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_detectorDeMoedas is


	component detectorDeMoedas is
    port (
      Q,D,N : in  STD_LOGIC;
      cents     : out STD_LOGIC_VECTOR(4 downto 0));
	end component;

  signal Q,D,N  : STD_LOGIC;
  signal cents :  STD_LOGIC_VECTOR(4 downto 0);

  -- Clock
  constant CLK_PERIOD : time := 1 ns;
  signal clk : STD_LOGIC := '0';

begin

  uMoedas : detectorDeMoedas port map(Q,D,N,cents);

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

    q <= '0'; D <= '0'; N <= '0';
    wait until clk='1' ;
    assert(cents = "00000")  report "0" severity error;

    q <= '0'; D <= '0'; N <= '1';
    wait until clk='1' ;
    assert(cents = "00101")  report "0" severity error;

    q <= '0'; D <= '1'; N <= '0';
    wait until clk='1' ;
    assert(cents = "01010")  report "0" severity error;

    q <= '1'; D <= '0'; N <= '0';
    wait until clk='1' ;
    assert(cents = "11001")  report "0" severity error;


    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
