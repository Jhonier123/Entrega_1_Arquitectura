--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:47 09/28/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/JhoLau/Moduloseus/tb_unity_control.vhd
-- Project Name:  Moduloseus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unity_Control
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
 
ENTITY tb_unity_control IS
END tb_unity_control;
 
ARCHITECTURE behavior OF tb_unity_control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unity_Control
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unity_Control PORT MAP (
          Op => Op,
          Op3 => Op3,
          ALUOP => ALUOP
        );
   -- Stimulus process
   stim_proc: process
   begin		
      Op <= "10";
		Op3 <= "000010";
      wait for 20 ns; 
		Op <= "10";
		Op3 <= "000011";
      wait for 20 ns; 
		Op <= "10";
		Op3 <= "010010";
      wait for 20 ns; 
		Op <= "10";
		Op3 <= "000001";
      wait for 20 ns; 
		Op <= "10";
		Op3 <= "000011";
      wait for 20 ns; 
		Op <= "10";
		Op3 <= "000000";
      wait for 20 ns; 
		Op <= "10";
		Op3 <= "000100";
      wait for 20 ns; 
		Op <= "10";
		Op3 <= "100000";
      wait for 20 ns; 
		Op <= "10";
		Op3 <= "111010";
      wait for 20 ns; 
      wait;
   end process;

END;
