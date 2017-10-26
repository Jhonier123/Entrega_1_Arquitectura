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



entity datapath is
    Port ( reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  In_nPC: in STD_LOGIC_VECTOR (31 downto 0);
           instruction : out STD_LOGIC_VECTOR (31 downto 0);
			  salSumador : out STD_LOGIC_VECTOR (31 downto 0);
			  salPC : out STD_LOGIC_VECTOR (31 downto 0));
			  
end datapath;

architecture Behavioral of datapath is

	COMPONENT Instruction_memory
	PORT(
		addressim : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


	COMPONENT sumador
	PORT(
		oper1 : IN std_logic_vector(31 downto 0);
		oper2 : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	
	COMPONENT registro
	PORT(
		reset : IN std_logic;
		dataIn : IN std_logic_vector(31 downto 0);
		CLK : IN std_logic;          
		dataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

Signal nPC: std_logic_vector(31 downto 0):= (others=>'0');
signal salSum: std_logic_vector(31 downto 0):= (others=>'0');
Signal pc_instMemory: std_logic_vector(31 downto 0):= (others=>'0');

begin


	Inst_Instruction_memory: Instruction_memory PORT MAP(
		addressim =>pc_instMemory ,
		reset => reset,
		instruction => instruction
	);
	
		Inst_sumador: sumador PORT MAP(
		oper1 => "00000000000000000000000000000001" ,
		oper2 => nPC,
		resultado => salSum
	);
	
	Inst_registro: registro PORT MAP(
		reset => reset,
		dataIn => nPC,
		CLK => CLK,
		dataOut => pc_instMemory
	);

	Inst_registroNext: registro PORT MAP(
		reset => reset,
		dataIn => In_nPC,
		CLK => CLK ,
		dataOut =>nPC 
	);

	salSumador <= salSum;
	salPC <= pc_instMemory;

end Behavioral;

