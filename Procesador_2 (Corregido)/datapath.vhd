----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:41:02 09/26/2017 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapath is
    Port ( reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end datapath;

architecture Behavioral of datapath is

	COMPONENT Instruction_memory
	PORT(
		addressim : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT union_sr
	PORT(
		reset : IN std_logic;
		CLK : IN std_logic;          
		address : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

Signal tmpaddress: std_logic_vector(31 downto 0):= (others=>'0');

begin


	Inst_Instruction_memory: Instruction_memory PORT MAP(
		addressim =>tmpaddress ,
		reset => reset,
		instruction => instruction
	);
	
		Inst_union_sr: union_sr PORT MAP(
		reset =>reset ,
		CLK => CLK,
		address => tmpaddress
	);




end Behavioral;

