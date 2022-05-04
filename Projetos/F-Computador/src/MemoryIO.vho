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

        -- Switchs  
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

  component RAM32K IS
      PORT
      (
          address	: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
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

  SIGNAL LOAD_RAM         : STD_LOGIC := '0';
  SIGNAL LOAD_DISPLAY     : STD_LOGIC := '0';

  SIGNAL OUTPUT_RAM       : STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL OUTPUT_DISPLAY   : STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL MUX_SEL          : STD_LOGIC_VECTOR(1 downto 0);
  SIGNAL MUX_SEL1         : STD_LOGIC;
  SIGNAL MUX_SEL2         : STD_LOGIC;
  SIGNAL KEY              : STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL s_key_code       : STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL s_key_new        : STD_LOGIC;

	SIGNAL RST_INTERNAL     : STD_LOGIC := '1';

	SIGNAL INPUT_INTERNAL   : STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL ADDRESS_INTERNAL : STD_LOGIC_VECTOR(14 downto 0);

	SIGNAL LOAD_SCREEN      : STD_LOGIC := '0';
	SIGNAL INPUT_SCREEN     : STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL ADDRESS_SCREEN   : STD_LOGIC_VECTOR(14 downto 0);

	SIGNAL SW16 : STD_LOGIC_VECTOR(15 downto 0);

BEGIN


    RAM: RAM32K
       PORT MAP(
            address => ADDRESS,
            clock		=> CLK_FAST,
            data		=> INPUT,
            wren		=> LOAD,
            q		    => OUTPUT
    );

   

END logic;
