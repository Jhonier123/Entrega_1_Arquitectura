----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:30:55 10/26/2017 
-- Design Name: 
-- Module Name:    ultimoProcesador - Behavioral 
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


entity ultimoProcesador is
    Port ( reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           muxResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ultimoProcesador;

architecture Behavioral of ultimoProcesador is

COMPONENT datapath
	PORT(
		reset : IN std_logic;
		CLK : IN std_logic;
		In_nPC : IN std_logic_vector(31 downto 0);          
		instruction : OUT std_logic_vector(31 downto 0);
		salSumador : OUT std_logic_vector(31 downto 0);
		salPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Register_Arithmetic_Logic
	PORT(
		In_Register : IN std_logic_vector(31 downto 0);
		In_PC : IN std_logic_vector(31 downto 0);
		In_sumador : IN std_logic_vector(31 downto 0);
		rst1 : IN std_logic;
		CLK : IN std_logic;          
		MuxRF : OUT std_logic_vector(31 downto 0);
		MuxPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
SIGNAL sumadorMux:std_logic_vector(31 downto 0):= (others=>'0');
SIGNAL instMemory: std_logic_vector(31 downto 0):= (others=>'0');
Signal resultTotal : std_logic_vector(31 downto 0):= (others=>'0');
SIGNAL muxNPC: std_logic_vector(31 downto 0):= (others=>'0');  --sale del mux2230 y entra a nPC
SIGNAL salPCmux: std_logic_vector(31 downto 0):= (others=>'0'); ---sale de datapath PC y entra al muxDM_ALU

begin

	Inst_datapath: datapath PORT MAP(
		reset => reset ,
		CLK => CLK,
		In_nPC => muxNPC,
		instruction =>instMemory ,
		salSumador =>sumadorMux ,
		salPC =>salPCmux  
	);
	
	Inst_Register_Arithmetic_Logic: Register_Arithmetic_Logic PORT MAP(
		In_Register => instMemory,
		In_PC => salPCmux ,
		In_sumador => sumadorMux,
		rst1 => reset,
		CLK => CLK,
		MuxRF => resultTotal ,
		MuxPC =>muxNPC 
	);
	
	muxResult <= resultTotal;
end Behavioral;

