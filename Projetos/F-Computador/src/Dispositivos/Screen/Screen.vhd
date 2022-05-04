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

  LCD_INIT_OK <= INIT_OK;

  LCD: ILI9341
  generic map(
      CLK_FREQ => 100000000
  )
  port map (
    CLK         => CLK_FAST,
    RST         => RST,
    PX_X        => STD_LOGIC_VECTOR(PX_X),
    PX_Y        => STD_LOGIC_VECTOR(PX_Y),
    PX_COLOR 		=> PX_COLOR,
    PX_EN 			=> PX_EN,
    PX_RDY      => PX_RDY,
    LCD_INIT_OK => INIT_OK,
    LCD_CS_N 		=> LCD_CS_N ,
    LCD_D 			=> LCD_D,
    LCD_RD_N 		=> LCD_RD_N,
    LCD_RESET_N => LCD_RESET_N,
    LCD_RS 	    => LCD_RS,
    LCD_WR_N 		=> LCD_WR_N
    );

  FIFO16x4096_inst : FIFO16x4096 PORT MAP (
    data	  => fifo_data,
    wrclk	  => CLK_SLOW,
    wrreq	  => LOAD,
    rdclk	  => CLK_FAST,
    rdreq	  => fifo_rdreq,
    q	      => fifo_q,
    rdempty	=> fifo_rdempty,
    wrfull	=> fifo_wfull
	);

----Testing
----Deve criar uma linha no LCD
--process (CLK_FAST)
--begin
--    if( rising_edge(CLK_FAST)) then
--        if(rst = '1') then
--            PX_Y <= (others => '0');
--            PX_X <= (others => '0');
--        else
--            if(PX_RDY = '1' and INIT_OK = '1') then
--                --PX_X <= PX_X + x"0001";
--                PX_X <= x"001F";
--                PX_Y <= PX_Y + x"0001";
--                PX_EN <= '1';
--            else
--                PX_EN <= '0';
--            end if;
--        end if;
--    end if;
--end process;

-- FIFO organizada
-- 31 -------------------- 16 15--------- 2 1 0
-- |     Pixel             |  | ADDRESS   | 0 0 |
-------------------------------------------------
  fifo_q_addr            <= fifo_q(15 downto 2);
  fifo_q_pxs             <= fifo_q(31 downto 16);
  fifo_data(31 downto 16)<= INPUT;
  fifo_data(15 downto 2) <= ADDRESS;
  fifo_data(1 downto 0)  <= "00";

process (CLK_FAST)
    variable pixel : integer := 0;
begin
  if(rising_edge(CLK_FAST)) then
    if(RST = '1') then
      state <= s_waitData;
      pixel := 0;
      PX_EN <= '0';
    else
      case state is

        when s_waitData =>
          pixel := 0;
          PX_EN <= '0';
          if((fifo_rdempty = '0') AND (INIT_OK = '1') ) then 
            state      <= s_load;
            fifo_rdreq <= '1';
          else
            state <= s_waitData;
          end if;

        when s_load =>
          fifo_rdreq <= '0';
          state      <= s_pxUpdate;

        when s_pxUpdate =>
          if(pixel < 16) then
            if(fifo_q_pxs(pixel) = '1') then
              PX_COLOR <= "0000000000000000"; -- PRETO
            else
              PX_COLOR <= "1111111111111111"; -- Branco
            end if;
            PX_Y  <= "0000000000000000" + ((to_integer(unsigned(fifo_q_addr)) mod 20) * 16) + pixel;
            PX_X  <= "0000000011101111" - (to_integer(unsigned(fifo_q_addr)) / 20);
            if(PX_RDY = '1') then
              PX_EN <= '1';
              pixel := pixel + 1;
              state <= s_pxWrite;
            else
              PX_EN <= '0';
              state <= s_pxUpdate;
            end if;
          else
            pixel := 0;
            state <= s_waitData;
          end if;

        when s_pxWrite =>
          PX_EN <= '0';
          state <= s_pxUpdate;

        when others =>
          state <= s_waitData;

      end case;
    end if;
  end if;
end process;

END logic;
