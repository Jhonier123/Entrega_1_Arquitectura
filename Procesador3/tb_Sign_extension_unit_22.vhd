--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:44:11 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_Sign_extension_unit_22.vhd
-- Project Name:  Procesador_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sign_extension_unit_22
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
 
ENTITY tb_Sign_extension_unit_22 IS
END tb_Sign_extension_unit_22;
 
ARCHITECTURE behavior OF tb_Sign_extension_unit_22 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sign_extension_unit_22
    PORT(
         disp22 : IN  std_logic_vector(21 downto 0);
         seu32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp22 : std_logic_vector(21 downto 0) := (others => '0');

 	--Outputs
   signal seu32 : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sign_extension_unit_22 PORT MAP (
          disp22 => disp22,
          seu32 => seu32
        );

   -- Stimulus process
   stim_proc: process
   begin		
      disp22 <= "0101010101010101010101";
		wait for 100 ns;
		disp22 <= "1101010101010101010101";
		wait for 100 ns;
   end process;

END;
