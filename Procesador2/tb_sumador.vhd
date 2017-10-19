--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:02:28 10/12/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Pictures/jhonier/procesadormono/tb_sumador.vhd
-- Project Name:  procesadormono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador
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

ENTITY tb_sumador IS
END tb_sumador;
 
ARCHITECTURE behavior OF tb_sumador IS 
 
 
    COMPONENT sumador
    PORT(
         oper1 : IN  std_logic_vector(31 downto 0);
         oper2 : IN  std_logic_vector(31 downto 0);
         resultado : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal oper2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal resultado : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          oper1 => oper1,
          oper2 => oper2,
          resultado => resultado
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      oper1<="00000111100011110001100110011110";
		oper2<="00001111111111111111111111111111";
      wait for 20 ns;	
		oper1<="00000000000000000000000000000001";
		oper2<="00000000000000000000000000000010";
      wait for 20 ns;
		oper1<="00000000000000000000000000001000";
		oper2<="00000000000000000000000000000000";
      wait for 20 ns;
		oper1<="00000000000000000001111111111111";
		oper2<="00000000000000000000000000001010";
      wait for 20 ns;
		oper1<="00000000000000000000111111111111";
		oper2<="11110000000000000000000000000000";
      wait for 20 ns;
		oper1<="00000000011111111111111000000000";
		oper2<="11111111110000000000000001111111";
      wait for 20 ns;
      wait;
   end process;

END;
