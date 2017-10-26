--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:58:18 10/12/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Pictures/jhonier/procesadormono/tb_Instruction_Memory.vhd
-- Project Name:  procesadormono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Instruction_memory
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

ENTITY tb_Instruction_Memory IS
END tb_Instruction_Memory;
 
ARCHITECTURE behavior OF tb_Instruction_Memory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instruction_memory
    PORT(
         addressim : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal addressim : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal instruction : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Instruction_memory PORT MAP (
          addressim => addressim,
          reset => reset,
          instruction => instruction
        );

   -- Stimulus process
   stim_proc: process
   begin		
      addressim<="00000000000000000000000000100000";
		reset<='1';
      wait for 20 ns;	
      addressim<="00000000000000000000000000111111";
		reset<='1';
      wait for 20 ns;
      addressim<="00000000000000000000000000000001";
		reset<='0';
      wait for 20 ns;
      addressim<="00000000000000000000000000010100";
		reset<='0';
      wait for 20 ns;
      addressim<="00000000000000000000000011100000";
		reset<='0';
      wait for 20 ns;
      addressim<="00000000000000000000000000000000";
		reset<='0';
      wait for 20 ns;
      wait;
   end process;

END;
