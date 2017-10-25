--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:45:41 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_MUX_WM_RF.vhd
-- Project Name:  Procesador_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_WM_RF
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
 
ENTITY tb_MUX_WM_RF IS
END tb_MUX_WM_RF;
 
ARCHITECTURE behavior OF tb_MUX_WM_RF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_WM_RF
    PORT(
         RD : IN  std_logic_vector(5 downto 0);
         num15 : IN  std_logic_vector(5 downto 0);
         RFDEST : IN  std_logic;
         nRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RD : std_logic_vector(5 downto 0) := (others => '0');
   signal num15 : std_logic_vector(5 downto 0) := (others => '0');
   signal RFDEST : std_logic := '0';

 	--Outputs
   signal nRD : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_WM_RF PORT MAP (
          RD => RD,
          num15 => num15,
          RFDEST => RFDEST,
          nRD => nRD
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      RD <= "111100";
		num15 <= "001111";
		RFDEST <= '0';
      wait for 100 ns;	
		RD <= "111100";
		num15 <= "011111";
		RFDEST <= '0';
      wait for 100 ns;	
		RD <= "111100";
		num15 <= "001111";
		RFDEST <= '1';
      wait for 100 ns;	
		RD <= "111100";
		num15 <= "011111";
		RFDEST <= '1';
      wait for 100 ns;
   end process;

END;
