--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:55:12 10/12/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Pictures/jhonier/procesadormono/tb_Unit_Arithmetic_Logic.vhd
-- Project Name:  procesadormono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unit_Arithmetic_Logic
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
 
ENTITY tb_Unit_Arithmetic_Logic IS
END tb_Unit_Arithmetic_Logic;
 
ARCHITECTURE behavior OF tb_Unit_Arithmetic_Logic IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unit_Arithmetic_Logic
    PORT(
         Oper1 : IN  std_logic_vector(31 downto 0);
         Oper2 : IN  std_logic_vector(31 downto 0);
         ALUOP : IN  std_logic_vector(5 downto 0);
         ALUResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Oper2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUOP : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unit_Arithmetic_Logic PORT MAP (
          Oper1 => Oper1,
          Oper2 => Oper2,
          ALUOP => ALUOP,
          ALUResult => ALUResult
        );

   -- Stimulus process
   stim_proc: process
   begin		
      Oper1<="00000000000011111111111100000000";
		Oper2<="00000000000011111111111100000011";
		ALUOP<="000111"; --xnor
      wait for 20 ns;
      Oper1<="00000000000000000000001100000000";
		Oper2<="00000000000000000000000000000111";
		ALUOP<="000011"; --xor
      wait for 20 ns;	
      Oper1<="00000000000000100000000000000010";
		Oper2<="00000000000011111111111111111100";
		ALUOP<="000110";  ---nor
      wait for 20 ns;
      Oper1<="00000000000000000000000000001111";
		Oper2<="00000000000000111000000011111000";
		ALUOP<="000010"; --or
      wait for 20 ns;
      Oper1<="00000000000000000000000100000000";
		Oper2<="00000111111111000000000100000000";
		ALUOP<="000101"; --nand
      wait for 20 ns;
      Oper1<="00111111111111111111111111111111";
		Oper2<="00001111000011110000111111100000";
		ALUOP<="000001"; --and
      wait for 20 ns;		
      wait;
   end process;

END;
