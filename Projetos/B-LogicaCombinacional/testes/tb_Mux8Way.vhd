-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_Mux8Way.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_Mux8Way is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_Mux8Way is

  component Mux8Way is
    port (
      a:   in  STD_LOGIC;
      b:   in  STD_LOGIC;
      c:   in  STD_LOGIC;
      d:   in  STD_LOGIC;
      e:   in  STD_LOGIC;
      f:   in  STD_LOGIC;
      g:   in  STD_LOGIC;
      h:   in  STD_LOGIC;
      sel: in  STD_LOGIC_VECTOR(2 downto 0);
      q:   out STD_LOGIC);
  end component;

  signal inA, inB, inC, inD, inE, inF, inG, inH, outQ : STD_LOGIC;
  signal inSel : STD_LOGIC_VECTOR(2 downto 0);

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


  mapping: Mux8Way port map(inA, inB, inC, inD, inE, inF, inG, inH, inSel, outQ);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 1
    inA <= '1'; inB <= '0'; inC <='1'; inD <='0'; inE <= '1'; inF <= '0'; inG <='1'; inH<='0'; inSel<= "000";
    wait until clk='1';
    assert(outQ = '1')  report "Falha em teste: 1" severity error;

    -- Teste: 2
    inA <= '1'; inB <= '0'; inC <='1'; inD <='0'; inE <= '1'; inF <= '0'; inG <='1'; inH<='0'; inSel<= "001";
    wait until clk='1';
    assert(outQ = '0')  report "Falha em teste: 2" severity error;

    -- Teste: 3
    inA <= '1'; inB <= '0'; inC <='1'; inD <='0'; inE <= '1'; inF <= '0'; inG <='1'; inH<='0'; inSel<= "010";
    wait until clk='1';
    assert(outQ = '1')  report "Falha em teste: 3" severity error;

    -- Teste: 4
    inA <= '1'; inB <= '0'; inC <='1'; inD <='0'; inE <= '1'; inF <= '0'; inG <='1'; inH<='0'; inSel<= "011";
    wait until clk='1';
    assert(outQ = '0')  report "Falha em teste: 4" severity error;

    -- Teste: 5
    inA <= '1'; inB <= '0'; inC <='1'; inD <='0'; inE <= '1'; inF <= '0'; inG <='1'; inH<='0'; inSel<= "100";
    wait until clk='1';
    assert(outQ = '1')  report "Falha em teste: 5" severity error;

    -- Teste: 6
    inA <= '1'; inB <= '0'; inC <='1'; inD <='0'; inE <= '1'; inF <= '0'; inG <='1'; inH<='0'; inSel<= "101";
    wait until clk='1';
    assert(outQ = '0')  report "Falha em teste: 6" severity error;

    -- Teste: 7
    inA <= '1'; inB <= '0'; inC <='1'; inD <='0'; inE <= '1'; inF <= '0'; inG <='1'; inH<='0'; inSel<= "110";
    wait until clk='1';
    assert(outQ = '1')  report "Falha em teste: 7" severity error;

    -- Teste: 8
    inA <= '1'; inB <= '0'; inC <='1'; inD <='0'; inE <= '1'; inF <= '0'; inG <='1'; inH<='0'; inSel<= "111";
    wait until clk='1';
    assert(outQ = '0')  report "Falha em teste: 8" severity error;

    -- Teste: 9
    inA <= '0'; inB <= '1'; inC <='0'; inD <='1'; inE <= '0'; inF <= '1'; inG <='0'; inH<='1'; inSel<= "000";
    wait until clk='1';
    assert(outQ = '0')  report "Falha em teste: 9" severity error;

    -- Teste: 10
    inA <= '0'; inB <= '1'; inC <='0'; inD <='1'; inE <= '0'; inF <= '1'; inG <='0'; inH<='1'; inSel<= "001";
    wait until clk='1';
    assert(outQ = '1')  report "Falha em teste: 10" severity error;

    -- Teste: 11
    inA <= '0'; inB <= '1'; inC <='0'; inD <='1'; inE <= '0'; inF <= '1'; inG <='0'; inH<='1'; inSel<= "010";
    wait until clk='1';
    assert(outQ = '0')  report "Falha em teste: 11" severity error;

    -- Teste: 12
    inA <= '0'; inB <= '1'; inC <='0'; inD <='1'; inE <= '0'; inF <= '1'; inG <='0'; inH<='1'; inSel<= "011";
    wait until clk='1';
    assert(outQ = '1')  report "Falha em teste: 12" severity error;

    -- Teste: 13
    inA <= '0'; inB <= '1'; inC <='0'; inD <='1'; inE <= '0'; inF <= '1'; inG <='0'; inH<='1'; inSel<= "100";
    wait until clk='1';
    assert(outQ = '0')  report "Falha em teste: 13" severity error;

    -- Teste: 14
    inA <= '0'; inB <= '1'; inC <='0'; inD <='1'; inE <= '0'; inF <= '1'; inG <='0'; inH<='1'; inSel<= "101";
    wait until clk='1';
    assert(outQ = '1')  report "Falha em teste: 14" severity error;

    -- Teste: 15
    inA <= '0'; inB <= '1'; inC <='0'; inD <='1'; inE <= '0'; inF <= '1'; inG <='0'; inH<='1'; inSel<= "110";
    wait until clk='1';
    assert(outQ = '0')  report "Falha em teste: 15" severity error;

    -- Teste: 16
    inA <= '0'; inB <= '1'; inC <='0'; inD <='1'; inE <= '0'; inF <= '1'; inG <='0'; inH<='1'; inSel<= "111";
    wait until clk='1';
    assert(outQ = '1')  report "Falha em teste: 16" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
