-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_comparador16.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_comparador16 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_comparador16 is

component comparador16 is
  port(
    a   : in STD_LOGIC_VECTOR(15 downto 0);
    zr   : out STD_LOGIC;
    ng   : out STD_LOGIC
    );
end component;

   signal  a   : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal  clk, zr,ng : STD_LOGIC := '0';

begin

	cmp16: comparador16 port map(a, zr, ng);

  clock : process
  begin
    clk <= not clk;
    wait for 10 ns;
  end process;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);
    wait until clk'event and clk='1';
    a <= x"0000";
    wait until clk'event and clk='1';
    assert(zr = '1') report "zr não é 0 quando a=0000";
    assert(ng = '0') report "ng não é 0 quando a=0000";
    wait until clk'event and clk='1';
    a <= x"8000";
    wait until clk'event and clk='1';
    assert(zr = '0') report "zr não é 0 quando a=8000";
    assert(ng = '1') report "ng não é 0 quando a=8000";
    a <= x"5555";
    wait until clk'event and clk='1';
    assert(zr = '0') report "zr não é 0 quando a=5555";
    assert(ng = '0') report "ng não é 0 quando a=8555";

    --wait for 200 ps;
    --  assert(outQ = "1010101010101010")  report "Falha em teste: 6" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
