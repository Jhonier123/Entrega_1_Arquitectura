--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:07:06 10/05/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Procesador1/Procesador-Monociclo/Tb_Procesador_Monociclo.vhd
-- Project Name:  Procesador-Monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Procesador_Monociclo
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
 
ENTITY Tb_Procesador_Monociclo IS
END Tb_Procesador_Monociclo;
 
ARCHITECTURE behavior OF Tb_Procesador_Monociclo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador_Monociclo
    PORT(
         CLK : IN  std_logic;
         rst : IN  std_logic;
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador_Monociclo PORT MAP (
          CLK => CLK,
          rst => rst,
          Result => Result
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
      rst<='1';
      wait for 20 ns;	
      rst<='0';
      wait;
   end process;

END;
