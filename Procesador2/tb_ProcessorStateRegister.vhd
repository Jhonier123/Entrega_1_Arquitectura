--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:49:17 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/PSRs/PSR/tb_ProcessorStateRegister.vhd
-- Project Name:  PSR
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProcessorStateRegister
-- 

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY tb_ProcessorStateRegister IS
END tb_ProcessorStateRegister;
 
ARCHITECTURE behavior OF tb_ProcessorStateRegister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcessorStateRegister
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
			nCWP : IN  std_logic;
         NZVC : IN  std_logic_vector(3 downto 0);
         cwp : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
	signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal nCWP : std_logic := '0';
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal cwp : std_logic;
   signal C : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcessorStateRegister PORT MAP (
          clk => clk,
          reset => reset,
			 nCWP => nCWP,
          NZVC => NZVC,
          cwp => cwp,
          C => C
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
		nCWP <= '1';
		NZVC <= "0001";
      wait for 100 ns;	
		
		reset <= '0';
		nCWP <= '1';
		NZVC <= "0001";
      wait for 100 ns;
		
		reset <= '0';
		nCWP <= '0';
		NZVC <= "0001";
      wait for 100 ns;
		
		reset <= '0';
		nCWP <= '0';
		NZVC <= "0000";
      wait for 100 ns;
		
		reset <= '1';
		nCWP <= '0';
		NZVC <= "0001";
      wait for 100 ns;
		
		reset <= '1';
		nCWP <= '0';
		NZVC <= "0000";
      wait for 100 ns;
		
		reset <= '0';
		nCWP <= '1';
		NZVC <= "0000";
      wait for 100 ns;
		
		reset <= '1';
		nCWP <= '1';
		NZVC <= "0000";
      wait for 100 ns;
      wait;
   end process;

END;
