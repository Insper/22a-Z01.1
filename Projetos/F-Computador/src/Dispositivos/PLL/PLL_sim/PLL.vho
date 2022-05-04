--IP Functional Simulation Model
--VERSION_BEGIN 17.0 cbx_mgl 2017:04:19:10:26:36:SJ cbx_simgen 2017:04:19:09:17:27:SJ  VERSION_END


-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions
-- and other software and tools, and its AMPP partner logic
-- functions, and any output files from any of the foregoing
-- (including device programming or simulation files), and any
-- associated documentation or information are expressly subject
-- to the terms and conditions of the Intel Program License
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other
-- applicable license agreement, including, without limitation,
-- that your use is for the sole purpose of programming logic
-- devices manufactured by Intel and sold by Intel or its
-- authorized distributors.  Please refer to the applicable
-- agreement for further details.

-- You may only use these simulation model output files for simulation
-- purposes and expressly not for synthesis or any other purposes (in which
-- event Intel disclaims all warranties of any kind).

 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  PLL IS
	 PORT
	 (
		 locked	:	OUT  STD_LOGIC;
		 outclk_0	:	OUT  STD_LOGIC;
		 outclk_1	:	OUT  STD_LOGIC;
		 refclk	:	IN  STD_LOGIC;
		 rst	:	IN  STD_LOGIC
	 );
 END PLL;

 ARCHITECTURE RTL OF PLL IS

  signal clkFast : std_logic := '0';
  signal clkSlow : std_logic := '0';
  signal lock    : std_logic := '0';
 begin

  clkFast <= not clkFast after 100 ps;
  clkSlow <= not clkSlow after 500 ps;

r : process
 begin
   wait until rst = '0';
   lock <= '0';
   wait for 3 ns;
   lock <= '1';
   wait;
end process;

    outclk_0 <= clkFast and lock;
    outclk_1 <= clkSlow and lock;
    locked   <= lock;

 end rtl;
