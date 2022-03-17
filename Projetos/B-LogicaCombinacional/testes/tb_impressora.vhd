-- Elementos de Sistemas
-- developed by Rafael Corsi
-- file: tb_impressora.vhd
-- date: fev/2020

library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_impressora is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_impressora is

	component impressora is
    port (
      sw1,sw2,sw3,sw4 : in  STD_LOGIC;
      x     : out STD_LOGIC);
	end component;

  signal sw1,sw2,sw3,sw4, x : STD_LOGIC;

  -- Clock
  constant CLK_PERIOD : time := 1 ns;
  signal clk : STD_LOGIC := '0';

begin

  uMoedas : impressora port map(sw1,sw2,sw3,sw4,x);

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

    sw1 <= '0'; sw2 <= '0'; sw3 <= '0'; sw4 <= '1';
    wait until clk='1' ;
    assert(x = '1')  report "0" severity error;

    sw1 <= '1'; sw2 <= '0'; sw3 <= '0'; sw4 <= '1';
    wait until clk='1' ;
    assert(x = '1')  report "0" severity error;

    sw1 <= '1'; sw2 <= '1'; sw3 <= '0'; sw4 <= '0';
    wait until clk='1' ;
    assert(x = '1')  report "0" severity error;

    sw1 <= '0'; sw2 <= '1'; sw3 <= '0'; sw4 <= '0';
    wait until clk='1' ;
    assert(x = '1')  report "0" severity error;

    sw1 <= '0'; sw2 <= '1'; sw3 <= '1'; sw4 <= '1';
    wait until clk='1' ;
    assert(x = '0')  report "0" severity error;

    sw1 <= '0'; sw2 <= '0'; sw3 <= '1'; sw4 <= '0';
    wait until clk='1' ;
    assert(x = '1')  report "0" severity error;

    sw1 <= '1'; sw2 <= '1'; sw3 <= '1'; sw4 <= '1';
    wait until clk='1' ;
    assert(x = '0')  report "0" severity error;


    wait until clk='1' ;
    assert(x = '0')  report "0" severity error;



    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
