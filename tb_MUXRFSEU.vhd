--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:44:00 09/28/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/JhoLau/Moduloseus/tb_MUXRFSEU.vhd
-- Project Name:  Moduloseus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUXRFSEU
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
 
ENTITY tb_MUXRFSEU IS
END tb_MUXRFSEU;
 
ARCHITECTURE behavior OF tb_MUXRFSEU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXRFSEU
    PORT(
         Crs2 : IN  std_logic_vector(31 downto 0);
         SEUimm : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         Oper2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal SEUimm : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal Oper2 : std_logic_vector(31 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXRFSEU PORT MAP (
          Crs2 => Crs2,
          SEUimm => SEUimm,
          i => i,
          Oper2 => Oper2
        );
		  
   -- Stimulus process
   stim_proc: process
   begin
	 i<= '0';
	 SEUimm <= "00000000000000000000000000000000";
	 Crs2 <= "11111111111111111111111111111111";
    wait for 20 ns;	
	 i<= '1';
	 SEUimm <= "00000000000000000000000000000000";
	 Crs2 <= "11111111111111111111111111111111";
    wait for 20 ns;
	 i<= '0';
	 SEUimm <= "00000000000000000111111111111111";
	 Crs2 <= "11111111111111111110000000000000";
    wait for 20 ns;
    i<= '1';
	 SEUimm <= "00000000000000000111111111111111";
	 Crs2 <= "11111111111111111110000000000000";
    wait for 20 ns;
    wait;
   end process;

END;
