-------------------------------------------------------------------------------
-- Insper 
-- 	Computacao - Elementos de Sistemas
------------------------------------------
--
-- Luciano Pereira
-- Rafael Corsi
--
-------------------------------------------------------------------------------
-- Descricao :
--    
-- Máquina de estados para inicializacao do driver de LCD ILI9341
--
-- Historico:
--   
--  17/10/2016 : Criacao do projeto
--  
--
--------------------------------------------------------------------------------

---------------
-- Bibliotecas
---------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity ILI9341 is
   GENERIC(
        CLK_FREQ : NATURAL := 10000000
    );
   PORT(
        -- Sistema
        CLK : IN  STD_LOGIC;
        RST : IN  STD_LOGIC;

        -- LCD CONTROL INTERFACE
        PX_X    : IN  STD_LOGIC_VECTOR(15 downto 0);
        PX_Y    : IN  STD_LOGIC_VECTOR(15 downto 0);
        PX_COLOR: IN  STD_LOGIC_VECTOR(15 downto 0);
        PX_EN   : IN  STD_LOGIC;
        PX_RDY  : OUT STD_LOGIC;
         
        LCD_INIT_OK : OUT STD_LOGIC;
        
        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;	
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC := '1';	
        LCD_RESET_N  : OUT   STD_LOGIC := '0';	
        LCD_RS       : OUT   STD_LOGIC := '0';	-- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC := '1'	
       );
end entity;
 
ARCHITECTURE rtl OF ILI9341 IS

   -----------
   -- Data      : RS = 1
   -- Register  : RS = 0
   --
   --
   CONSTANT lcdInitDataSize : NATURAL := 71; 
   TYPE mem IS ARRAY ( 0 TO lcdInitDataSize) OF std_logic_vector(16 downto 0);
   CONSTANT lcdInitData : mem := (
    0  => '0' & x"0011",
    1  => '0' & x"00CF",
    2  => '1' & x"0000",
    3  => '1' & x"0081",
    4  => '1' & x"00C0",
    5  => '0' & x"00ED",
    6  => '1' & x"0064",
    7  => '1' & x"0003",
    8  => '1' & x"0012",
    9  => '1' & x"0081",
    10 => '0' & x"00E8",
    11 => '1' & x"0085",
    12 => '1' & x"0001",
    13 => '1' & x"0798",
    14 => '0' & x"00CB",
    15 => '1' & x"0039",
    16 => '1' & x"002C",
    17 => '1' & x"0000",
    18 => '1' & x"0034",
    19 => '1' & x"0002",
    20 => '0' & x"00F7",
    21 => '1' & x"0020",
    22 => '0' & x"00EA",
    23 => '1' & x"0000",
    24 => '1' & x"0000",
    25 => '0' & x"00B1",
    26 => '1' & x"0000",
    27 => '1' & x"001B",
    28 => '0' & x"00B6",
    29 => '1' & x"000A",
    30 => '1' & x"00A2",
    31 => '0' & x"00C0", 
    32 => '1' & x"0005",
    33 => '0' & x"00C1", 
    34 => '1' & x"0011",
    35 => '0' & x"00C5", 
    36 => '1' & x"0045",
    37 => '1' & x"0045",
    38 => '0' & x"00C7",
    39 => '1' & x"00A2",
    40 => '0' & x"0036",
    41 => '1' & x"0008",
    42 => '0' & x"00F2", 
    43 => '1' & x"0000",
    44 => '0' & x"0026",
    45 => '1' & x"0001",
    46 => '0' & x"002A",
    47 => '1' & x"0000",
    48 => '1' & x"0000",
    49 => '1' & x"0000", 
    50 => '1' & x"00EF",
    51 => '0' & x"002B",
    52 => '1' & x"0000",
    53 => '1' & x"0000",
    54 => '1' & x"0001",
    55 => '1' & x"003F",
    56 => '0' & x"003A",
    57 => '1' & x"0055",
    58 => '0' & x"00F6", 
    59 => '1' & x"0001",
    60 => '1' & x"0030",
    61 => '1' & x"0000",
    62 => '0' & x"0029",
    63 => '0' & x"002C",
    ----- set cursor at 0,0
    64 => '0' & x"002A",-- x
    65 => '1' & x"0000", 
    66 => '1' & x"0000", 
    67 => '1' & x"002B", -- y	
    68 => '1' & x"0000", 
    69 => '1' & x"0000", 
    70 => '0' & x"002C",
    71 => '0' & x"002C"	
    );

   TYPE   STATE_TYPE IS (s0, s1, s2, s3, s3n, s3m, c1, c2, c3,
			 s4, s5, s6, s6d, s7, s7d, s8, s8d, s9,
			 s9d, s10, s10d, s11, s11d, s12, s12d ,
 			 s13, s13d, s14, s14d, s15, s15d);
   SIGNAL state   : STATE_TYPE;

   SIGNAL   delay_en     : std_logic;
   SIGNAL   delay        : std_logic;
   CONSTANT CLK_1MS      : NATURAL := CLK_FREQ/100;
   SIGNAL   DELAY_MS 	 : NATURAL range 0 to 2000*CLK_1MS := 0;
   SIGNAL   counter  	 : natural range 0 to 2000*CLK_1MS := 0;
   SIGNAL   counterClear : natural range 0 to 76800 := 0;
   SIGNAL   cnt 	     : natural range 0 to lcdInitDataSize+1 := 0;

