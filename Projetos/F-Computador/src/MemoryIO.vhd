library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryIO is

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

        -- I/Os
        SW  : in std_logic_vector(9 downto 0);
        LED : OUT std_logic_vector(9 downto 0)

		);
end entity;


ARCHITECTURE logic OF MemoryIO IS

  component Screen is
      PORT(
          INPUT        : IN STD_LOGIC_VECTOR(15 downto 0);
          LOAD         : IN  STD_LOGIC;
          ADDRESS      : IN STD_LOGIC_VECTOR(13 downto 0);
          LCD_INIT_OK  : OUT STD_LOGIC;

          -- Sistema
          CLK_FAST : IN  STD_LOGIC;
          CLK_SLOW : IN  STD_LOGIC;
          RST 	   : IN  STD_LOGIC;

          -- LCD EXTERNAL I/OS
          LCD_CS_N     : OUT   STD_LOGIC;
          LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
          LCD_RD_N     : OUT   STD_LOGIC;
          LCD_RESET_N  : OUT   STD_LOGIC;
          LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
          LCD_WR_N     : OUT   STD_LOGIC
          );
  end component;

  component RAM16K IS
      PORT
      (
          address	: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
          clock		: IN STD_LOGIC  := '1';
          data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
          wren		: IN STD_LOGIC ;
          q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
      );
  end component;

  component Mux4Way16 is
      Port (    sel : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
                a   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
                b   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
                c   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
                d   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
                q   : out STD_LOGIC_VECTOR (15 downto 0));    -- output
  end component;

  component Register16 is
    port(
      clock:   in STD_LOGIC;
      input:   in STD_LOGIC_VECTOR(15 downto 0);
      load:    in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  SIGNAL LOAD_RAM         : STD_LOGIC := '0';
  SIGNAL LOAD_DISPLAY     : STD_LOGIC := '0';
  SIGNAL LOAD_LED         : STD_LOGIC := '0';

  SIGNAL OUTPUT_RAM       : STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL SW16 : STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL LED16 : STD_LOGIC_VECTOR(15 downto 0);

BEGIN

  RAM: RAM16K
    PORT MAP(
      address => ADDRESS(13 downto 0),
      clock		=> CLK_FAST,
      data		=> INPUT,
      wren		=> LOAD_RAM,
      q		    => OUTPUT_RAM
      );

    DISPLAY: Screen  port map (
             RST          => RST,
             CLK_FAST     => CLK_FAST,
             CLK_SLOW     => CLK_SLOW,

             INPUT        => INPUT,
             LOAD         => LOAD_DISPLAY,
             ADDRESS      => ADDRESS(13 downto 0),
             LCD_INIT_OK  => LCD_INIT_OK,

             LCD_CS_N 	  => LCD_CS_N ,
             LCD_D 		    => LCD_D,
             LCD_RD_N 	  => LCD_RD_N,
             LCD_RESET_N  => LCD_RESET_N,
             LCD_RS 	    => LCD_RS,
             LCD_WR_N 	  => LCD_WR_N
    );

    reg:  Register16
      port map(
        clock => CLK_SLOW,
        input => INPUT,
        load  => LOAD_LED,
        output => LED16
        );

    ----------------------------------------
    -- Controla LOAD do display e da ram e LED ! --
    ----------------------------------------
    --LOAD_DISPLAY <= ??????; 
    --LOAD_RAM     <= ??????; 
    --LOAD_LED     <= ??????; 

    ----------------------------------------
    -- SW e LED                           --
    ----------------------------------------
    -- Compatibilidade de tamanho
    LED <= LED16(9 downto 0);

    -- Compatibilidade de tamanho
    SW16(15 downto 10) <= (others => '0');
    SW16( 9 DOWNTO  0) <= SW;

    ----------------------------------------
    -- SAIDA do memory I/O                --
    ----------------------------------------
    -- precisar ser: RAM ou SW16
    -- OUTPUT <= ?????? ;


END logic;
