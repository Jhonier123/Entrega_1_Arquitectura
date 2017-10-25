--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:42:54 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_Windows_Manager.vhd
-- Project Name:  Procesador_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Windows_Manager
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Windows_Manager IS
END tb_Windows_Manager;
 
ARCHITECTURE behavior OF tb_Windows_Manager IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Windows_Manager
    PORT(
         wrs1 : IN  std_logic_vector(4 downto 0);
         wrs2 : IN  std_logic_vector(4 downto 0);
         wrd : IN  std_logic_vector(4 downto 0);
         wop : IN  std_logic_vector(1 downto 0);
         wop3 : IN  std_logic_vector(5 downto 0);
         CWP : IN  std_logic;
         nwrs1 : OUT  std_logic_vector(5 downto 0);
         nwrs2 : OUT  std_logic_vector(5 downto 0);
         nwrd : OUT  std_logic_vector(5 downto 0);
         nCWP : OUT  std_logic;
         Register7 : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal wrs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal wrs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal wrd : std_logic_vector(4 downto 0) := (others => '0');
   signal wop : std_logic_vector(1 downto 0) := (others => '0');
   signal wop3 : std_logic_vector(5 downto 0) := (others => '0');
   signal CWP : std_logic := '0';

 	--Outputs
   signal nwrs1 : std_logic_vector(5 downto 0);
   signal nwrs2 : std_logic_vector(5 downto 0);
   signal nwrd : std_logic_vector(5 downto 0);
   signal nCWP : std_logic;
   signal Register7 : std_logic_vector(5 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Windows_Manager PORT MAP (
          wrs1 => wrs1,
          wrs2 => wrs2,
          wrd => wrd,
          wop => wop,
          wop3 => wop3,
          CWP => CWP,
          nwrs1 => nwrs1,
          nwrs2 => nwrs2,
          nwrd => nwrd,
          nCWP => nCWP,
          Register7 => Register7
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wop <= "11";
		wop3 <= "111111";
		wrd <= "00001";
		wrs1 <= "01000";
		wrs2 <= "01001";
		CWP <= '0';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "000100";
		wrd <= "00001";
		wrs1 <= "01000";
		wrs2 <= "01001";
		CWP <= '0';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "000100";
		wrd <= "00001";
		wrs1 <= "01000";
		wrs2 <= "01001";
		CWP <= '1';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "111101";
		wrd <= "00001";
		wrs1 <= "01000";
		wrs2 <= "01001";
		CWP <= '0';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "111100";
		wrd <= "00001";
		wrs1 <= "01000";
		wrs2 <= "01001";
		CWP <= '1';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "111101";
		wrd <= "00001";
		wrs1 <= "01000";
		wrs2 <= "01001";
		CWP <= '0';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "111100";
		wrd <= "10111";
		wrs1 <= "00001";
		wrs2 <= "11000";
		CWP <= '1';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "111101";
		wrd <= "10101";
		wrs1 <= "01000";
		wrs2 <= "10111";
		CWP <= '0';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "000100";
		wrd <= "10100";
		wrs1 <= "01000";
		wrs2 <= "10111";
		CWP <= '1';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "000000";
		wrd <= "10010";
		wrs1 <= "10000";
		wrs2 <= "10001";
		CWP <= '0';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "111101";
		wrd <= "10010";
		wrs1 <= "10000";
		wrs2 <= "10001";
		CWP <= '0';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "000100";
		wrd <= "01010";
		wrs1 <= "01000";
		wrs2 <= "01001";
		CWP <= '1';
      wait for 100 ns;
		wop <= "10";
		wop3 <= "111100";
		wrd <= "01010";
		wrs1 <= "01000";
		wrs2 <= "01001";
		CWP <= '1';
      wait for 100 ns;
   end process;

END;
