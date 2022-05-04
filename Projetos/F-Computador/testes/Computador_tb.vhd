-------------------------------------------------------------------
-- Elementos de Sistemas
-------------------------------------------------------------------
-- Rafael Corsi
-------------------------------------------------------------------
-- Descricao :
-- Entidade central do desenvolvimento do computador
-------------------------------------------------------------------
-- Historico:
--  29/11/2016 : Criacao do projeto
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Computador_tb is
end entity;

ARCHITECTURE rtl OF Computador_tb IS

  component Computador  is 
  generic(
        IS_SIMULATION : std_logic
   );
  port(
    -- Sistema
    CLOCK_50   : IN    STD_LOGIC;
    RESET_N      : IN    STD_LOGIC;
		LEDR         : OUT   STD_LOGIC_VECTOR(9 DOWNTO 0);
		SW           : IN    STD_LOGIC_VECTOR(9 DOWNTO 0);

    -- LCD EXTERNAL I/OS
    LCD_CS_N     : OUT   STD_LOGIC;
    LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
    LCD_RD_N     : OUT   STD_LOGIC;
    LCD_RESET_N  : OUT   STD_LOGIC;
    LCD_RS       : OUT   STD_LOGIC;	      -- (DCx) 0 : reg, 1: command
    LCD_WR_N     : OUT   STD_LOGIC;
		LCD_ON       : OUT   STD_LOGIC	-- liga e desliga o LCD

		-- Tecl => key_clk      : IN    STD_LOGIC;         -- clock signal from PS/2 keyboard
    );
  end component;

  signal reset_n : std_logic := '0';
  signal clock_fast   : std_logic := '0';

begin

  clock_fast <= not clock_fast after 1 ns;

  process
  begin
    reset_n <= '0';
    wait for 5 ns;
    reset_n <= '1';
    wait;
  end process;

  c1 : Computador 
  generic map(
    IS_SIMULATION => '1'
  )
  port map (
    CLOCK_50    => clock_fast,
    RESET_N     => reset_n,
    LEDR        => open,
    SW          => "0000000000",
    LCD_CS_N    => open,
    LCD_D       => open,
    LCD_RD_N    => open,
    LCD_RESET_N => open,
    LCD_RS      => open,
    LCD_WR_N    => open,
    LCD_on      => open
    );

end             rtl;
