--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:43:36 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_ProcessorStateRegister.vhd
-- Project Name:  Procesador_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProcessorStateRegister
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
         C : OUT  std_logic;
         icc : OUT  std_logic_vector(3 downto 0)
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
   signal icc : std_logic_vector(3 downto 0);

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
          C => C,
          icc => icc
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
		reset <= '0';
		nCWP <= '0';
		NZVC <= "0001";
      wait for 100 ns;
		reset <= '0';
		nCWP <= '1';
		NZVC <= "0000";
      wait for 100 ns;
		reset <= '0';
		nCWP <= '1';
		NZVC <= "0001";
      wait for 100 ns;
   end process;
END;
