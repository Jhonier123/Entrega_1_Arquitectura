--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:00:26 10/26/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/modulos/Procesador3/tb_ultimoprocesador.vhd
-- Project Name:  Procesador3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ultimoProcesador
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
 
ENTITY tb_ultimoprocesador IS
END tb_ultimoprocesador;
 
ARCHITECTURE behavior OF tb_ultimoprocesador IS 
 
    
 
    COMPONENT ultimoProcesador
    PORT(
         reset : IN  std_logic;
         CLK : IN  std_logic;
         muxResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal muxResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ultimoProcesador PORT MAP (
          reset => reset,
          CLK => CLK,
          muxResult => muxResult
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
      reset <= '1';
      wait for 100 ns;	
		reset <= '0';
      wait for 100 ns;	

      wait for CLK_period*10;
      wait;
   end process;

END;
