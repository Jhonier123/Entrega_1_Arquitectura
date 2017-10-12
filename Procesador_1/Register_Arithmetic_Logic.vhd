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
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
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

SIGNAL cualuop: STD_LOGIC_VECTOR(5 downto 0) := (others =>'0');
SIGNAL crs1oper1: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL crs2mux: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL muxoper2: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL seuimmmux: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL aluresultdwr: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');


begin

	Inst_MUXRFSEU: MUXRFSEU PORT MAP(
		Crs2 => crs2mux,
		SEUimm => seuimmmux,
		i =>In_Register(13) ,
		Oper2 => muxoper2
	);

	Inst_Register_File: Register_File PORT MAP(
		rs1 => In_Register(18 downto 14),
		rs2 => In_Register(4 downto 0),
		rd => In_Register(29 downto 25),
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
		ALUResult => aluresultdwr
	);	
	
	Inst_Unity_Control: Unity_Control PORT MAP(
		Op =>In_Register(31 downto 30),
		Op3 => In_Register(24 downto 19),
		ALUOP =>cualuop 
	);
	
	ALUResult<= aluresultdwr;
end Behavioral;

