library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity Screen is

   PORT(
        --Display
        INPUT        : IN  STD_LOGIC_VECTOR(15 downto 0);
        LOAD         : IN  STD_LOGIC;
        ADDRESS      : IN  STD_LOGIC_VECTOR(13 downto 0);
        LCD_INIT_OK  : OUT STD_LOGIC;

        -- Sistema
        CLK_SLOW     : IN  STD_LOGIC;
        CLK_FAST     : IN  STD_LOGIC;
        RST          : IN  STD_LOGIC;
        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC
       );
end entity;


ARCHITECTURE logic OF Screen IS

component ILI9341 is
   GENERIC(CLK_FREQ : NATURAL := 1000000);
   PORT(
        -- Sistema
        CLK : IN  STD_LOGIC;
        RST : IN  STD_LOGIC;

        -- LCD CONTROL INTERFACE
        PX_X        : IN STD_LOGIC_VECTOR(15 downto 0);
        PX_Y        : IN STD_LOGIC_VECTOR(15 downto 0);
        PX_COLOR    : IN STD_LOGIC_VECTOR(15 downto 0);
        PX_EN       : IN STD_LOGIC;
        PX_RDY      : OUT STD_LOGIC;
        LCD_INIT_OK : OUT STD_LOGIC;

        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC

       );
end component;

component FIFO16x4096 IS
	PORT
	(
		data	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		rdclk	: IN STD_LOGIC ;
		rdreq	: IN STD_LOGIC ;
		wrclk	: IN STD_LOGIC ;
		wrreq	: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		rdempty	: OUT STD_LOGIC ;
		wrfull	: OUT STD_LOGIC
	);
END component;

SIGNAL PX_X     : UNSIGNED(15 downto 0) := x"0000"; -- pixel X (0..239)
SIGNAL PX_Y     : UNSIGNED(15 downto 0) := x"0000"; -- pixel y (0..319)
SIGNAL PX_COLOR : STD_LOGIC_VECTOR(15 downto 0) := x"0000";
SIGNAL PX_EN    : STD_LOGIC :='0';
SIGNAL PX_RDY   : STD_LOGIC;
SIGNAL INIT_OK  : STD_LOGIC;
SIGNAL FLAG 	  : STD_LOGIC := '1';
SIGNAL LOCKED   : STD_LOGIC; -- 0 not ok, 1 ok

signal fifo_data   : std_logic_vector(31 downto 0);
signal fifo_q      : std_logic_vector(31 downto 0);
signal fifo_q_addr : std_logic_vector(13 downto 0);
signal fifo_q_pxs  : std_logic_vector(15 downto 0);
signal fifo_rdreq  : std_logic;
signal fifo_rdempty: std_logic;
signal fifo_wfull  : std_logic;

TYPE State_type IS (s_waitData, s_load, s_pxUpdate, s_pxWrite);  -- Define the states
SIGNAL state : State_Type;    -- Create a signal that uses

BEGIN

process
begin
  LCD_INIT_OK  <= '0';
  wait until clk_slow = '0';
  LCD_INIT_OK  <= '1';
  wait ;
end process;


process(CLK_FAST)
begin
  if(rising_edge(CLK_FAST)) then
     if (LOAD = '1') then
        LCD_D <= input;
      end IF;
  end if;
end process;

END logic;
