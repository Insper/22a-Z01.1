-- Elementos de Sistemas
-- developed by Luciano Soares
-- 1 tb_ControlUnit.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_MemoryIO is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_MemoryIO is

component MemoryIO is
   PORT(
        -- Sistema
        CLK_SLOW : IN  STD_LOGIC;
        CLK_FAST : IN  STD_LOGIC;
        RST      : IN  STD_LOGIC;

        -- RAM 16K
        ADDRESS		: IN  STD_LOGIC_VECTOR (14 DOWNTO 0);
        INPUT		: IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
        LOAD		: IN  STD_LOGIC ;
        OUTPUT		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC;
        LCD_ON       : OUT   STD_LOGIC := '1';	-- liga e desliga o LCD
        LCD_INIT_OK  : OUT   STD_LOGIC;

        -- Switchs
        SW  : in std_logic_vector(9 downto 0);
        LED : OUT std_logic_vector(9 downto 0)
		);
end component;

signal clk_slow : std_logic := '0';
signal clk_fast : std_logic := '0';
signal rst      : std_logic := '0';
signal address  : std_logic_vector(14 downto 0) ;
signal input,lcd_d		: std_logic_vector (15 downto 0);
signal load		  : std_logic := '0' ;
signal output		: std_logic_vector (15 downto 0);
signal sw       : std_logic_vector(9 downto 0);
signal led      : std_logic_vector(9 downto 0);

begin

  u1 : MemoryIO port map(
          CLK_SLOW    => clk_slow,
          CLK_FAST    => clk_fast,
          RST         => rst,
          ADDRESS     => address,
          INPUT       => input,
          LOAD        => load,
          OUTPUT      => output,
          LCD_CS_N    => open,
          LCD_D       => lcd_d,
          LCD_RD_N    => open,
          LCD_RESET_N => open,
          LCD_RS      => open,
          LCD_WR_N    => open,
          LCD_ON      => open,
          LCD_INIT_OK => open,
          SW          => sw,
          LED         => led
   );

 	clk_slow <= not clk_slow after 1000 ps;
 	clk_fast <= not clk_fast after 100 ps;

  main : process
    begin
    test_runner_setup(runner, runner_cfg);

    rst <= '1';
    wait for 1 ns;
    rst <= '0';

		-- Teste: A  - RAM endereço 0
    address <= (others => '0');
    input   <= x"A5A5";
    load    <= '1';
    wait until clk_slow = '1';
    input <= x"0000";
    load  <= '0';
		assert(output = x"A5A5")
      report "Falha em RAM[0] = xA5A5" severity error;

		-- Teste: A  - RAM endereço 8192 (meiop)
    address <= std_logic_vector(to_unsigned(8192, 15));
    input   <= x"AAA3";
    load    <= '1';
    wait until clk_slow = '1';
    input <= x"0000";
    load  <= '0';
		assert(output = x"AAA3")
      report "Falha em RAM[8192] = xAAA3" severity error;

   	-- Teste: A  - RAM endereço 16383
    address <= std_logic_vector(to_unsigned(16383, 15));
    input   <= x"5A5A";
    load    <= '1';
    wait until clk_slow = '1';
    input <= x"0000";
    load  <= '0';
		assert(output = x"5A5A")
      report "Falha em RAM[16383] = x5A5A" severity error;

   	-- Teste: B - SW
    address <= std_logic_vector(to_unsigned(21185, 15));
    sw      <= "1010101010";
    input   <= x"5A5A";
    load    <= '0';
    wait until clk_slow = '1';
		assert(output(9 downto 0) = "1010101010")
      report "Falha em ler a chave SW" severity error;

    -- Teste: B - SW
    address <= std_logic_vector(to_unsigned(21185, 15));
    sw      <= "1010101111";
    input   <= x"5A5A";
    load    <= '0';
    wait until clk_slow = '1';
		assert(output(9 downto 0) = "1010101111")
      report "Falha em ler a chave SW" severity error;

   	-- Teste: C - LED
    address <= std_logic_vector(to_unsigned(21184, 15));
    input(9 downto 0)   <= "1111000010";
    input(15 downto 10) <= (others => '0');
    load    <= '1';
    wait until clk_slow = '1'; -- registro
    wait until clk_slow = '1';
    wait until clk_slow = '1';
		assert(led = "1111000010")
      report "Falha em escrever no LED" severity error;

    -- Teste: C - LED
    address <= std_logic_vector(to_unsigned(21184, 15));
    input(9 downto 0)   <= "0000111101";
    input(15 downto 10) <= (others => '0');
    load    <= '1';
    wait until clk_slow = '1';
    wait until clk_slow = '1';
    wait until clk_slow = '1';
		assert(led = "0000111101")
      report "Falha em escrever no LED" severity error;

    -- Teste: LCD
    address <= std_logic_vector(to_unsigned(16384, 15));
    input   <= x"A5A5";
    load    <= '1';
    wait until clk_slow = '1';
    wait until clk_slow = '1';
		assert(lcd_d = input)
      report "Falha em escrever no LCD" severity error;
    load    <= '0';

    wait until clk_slow = '1';
    address <= std_logic_vector(to_unsigned(21183, 15));
    input   <= x"5A5A";
    load    <= '1';
    wait until clk_slow = '1';
    wait until clk_slow = '1';
		assert(lcd_d = input)
      report "Falha em escrever no LCD" severity error;
    load    <= '0';


    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
