----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:54 10/05/2017 
-- Design Name: 
-- Module Name:    Register_Arithmetic_Logic - Behavioral 
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

entity Register_Arithmetic_Logic is
    Port ( In_Register : in  STD_LOGIC_VECTOR (31 downto 0);
           rst1 : in  STD_LOGIC;
			  CLK :  in std_logic;
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_Arithmetic_Logic;

architecture Behavioral of Register_Arithmetic_Logic is

	COMPONENT MUXRFSEU
	PORT(
		Crs2 : IN std_logic_vector(31 downto 0);
		SEUimm : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		Oper2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Register_File
	PORT(
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		DWR : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT SEU
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		SEUimm : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Unit_Arithmetic_Logic
	PORT(
		Oper1 : IN std_logic_vector(31 downto 0);
		Oper2 : IN std_logic_vector(31 downto 0);
		ALUOP : IN std_logic_vector(5 downto 0);
      C : IN std_logic;		
		ALUResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Unity_Control
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
		COMPONENT ProcessorStateRegister_Modifier
	PORT(
		reset : IN std_logic;
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2_mux : IN std_logic_vector(31 downto 0);
		aluResult : IN std_logic_vector(31 downto 0);
		aluop : IN std_logic_vector(5 downto 0);          
		NZVC : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
		COMPONENT ProcessorStateRegister
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		nCWP : IN std_logic;
		NZVC : IN std_logic_vector(3 downto 0);          
		cwp : OUT std_logic;
		C : OUT std_logic
		);
	END COMPONENT;
	
		COMPONENT Windows_Manager
	PORT(
		wrs1 : IN std_logic_vector(4 downto 0);
		wrs2 : IN std_logic_vector(4 downto 0);
		wrd : IN std_logic_vector(4 downto 0);
		wop : IN std_logic_vector(1 downto 0);
		wop3 : IN std_logic_vector(5 downto 0);
		CWP : IN std_logic;          
		wrsd12 : OUT std_logic_vector(17 downto 0);
		nCWP : OUT std_logic
		);
	END COMPONENT;
	
SIGNAL cualuop: STD_LOGIC_VECTOR(5 downto 0) := (others =>'0');
SIGNAL crs1oper1: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL crs2mux: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL muxoper2: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL seuimmmux: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL aluresultdwr: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL nzvc_psr: STD_LOGIC_VECTOR(3 downto 0) := (others =>'0');
SIGNAL C_ALU: STD_LOGIC:= '0';
SIGNAL w_cwp: STD_LOGIC:= '0';
SIGNAL w_ncwp: STD_LOGIC:= '0';
SIGNAL w_RF: STD_LOGIC_VECTOR(17 downto 0) := (others =>'0');

begin

	Inst_MUXRFSEU: MUXRFSEU PORT MAP(
		Crs2 => crs2mux,
		SEUimm => seuimmmux,
		i =>In_Register(13) ,
		Oper2 => muxoper2
	);

	Inst_Register_File: Register_File PORT MAP(
		rs1 => w_RF(17 downto 12),
		rs2 => w_RF(11 downto 6),
		rd => w_RF(5 downto 0),
		DWR => aluresultdwr,
		rst => rst1,
		crs1 => crs1oper1,
		crs2 => crs2mux
	);
	
	Inst_SEU: SEU PORT MAP(
		imm13 => In_Register(12 downto 0) ,
		SEUimm =>seuimmmux 
	);	
	
	Inst_Unit_Arithmetic_Logic: Unit_Arithmetic_Logic PORT MAP(
		Oper1 =>crs1oper1 ,
		Oper2 => muxoper2,
		ALUOP =>cualuop ,
		C=> C_ALU,
		ALUResult => aluresultdwr
	);	
	
	Inst_Unity_Control: Unity_Control PORT MAP(
		Op =>In_Register(31 downto 30),
		Op3 => In_Register(24 downto 19),
		ALUOP =>cualuop 
	);
	
		Inst_ProcessorStateRegister_Modifier: ProcessorStateRegister_Modifier PORT MAP(
		reset => rst1,
		Crs1 =>crs1oper1 ,
		Crs2_mux => muxoper2,
		aluResult => aluresultdwr,
		aluop => cualuop,
		NZVC => nzvc_psr
	);
	
		Inst_ProcessorStateRegister: ProcessorStateRegister PORT MAP(
		clk => CLK,
		reset => rst1,
		nCWP => w_ncwp,
		NZVC => nzvc_psr,
		cwp =>w_cwp ,
		C => C_ALU
	);
	
	
	Inst_Windows_Manager: Windows_Manager PORT MAP(
		wrs1 =>In_Register(18 downto 14),
		wrs2 =>In_Register(4 downto 0),
		wrd =>In_Register(29 downto 25),
		wop => In_Register(31 downto 30),
		wop3 => In_Register(24 downto 19),
		CWP =>w_cwp,
		wrsd12 =>w_RF,
		nCWP => w_ncwp
	);

	
	ALUResult<= aluresultdwr;
end Behavioral;