BEGIN

  PROCESS (CLK,RST) 

  BEGIN
    IF (RISING_EDGE(CLK)) THEN
      IF(RST = '1') THEN
        state        <= s0;
        delay_en     <= '0';
		counterClear <= 0;
        cnt          <= 0; 
        DELAY_MS	 <= 0;
        LCD_INIT_OK  <= '0';
        PX_RDY       <= '0';
        LCD_CS_N     <= '1';
        LCD_RS       <= '1';
        LCD_RESET_N  <= '0';
        LCD_WR_N     <= '1';
      ELSE
         CASE state IS

        --------------
        --  rst LCD  
        --------------
        WHEN s0=>                   -- RST
          DELAY_ms      <= 10*CLK_1ms; 
          delay_en      <= '1';
          LCD_RESET_N   <= '1';
          IF(delay = '1') THEN
            delay_en <= '0';
            state    <= s1;
          ELSE
            state    <= s0;
          END IF;
        
        WHEN s1=>
          DELAY_ms <= 10*CLK_1ms; 
          delay_en <= '1';
          LCD_RESET_N   <= '0';
          IF(delay = '1') THEN
            delay_en <= '0';
            state    <= s2;
          ELSE
            state    <= s1;
          END IF;

        WHEN s2=>
          DELAY_ms <= 120*CLK_1ms; 
          delay_en <= '1';
          LCD_RESET_N   <= '1';
          IF(delay = '1') THEN
            delay_en <= '0';
            DELAY_ms <= 1*CLK_1ms;  -- config delay 
            state    <= s3;
          ELSE
            state    <= s2;
          END IF;

        ---------
        -- LCD INIT
        ---------

        WHEN s3=>
            IF( cnt > lcdInitDataSize) THEN   
                LCD_WR_N     <= '1';
		        LCD_CS_N     <= '1';
                delay_en     <= '0';
                state        <= c1;
            ELSE
                delay_en <= '1';                            -- active delay
                LCD_WR_N <= '0';                            -- LCD Write
                LCD_CS_N <= '0';
                LCD_RS   <= lcdInitData(cnt)(16);           -- LCD config mode
                LCD_D    <= lcdInitData(cnt)(15 downto 0);  -- LCD exit sleep
                state    <= s3;       -- wait delay ok
                IF(delay_en = '1') THEN
                    cnt <= cnt + 1;
                    delay_en <= '0';      -- disable delay
                    LCD_WR_N <= '1';      -- LCD disable Write
                    state    <= s3n;       -- wait delay ok
                END IF;
            END IF;

        WHEN s3n => 
		  LCD_CS_N <= '1';
		  state	 <= s3m;

	    WHEN s3m =>
		  state	 <= s3;

        ---------
        -- LCD CLEAR
        -- 
        ---------
	    when c1 => 
		IF( counterClear >=76801) THEN
			state 	     <= s5;
            LCD_INIT_OK  <= '1';
		ELSE
			delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '1';          -- LCD config mode
            LCD_CS_N <= '0';
            LCD_D    <= x"FFA5"; 
            --LCD_D    <= x"0000"; -- (Eu mudei para ficar preto Luciano Soares)
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= c2;       -- go next state
            ELSE
                state <= c1;
            END IF;
		END IF;	
	
	    when c2 =>
            LCD_WR_N     <= '0';          -- LCD Write
            LCD_CS_N     <= '1';
            counterClear <= counterClear + 1;
            state 	     <= c3;

	    when c3 =>
            state 	     <= c1;
       	
        ---------
        -- LCD INIT DONE
        -- Wait for px
        ---------
        WHEN s5 =>
            PX_RDY    <= '1';
		    LCD_CS_N  <= '1';
            delay_en  <= '0';
            IF(PX_EN = '1') THEN
                state  <= s6;
                PX_RDY <= '0';
            ELSE
                state <= s5;
            END IF;

        -- set cursor at x position
        WHEN s6 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '0';          -- LCD config mode
            LCD_CS_N <= '0';
            LCD_D    <= x"002A"; 
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s6d;      -- go next state
            ELSE
                state <= s6;
            END IF;

	    when s6d =>
            LCD_WR_N <= '0';      -- LCD disable Write
            LCD_CS_N <= '1';
            state 	 <= s7;

        WHEN s7 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '1';          -- LCD config mode
            LCD_CS_N <= '0';
            LCD_D( 7 downto 0)  <= PX_X(15 downto 8);
            LCD_D(15 downto 8)  <= (others => '0');
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s7d;       -- go next state
            ELSE
                state <= s7;
            END IF;

	    when s7d =>
            LCD_WR_N <= '0';      -- LCD disable Write
        	LCD_CS_N <= '1';
		    state    <= s8;

        WHEN s8 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '1';          -- LCD config mode
            LCD_CS_N <= '0';
            LCD_D( 7 downto 0)  <= PX_X(7 downto 0);
            LCD_D(15 downto 8)  <= (others => '0');
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s8d;       -- go next state
            ELSE
                state <= s8;
            END IF;

	    when s8d =>
            LCD_WR_N <= '0';      -- LCD disable Write
        	   LCD_CS_N <= '1';
		      state 	 <= s9;
  
            -- set cursor at y position
        WHEN s9 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '0';          -- LCD config mode
            LCD_CS_N <= '0';
            LCD_D    <= x"002B"; 
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s9d;      -- go next state
            ELSE
                state <= s9;
            END IF;

	    when s9d =>
            LCD_WR_N <= '0';      -- LCD disable Write
        	LCD_CS_N <= '1';
            state 	 <= s10;

        WHEN s10 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '1';          -- LCD config mode
            LCD_CS_N <= '0';
            LCD_D( 7 downto 0)  <= PX_Y(15 downto 8);
            LCD_D(15 downto 8)  <= (others => '0');
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s10d;       -- go next state
            ELSE
                state <= s10;
            END IF;

	    when s10d =>
            LCD_WR_N <= '0';      -- LCD disable Write
        	LCD_CS_N <= '1';
            state 	 <= s11;

        WHEN s11 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '1';          -- LCD config mode
            LCD_CS_N <= '0';
            LCD_D( 7 downto 0)  <= PX_Y(7 downto 0);
            LCD_D(15 downto 8)  <= (others => '0');
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s11d;       -- go next state
            ELSE
                state <= s11;
            END IF;   

	    when s11d =>
            LCD_WR_N <= '0';      -- LCD disable Write
        	LCD_CS_N <= '1';
            state 	 <= s12;

            --Memory Write 
        WHEN s12 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '0';          -- LCD config mode
        	LCD_CS_N <= '0';
            LCD_D    <= x"002C";
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s12d;       -- go next state
            ELSE
                state <= s12;
            END IF;  

	    when s12d =>
            LCD_WR_N <= '0';      -- LCD disable Write
        	   LCD_CS_N <= '1';
            state 	 <= s13; 
	    ------------------------

        --Memory Write 
        WHEN s13 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '0';          -- LCD config mode
        	LCD_CS_N <= '0';
            LCD_D    <= x"002C";
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s13d;       -- go next state
            ELSE
                state <= s13;
            END IF;   

	    when s13d =>
            LCD_WR_N <= '0';      -- LCD disable Write
        	LCD_CS_N <= '1';
            state 	 <= s14;

        -- Color 
        WHEN s14 =>
            delay_en <= '1';          -- active delay
            LCD_WR_N <= '0';          -- LCD Write
            LCD_RS   <= '1';          -- LCD config mode
            LCD_CS_N <= '0';
            LCD_D    <= PX_COLOR;
            IF(delay_en = '1') THEN
                delay_en <= '0';      -- disable delay
                LCD_WR_N <= '1';      -- LCD disable Write
                state    <= s14d;       -- go next state
            ELSE
                state <= s14;
            END IF;   

	    when s14d =>
            LCD_WR_N <= '0';      -- LCD disable Write
        	LCD_CS_N <= '1';
            state 	 <= s5;

        WHEN OTHERS =>
            state <= s0;

         END CASE;
      END IF;
    END IF;
  END PROCESS;


  PROCESS(CLK,RST)
  BEGIN
    IF (RISING_EDGE(CLK)) THEN
      IF(RST = '1') THEN
        delay   <= '0';
        counter <= 0;
      ELSE
        IF(delay_en = '1') THEN
          IF( counter >= DELAY_ms) THEN
            delay   <= '1';
            counter <= 0;
          ELSE
            delay   <= '0';
            counter <= counter + 1;
          END IF;
        ELSE
          delay     <= '0';
          counter   <= 0;
        END IF;
      END IF;
    END IF;
  END PROCESS;

LCD_RD_N <= '1';

END rtl;
