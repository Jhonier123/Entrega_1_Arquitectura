--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:45:22 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_MUX_DMalu.vhd
-- Project Name:  Procesador_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_DMalu
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
 
ENTITY tb_MUX_DMalu IS
END tb_MUX_DMalu;
 
ARCHITECTURE behavior OF tb_MUX_DMalu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_DMalu
    PORT(
         DATATOMEM : IN  std_logic_vector(31 downto 0);
         ALUresult : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         RFSOURCE : IN  std_logic_vector(1 downto 0);
         DATATOREG : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DATATOMEM : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUresult : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal RFSOURCE : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal DATATOREG : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_DMalu PORT MAP (
          DATATOMEM => DATATOMEM,
          ALUresult => ALUresult,
          PC => PC,
          RFSOURCE => RFSOURCE,
          DATATOREG => DATATOREG
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      ALUresult <= "00000000000000001101010111001110";
		DATATOMEM <= "00000000000000000000011111101111";
		PC <= "00000000000011111000000111110000";
		RFSOURCE <= "00";
      wait for 100 ns;
		ALUresult<= "00000000000000001101010111001110";
		DATATOMEM <= "00000000000000000000011111101111";
		PC <= "00000000000011111000000111110000";
		RFSOURCE <= "01";
      wait for 100 ns;
		ALUresult <= "00000000000000001101010111001110";
		DATATOMEM <= "00000000000000000000011111101111";
		PC <= "00000000000011111000000111110000";
		RFSOURCE <= "10";
      wait for 100 ns;
		ALUresult <= "00000000000000001101010111001110";
		DATATOMEM <= "00000000000000000000011111101111";
		PC <= "00000000000011111000000111110000";
		RFSOURCE <= "11";
      wait for 100 ns;
		
   end process;

END;
