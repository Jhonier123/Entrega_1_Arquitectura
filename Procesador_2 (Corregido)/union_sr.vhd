
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity union_sr is
    Port ( reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           address : out  STD_LOGIC_VECTOR (31 downto 0));
end union_sr;

architecture Behavioral of union_sr is
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


Signal tmpnext : std_logic_vector(31 downto 0):= (others=>'0');
Signal tmpnpc : std_logic_vector(31 downto 0):= (others=>'0');
Signal tmpsuma : std_logic_vector(31 downto 0):= (others=>'0');

begin

	Inst_sumador: sumador PORT MAP(
		oper1 => "00000000000000000000000000000001",
		oper2 => tmpsuma,
		resultado => tmpnext
	);
	
		Inst_registro: registro PORT MAP(
		reset => reset,
		dataIn => tmpnpc,
		CLK => CLK,
		dataOut => tmpsuma
	);
	
	Inst_registronext: registro PORT MAP(
		reset => reset ,
		dataIn => tmpnext,
		CLK => CLK,
		dataOut => tmpnpc
	);
	

	
	address <= tmpsuma;
end Behavioral;

