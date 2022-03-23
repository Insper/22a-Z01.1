-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_Mux16.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_Mux16 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_Mux16 is

  component Mux16 is
    port (
      a:   in  STD_LOGIC_VECTOR(15 downto 0);
      b:   in  STD_LOGIC_VECTOR(15 downto 0);
      sel: in  STD_LOGIC;
      q:   out STD_LOGIC_VECTOR(15 downto 0));
  end component;

  signal  inA, inB, outQ : STD_LOGIC_VECTOR(15 downto 0);
  signal  inSel : STD_LOGIC;

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



  mapping: Mux16 port map(inA, inB, inSel, outQ);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 1
    inA <= "1111000011110000"; inB <= "0000000000000000"; inSel <= '0';
    wait until clk='1';
    assert(outQ = "1111000011110000")  report "Falha em teste: 1" severity error;

    -- Teste: 2
    inA <= "0000000000000000"; inB <= "1111000011110000"; inSel <= '1';
    wait until clk='1';
    assert(outQ = "1111000011110000")  report "Falha em teste: 2" severity error;

    -- Teste: 3
    inA <= "1111000011110000"; inB <= "0000000000000000"; inSel <= '1';
    wait until clk='1';
    assert(outQ = "0000000000000000")  report "Falha em teste: 3" severity error;

    -- Teste: 4
    inA <= "0000000000000000"; inB <= "1111000011110000"; inSel <= '0';
    wait until clk='1';
    assert(outQ = "0000000000000000")  report "Falha em teste: 4" severity error;


    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
