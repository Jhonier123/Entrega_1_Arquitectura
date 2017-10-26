--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:00:05 10/12/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Pictures/jhonier/procesadormono/tb_registro.vhd
-- Project Name:  procesadormono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registro
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
 
ENTITY tb_registro IS
END tb_registro;
 
ARCHITECTURE behavior OF tb_registro IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registro
    PORT(
         reset : IN  std_logic;
         dataIn : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal dataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);
	
	-- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro PORT MAP (
          reset => reset,
          dataIn => dataIn,
          CLK => CLK,
          dataOut => dataOut
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
   -- Stimulus process
   stim_proc: process
   begin		
      reset<='1';
		dataIn<="00000011111111111111111111111111";
      wait for 20 ns;	
      reset<='0';
		dataIn<="00000000000000000000000000000011";
      wait for 20 ns;
      reset<='0';
		dataIn<="00000000000000000000000001000000";
      wait for 20 ns;
      reset<='0';
		dataIn<="00000111111111111111111111111111";
      wait for 20 ns;
      reset<='0';
		dataIn<="11111111111111000000000000000000";
      wait for 20 ns;
      reset<='0';
		dataIn<="01111111111111111111111111111111";
      wait for 20 ns;
      wait;
   end process;

END;
