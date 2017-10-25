--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:44:55 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_MUXseu22_30.vhd
-- Project Name:  Procesador_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUXseu22_30
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
 
ENTITY tb_MUXseu22_30 IS
END tb_MUXseu22_30;
 
ARCHITECTURE behavior OF tb_MUXseu22_30 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXseu22_30
    PORT(
         PC_disp30 : IN  std_logic_vector(31 downto 0);
         PC_SEUdisp22 : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         ALUresult : IN  std_logic_vector(31 downto 0);
         PCSOURCE : IN  std_logic_vector(1 downto 0);
         MUX_nPC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_disp30 : std_logic_vector(31 downto 0) := (others => '0');
   signal PC_SEUdisp22 : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUresult : std_logic_vector(31 downto 0) := (others => '0');
   signal PCSOURCE : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal MUX_nPC : std_logic_vector(31 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXseu22_30 PORT MAP (
          PC_disp30 => PC_disp30,
          PC_SEUdisp22 => PC_SEUdisp22,
          PC => PC,
          ALUresult => ALUresult,
          PCSOURCE => PCSOURCE,
          MUX_nPC => MUX_nPC
        );

   -- Stimulus process
   stim_proc: process
   begin		
      PC_disp30 <= "00000000000000000000000000001010";
		PC_SEUdisp22 <= "00000000000000000000000000001111";
		PC <= "00000000000000000000000000000001";
		ALUresult <= "00000000000000000000000000000011";
		PCSOURCE <= "00";
      wait for 100 ns;
		PC_disp30 <= "00000000000000000000000000001010";
		PC_SEUdisp22 <= "00000000000000000000000000001111";
		PC <= "00000000000000000000000000000001";
		ALUresult <= "00000000000000000000000000000011";
		PCSOURCE <= "01";
      wait for 100 ns;
		PC_disp30 <= "00000000000000000000000000001010";
		PC_SEUdisp22 <= "00000000000000000000000000001111";
		PC <= "00000000000000000000000000000001";
		ALUresult <= "00000000000000000000000000000011";
		PCSOURCE <= "10";
      wait for 100 ns;
		PC_disp30 <= "00000000000000000000000000001010";
		PC_SEUdisp22 <= "00000000000000000000000000001111";
		PC <= "00000000000000000000000000000001";
		ALUresult <= "00000000000000000000000000000011";
		PCSOURCE <= "11";
      wait for 100 ns;
      wait;
   end process;

END;
