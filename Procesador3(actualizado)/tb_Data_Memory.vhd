--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:41:08 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_Data_Memory.vhd
-- Project Name:  Procesador_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_Memory
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
 
ENTITY tb_Data_Memory IS
END tb_Data_Memory;
 
ARCHITECTURE behavior OF tb_Data_Memory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_Memory
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         RDENMEM : IN  std_logic;
         WRENMEM : IN  std_logic;
         cRD : IN  std_logic_vector(31 downto 0);
         ALUresult : IN  std_logic_vector(31 downto 0);
         DATATOMEM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal RDENMEM : std_logic := '0';
   signal WRENMEM : std_logic := '0';
   signal cRD : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUresult : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DATATOMEM : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Memory PORT MAP (
          clk => clk,
          reset => reset,
          RDENMEM => RDENMEM,
          WRENMEM => WRENMEM,
          cRD => cRD,
          ALUresult => ALUresult,
          DATATOMEM => DATATOMEM
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
		WRENMEM <= '1';
		RDENMEM <= '0';
		cRD <= "00000000000000000000000000001010";
		ALUresult <= "00000000000000000000000000011001";
      wait for 100 ns;	
		reset <= '0';
		WRENMEM <= '1';
		RDENMEM <= '0';
		cRD <= "00000000000000000000000000001010";
		ALUresult <= "00000000000000000000000000011001";
      wait for 100 ns;
		reset <= '0';
		WRENMEM <= '0';
		RDENMEM <= '1';
		cRD <= "00000000000000000000000000001010";
		ALUresult <= "00000000000000000000000000011001";
      wait for 100 ns;
		
      wait for clk_period*10;
      wait;
   end process;
END;
