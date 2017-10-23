--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:51:55 10/12/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Pictures/jhonier/procesadormono/tb_Register_File.vhd
-- Project Name:  procesadormono
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
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          DWR => DWR,
          rst => rst,
          crs1 => crs1,
          crs2 => crs2
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      
		rs1<="01000";
		rs2<="00100";
		rd<="00011";
		DWR<="00000000000000000000001111111111";
		rst<='1';
      wait for 20 ns;
		rs1<="01000";
		rs2<="00100";
		rd<="00011";
		DWR<="00000000000000000000001111111111";
		rst<='0';
      wait for 20 ns;
		rs1<="01001";
		rs2<="01100";
		rd<="10000";
		DWR<="00000000000000000000000000001010";
		rst<='0';
      wait for 20 ns;
		rs1<="10100";
		rs2<="01000";
		rd<="00100";
		DWR<="00000000000000000000000000110000";
		rst<='0';
      wait for 20 ns;
		rs1<="00011";
		rs2<="00101";
		rd<="00001";
		DWR<="00000000000000000000001111111111";
		rst<='0';
      wait for 20 ns;	
		rs1<="00100";
		rs2<="10000";
		rd<="10011";
		DWR<="00000000000000000000001111111111";
		rst<='0';
      wait for 20 ns;		
      wait;
   end process;

END;
