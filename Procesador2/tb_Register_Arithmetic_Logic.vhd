--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:12 10/12/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Pictures/jhonier/procesadormono/tb_Register_Arithmetic_Logic.vhd
-- Project Name:  procesadormono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_Arithmetic_Logic
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
 
ENTITY tb_Register_Arithmetic_Logic IS
END tb_Register_Arithmetic_Logic;
 
ARCHITECTURE behavior OF tb_Register_Arithmetic_Logic IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_Arithmetic_Logic
    PORT(
         In_Register : IN  std_logic_vector(31 downto 0);
         rst1 : IN  std_logic;
         ALUResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In_Register : std_logic_vector(31 downto 0) := (others => '0');
   signal rst1 : std_logic := '0';

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_Arithmetic_Logic PORT MAP (
          In_Register => In_Register,
          rst1 => rst1,
          ALUResult => ALUResult
        );

   -- Stimulus process
   stim_proc: process
   begin		
      In_Register<="";
		rst1<="";
      wait for 20 ns;
      In_Register<="";
		rst1<="";
      wait for 20 ns;
      In_Register<="";
		rst1<="";
      wait for 20 ns;
      In_Register<="";
		rst1<="";
      wait for 20 ns;
      In_Register<="";
		rst1<="";
      wait for 20 ns;
      In_Register<="";
		rst1<="";
      wait for 20 ns;
      In_Register<="";
		rst1<="";
      wait for 20 ns;
      In_Register<="";
		rst1<="";
      wait for 20 ns;
      wait;
   end process;

END;
