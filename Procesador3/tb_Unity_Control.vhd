--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:41:54 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Jhonier/Procesador_3/tb_Unity_Control.vhd
-- Project Name:  Procesador_3
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Unity_Control IS
END tb_Unity_Control;
 
ARCHITECTURE behavior OF tb_Unity_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unity_Control
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op2 : IN  std_logic_vector(2 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         RFDEST : OUT  std_logic;
         WRENMEM : OUT  std_logic;
         RDENMEM : OUT  std_logic;
         WE : OUT  std_logic;
         PCSOURCE : OUT  std_logic_vector(1 downto 0);
         RFSOURSE : OUT  std_logic_vector(1 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op2 : std_logic_vector(2 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal RFDEST : std_logic;
   signal WRENMEM : std_logic;
   signal RDENMEM : std_logic;
   signal WE : std_logic;
   signal PCSOURCE : std_logic_vector(1 downto 0);
   signal RFSOURSE : std_logic_vector(1 downto 0);
   signal ALUOP : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unity_Control PORT MAP (
          Op => Op,
          Op2 => Op2,
          Op3 => Op3,
          cond => cond,
          icc => icc,
          RFDEST => RFDEST,
          WRENMEM => WRENMEM,
          RDENMEM => RDENMEM,
          WE => WE,
          PCSOURCE => PCSOURCE,
          RFSOURSE => RFSOURSE,
          ALUOP => ALUOP
        );

   -- Stimulus process
   stim_proc: process
   begin		
      Op <= "10";     -- ADD
		Op3 <= "000000";
		Op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- ADDcc
		Op <= "10";
		Op3 <= "010000";
		Op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- ADDX
		Op <= "10";
		Op3 <= "001000";
		Op2 <= "001";
		icc <= "0000";
      wait for 100 ns; -- ADDXcc
		Op <= "10";
		Op3 <= "011000";
		Op2 <= "011";
		icc <= "0000";
      wait for 100 ns; -- SUB
		Op <= "10";
		Op3 <= "000100";
		Op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- SUBcc
		Op <= "10";
		Op3 <= "010100";
		Op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- SUBX
		Op <= "10";
		Op3 <= "001100";
		Op2 <= "001";
		icc <= "0000";
      wait for 100 ns; -- SUBXcc
		Op <= "10";
		Op3 <= "011100";
		Op2 <= "011";
		icc <= "0000";
      wait for 100 ns; -- AND
		Op <= "10";
		Op3 <= "000001";
		Op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- ANDcc
		Op <= "10";
		Op3 <= "000101";
		Op2 <= "001";
		icc <= "0000";
      wait for 100 ns; -- ANDN
		Op <= "10";
		Op3 <= "010101";
		Op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- OR
		Op <= "10";
		Op3 <= "000010";
		Op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- ORcc
		Op <= "10";
		Op3 <= "010010";
		Op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- ORN
		Op <= "10";
		Op3 <= "000110";
		Op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- ORNcc
		Op <= "10";
		Op3 <= "010110";
		Op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- XOR
		Op <= "10";
		Op3 <= "000011";
		Op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- XORcc
		Op <= "10";
		Op3 <= "010011";
		Op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- XNOR
		Op <= "10";
		Op3 <= "000111";
		Op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- XNORcc
		Op <= "10";
		Op3 <= "010111";
		Op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- SLL
		Op <= "10";
		Op3 <= "100101";
		Op2 <= "100";
		icc <= "0000";
      wait for 100 ns; -- SRL
		Op <= "10";
		Op3 <= "100110";
		Op2 <= "100";
		icc <= "0000";
      wait for 100 ns; -- STORE
		Op <= "11";
		Op3 <= "000100";
		Op2 <= "100";
		icc <= "0000";
      wait for 100 ns;
		wait for 100 ns; -- LOAD
		Op <= "11";
		Op3 <= "000000";
		Op2 <= "100";
		icc <= "0000";
      wait for 100 ns;
      wait;
   end process;

END;
