-------------------------------------------------------------------
-- Elementos de Sistemas
-------------------------------------------------------------------
-- Luciano Pereira
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


entity Computador is
   generic(
        IS_SIMULATION : std_logic := '1'
   );
   port(
        -- Sistema
        CLOCK_50     : in    std_logic;
        RESET_N      : in    std_logic;
        LEDR         : out   std_logic_vector(9 downto 0);
        SW           : in    std_logic_vector(9 downto 0);

        -- LCD EXTERNAL I/OS
        LCD_CS_N     : out   std_logic;
        LCD_D        : inout std_logic_vector(15 downto 0);
        LCD_RD_N     : out   std_logic;
        LCD_RESET_N  : out   std_logic;
        LCD_RS       : out   std_logic;	      -- (DCx) 0 : reg, 1: command
        LCD_WR_N     : out   std_logic;
        LCD_ON       : out   std_logic	-- liga e desliga o LCD


       );
end entity;


architecture logic of Computador is

	component CPU is
		 port(
			  clock       :	in  std_logic;
			  inM         : in  std_logic_vector(15 downto 0);
			  instruction : in  std_logic_vector(17 downto 0);
			  reset       : in  std_logic;
			  outM        : out std_logic_vector(15 downto 0);
			  writeM      : out std_logic;
			  addressM    : out std_logic_vector(14 downto 0);
			  pcout       : out std_logic_vector(14 downto 0)
	  );
	end component;

	component ROM32K is
		port(
			address	  : in std_logic_vector (14 downto 0);
			clock	    : in std_logic  := '1';
			q		      : out std_logic_vector (17 downto 0)
		);
	end component;

	component MemoryIO is
		port(
			  -- Sistema
        CLK_SLOW : in  std_logic;
        CLK_FAST : in  std_logic;
			  RST      : in  std_logic;

			  -- RAM 16K
			  ADDRESS		  : in std_logic_vector (14 downto 0);
			  INPUT			  : in std_logic_vector (15 downto 0);
			  LOAD			  : in std_logic ;
			  OUTPUT	    : out std_logic_vector (15 downto 0);

			  -- LCD EXTERNAL I/OS
			  LCD_CS_N     : out   std_logic;
			  LCD_D        : inout std_logic_vector(15 downto 0);
			  LCD_RD_N     : out   std_logic;
			  LCD_RESET_N  : out   std_logic;
			  LCD_RS       : out   std_logic;	-- (DCx) 0 : reg, 1: command
			  LCD_WR_N     : out   std_logic;
			  LCD_ON       : out   std_logic;
			  LCD_INIT_OK  : out   std_logic;

			  SW  : in std_logic_vector(9 downto 0);
			  LED : out std_logic_vector(9 downto 0)
			 );
	end component;

	component PLL is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic;        -- clk
			outclk_1 : out std_logic;        -- clk
			locked   : out std_logic         -- export
		);
  end component;

  signal INPUT        : std_logic_vector(15 downto 0) := "1111111111111111";
  signal ADDRESS      : std_logic_vector(14 downto 0) := (others => '0') ; -- meio 00100101101010
  signal LOAD         : std_logic := '0';
  signal LCD_INIT_OK  : std_logic;

  signal CLK_FAST           : std_logic;
  signal CLK_SLOW           : std_logic;
  signal RST_CPU, RST_MEM   : std_logic := '1';
  signal RESET              : std_logic;
  signal PLL_LOCKED         : std_logic;

  signal OUTPUT_RAM   : std_logic_vector(15 downto 0);
  signal INSTRUCTION  : std_logic_vector(17 downto 0);
  signal PC           : std_logic_vector(14 downto 0);

  signal S_key_code   : std_logic_vector(6 downto 0);
  signal S_key_new    : std_logic;

  signal sync_intruction: std_logic_vector(17 downto 0) := (others => '0');

begin


--PLL_RTL: if (IS_SIMULATION = '0') generate
	PLL_inst : PLL port map (
    refclk   => CLOCK_50,
    rst      => RESET,
    outclk_0 => CLK_FAST,
    outclk_1 => CLK_SLOW,
    locked   => PLL_LOCKED
    );
--end generate;

--PLL_SIM: if (IS_SIMULATION = '1') generate
--    CLK_FAST <= CLOCK_50;
--    CLK_SLOW <= CLOCK_50;
--    PLL_LOCKED <= '1';
--end generate;

MAIN_CPU : CPU port map (
    clock       => CLK_SLOW,
    inM         => OUTPUT_RAM,
    instruction => instruction,
    reset       => RST_CPU,
    outM        => INPUT,
    writeM      => LOAD,
    addressM    => ADDRESS,
    pcout       => PC
	);

ROM : ROM32K port map (
    address	=> PC(14 downto 0),
    clock	  => CLK_FAST,
    q		    => INSTRUCTION
    );

MEMORY_MAPED : MemoryIO port map (
    CLK_FAST    => CLK_FAST,
    CLK_SLOW    => CLK_SLOW,
    RST         => RST_MEM,
    ADDRESS		  => ADDRESS,
    INPUT       => INPUT,
    LOAD        => LOAD,
    OUTPUT		  => OUTPUT_RAM,
    LCD_INIT_OK => LCD_INIT_OK,
    LCD_CS_N 	  => LCD_CS_N ,
    LCD_D 		  => LCD_D,
    LCD_RD_N 	  => LCD_RD_N,
    LCD_RESET_N => LCD_RESET_N,
    LCD_RS 		  => LCD_RS,
    LCD_WR_N 	  => LCD_WR_N,
    SW          => SW,
    LED         => LEDR
   );

  -- Resets
--RST_RTL: if (IS_SIMULATION = '0') generate
-- RST_CPU <= RESET or (not LCD_INIT_OK) or (not PLL_LOCKED);
-- RST_MEM <= RESET or (not PLL_LOCKED);
-- RESET   <= not RESET_N;
--end generate;
--
--RST_SIM: if (IS_SIMULATION = '1') generate
  RST_CPU <= RESET or (not PLL_LOCKED);
  RST_MEM <= RESET or (not PLL_LOCKED);
  RESET   <= not RESET_N;
--end generate;

 -- LEDR(0) <= RST_CPU;
 -- LEDR(1) <= RST_MEM;
 -- LEDR(2) <= RESET;
 -- LEDR(3) <= PLL_LOCKED;
 -- LEDR(4) <= LCD_INIT_OK;

  -- LCD on
  LCD_ON <= '1';

end logic;
