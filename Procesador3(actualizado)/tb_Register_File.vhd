--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:42:37 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_Register_File.vhd
-- Project Name:  Procesador_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY tb_Register_File IS
END tb_Register_File;
 
ARCHITECTURE behavior OF tb_Register_File IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         nrs1 : IN  std_logic_vector(5 downto 0);
         nrs2 : IN  std_logic_vector(5 downto 0);
         nrd : IN  std_logic_vector(5 downto 0);
         DATATOREG : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         WE : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0);
         cRD : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nrs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal nrs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal nrd : std_logic_vector(5 downto 0) := (others => '0');
   signal DATATOREG : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal WE : std_logic := '0';

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   signal cRD : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd,
          DATATOREG => DATATOREG,
          rst => rst,
          WE => WE,
          crs1 => crs1,
          crs2 => crs2,
          cRD => cRD
        );

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '0';
		WE <= '0';
		nrs1 <= "000000";
		nrs2 <= "011110";
		nrd <= "010000";
		DATATOREG <= "11111111111111111111111111111110";
      wait for 100 ns;
		rst <= '0';
		WE <= '1';
		nrs1 <= "000000";
		nrs2 <= "011110";
		nrd <= "010000";
		DATATOREG <= "11111111111111111111111111111110";
      wait for 100 ns;	
		rst <= '0';
		WE <= '1';
		nrs1 <= "010000";
		nrs2 <= "011110";
		nrd <= "011000";
		DATATOREG <= "00000011111111111111111111111110";
      wait for 100 ns;
		rst <= '1';
		WE <= '1';
		nrs1 <= "010000";
		nrs2 <= "011110";
		nrd <= "011000";
		DATATOREG <= "00000011111111111111111111111110";
      wait for 100 ns;
		rst <= '0';
		WE <= '1';
		nrs1 <= "010000";
		nrs2 <= "011110";
		nrd <= "011000";
		DATATOREG <= "00000011111111111111111111111110";
      wait for 100 ns;
		rst <= '0';
		WE <= '1';
		nrs1 <= "010000";
		nrs2 <= "011110";
		nrd <= "010001";
		DATATOREG <= "00000011111111111111111111111110";
      wait for 100 ns;
		
   end process;


END;
