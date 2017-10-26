--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:29:37 10/19/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/psr/PSR_modifier/tb_PSModifier.vhd
-- Project Name:  PSR_modifier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProcessorStateRegister_Modifier
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
 

ENTITY tb_PSModifier IS
END tb_PSModifier;
 
ARCHITECTURE behavior OF tb_PSModifier IS 
 
    
 
    COMPONENT ProcessorStateRegister_Modifier
    PORT(
         reset : IN  std_logic;
         Crs1 : IN  std_logic_vector(31 downto 0);
         Crs2_mux : IN  std_logic_vector(31 downto 0);
         aluResult : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(5 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal Crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Crs2_mux : std_logic_vector(31 downto 0) := (others => '0');
   signal aluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
  

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcessorStateRegister_Modifier PORT MAP (
          reset => reset,
          Crs1 => Crs1,
          Crs2_mux => Crs2_mux,
          aluResult => aluResult,
          aluop => aluop,
          NZVC => NZVC
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux <= "00000000000000000000000001111000"; 
      aluop <= "010000";
      aluResult <= "00000000000000000000000001111000";
      wait for 100 ns;	
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux <= "00000000000000000000000001111000"; 
      aluop <= "000000";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux <= "00000000000000000000000001111000"; 
      aluop <= "000000";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux  <= "00000000000000000000000001111000"; 
      aluop <= "010000";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '1';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux  <= "10000000000000000000000001111000"; 
      aluop <= "011000";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux  <= "10000000000000000000000001111000"; 
      aluop <= "010000";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux  <= "00000000000000000000000001111000"; 
      aluop <= "010000";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux  <= "10000000000000000000000001111000"; 
      aluop <= "010000";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux  <= "00000000000000000000000001111000"; 
      aluop <= "010000";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux  <= "10000000000000000000000001111000"; 
      aluop <= "010000";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux  <= "00000000000000000000000001111000"; 
      aluop <= "011000";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux  <= "10000000000000000000000001111000"; 
      aluop <= "011000";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux  <= "00000000000000000000000001111000"; 
      aluop <= "011000";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux <= "10000000000000000000000001111000"; 
      aluop <= "010100";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '1';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux <= "00000000000000000000000001111000"; 
      aluop <= "010100";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux <= "00000000000000000000000001111000"; 
      aluop <= "010100";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux <= "10000000000000000000000001111000"; 
      aluop <= "000100";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux <= "10000000000000000000000001111000"; 
      aluop <= "010100";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux <= "00000000000000000000000001111000"; 
      aluop <= "010100";
      aluResult <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux <= "10000000000000000000000001111000"; 
      aluop <= "011100";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux <= "00000000000000000000000001111000"; 
      aluop <= "011100";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "10000000000000000000000001111000";
      Crs2_mux <= "10000000000000000000000001111000"; 
      aluop <= "011100";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
      Crs1 <= "00000000000000000000000001111000";
      Crs2_mux <= "00000000000000000000000001111000"; 
      aluop <= "011100";
      aluResult <= "10000000000000000000000000000000";
      wait for 100 ns;
    
   end process;

END;
