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
    Port ( In_Register : in  STD_LOGIC_VECTOR (31 downto 0);--- salida de instrution memory
			  In_PC : in STD_LOGIC_VECTOR (31 downto 0);
			  In_sumador: in STD_LOGIC_VECTOR (31 downto 0);
           rst1 : in  STD_LOGIC;
			  CLK :  in std_logic;
           MuxRF : out  STD_LOGIC_VECTOR (31 downto 0);  ---ALUResult= MuxRF salida principal
			  MuxPC : out STD_LOGIC_VECTOR (31 downto 0)); --- Salida auxiliar
			  
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
		nrs1 : IN std_logic_vector(5 downto 0);
		nrs2 : IN std_logic_vector(5 downto 0);
		nrd : IN std_logic_vector(5 downto 0);
		DATATOREG : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		WE : IN std_logic;          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0);
		cRD : OUT std_logic_vector(31 downto 0)
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
		Op2 : IN std_logic_vector(2 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);
		cond : IN std_logic_vector(3 downto 0);
		icc : IN std_logic_vector(3 downto 0);          
		RFDEST : OUT std_logic;
		WRENMEM : OUT std_logic;
		RDENMEM : OUT std_logic;
		WE : OUT std_logic;
		PCSOURCE : OUT std_logic_vector(1 downto 0);
		RFSOURSE : OUT std_logic_vector(1 downto 0);
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
		C : OUT std_logic;
		icc : OUT std_logic_vector(3 downto 0)
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
		nwrs1 : OUT std_logic_vector(5 downto 0);
		nwrs2 : OUT std_logic_vector(5 downto 0);
		nwrd : OUT std_logic_vector(5 downto 0);
		nCWP : OUT std_logic;
		Register7 : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	
	
	
	COMPONENT Data_Memory
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		RDENMEM : IN std_logic;
		WRENMEM : IN std_logic;
		cRD : IN std_logic_vector(31 downto 0);
		ALUresult : IN std_logic_vector(31 downto 0);          
		DATATOMEM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX_DMalu
	PORT(
		DATATOMEM : IN std_logic_vector(31 downto 0);
		ALUresult : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		RFSOURCE : IN std_logic_vector(1 downto 0);          
		DATATOREG : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	COMPONENT MUX_WM_RF
	PORT(
		RD : IN std_logic_vector(5 downto 0);
		num15 : IN std_logic_vector(5 downto 0);
		RFDEST : IN std_logic;          
		nRD : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT MUXseu22_30
	PORT(
		PC_disp30 : IN std_logic_vector(31 downto 0);
		PC_SEUdisp22 : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		ALUresult : IN std_logic_vector(31 downto 0);
		PCSOURCE : IN std_logic_vector(1 downto 0);          
		MUX_nPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Sign_extension_unit_22
	PORT(
		disp22 : IN std_logic_vector(21 downto 0);          
		seu32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Sign_extension_unit_30
	PORT(
		disp30 : IN std_logic_vector(29 downto 0);          
		seu32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



COMPONENT sumador
	PORT(
		oper1 : IN std_logic_vector(31 downto 0);
		oper2 : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



	

--------------------------------------------nuevas------------------------	
--windows manager -de donde salen
SIGNAL wm_rd : STD_LOGIC_VECTOR(5 downto 0) := (others =>'0');
SIGNAL wm_15 : STD_LOGIC_VECTOR(5 downto 0) := (others =>'0');
SIGNAL w_ncwp: STD_LOGIC:= '0';
SIGNAL nWRS1_RF: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
SIGNAL nWRS2_RF: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
---mux RD15 de donde salen
SIGNAL nRD_RF : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
----unit control de donde salen
SIGNAL SelRFDEST : STD_LOGIC := '0';
SIGNAL SelRFSOURCE: STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
SIGNAL WR_CU_DM: STD_LOGIC := '0';
SIGNAL RD_CU_DM: STD_LOGIC := '0';
SIGNAL SelPCSOURCE : STD_LOGIC_VECTOR(1 downto 0) := (others =>'0');
SIGNAL cualuop: STD_LOGIC_VECTOR(5 downto 0) := (others =>'0');
SIGNAL weRegister:  STD_LOGIC := '0';
---data Memory
SIGNAL DataMux:  STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
----alu
SIGNAL aluDM: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
----Refister file
SIGNAL crs1AluPM : STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL crs2mux : STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL cRD_DM: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
----mux seu
SIGNAL seuimmmux: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
SIGNAL muxoper2: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
---mux aluDM
SIGNAL muxResult : STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
----PSR
SIGNAL cwp_WM: STD_LOGIC := '0';
SIGNAL C_ALU: STD_LOGIC:= '0';
SIGNAL icc_CU: STD_LOGIC_VECTOR(3 downto 0) := (others =>'0');
----psr modifier
SIGNAL nzvc_psr: STD_LOGIC_VECTOR(3 downto 0) := (others =>'0');
----seu disp22
SIGNAL seuSum1 : STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
----seu disp 30
SIGNAL seuSum2: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
---sumador1
SIGNAL PCdisp22: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
---sumador2
SIGNAL PCdisp30: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
----mux PC's disp22 y 30
SIGNAL salidamux: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');
--------------------------------------------------------------------------	



--SIGNAL muxoper2: STD_LOGIC_VECTOR(31 downto 0) := (others =>'0');


--SIGNAL nzvc_psr: STD_LOGIC_VECTOR(3 downto 0) := (others =>'0');

SIGNAL w_cwp: STD_LOGIC:= '0';
SIGNAL w_RF: STD_LOGIC_VECTOR(17 downto 0) := (others =>'0');
----SIGNAL NWRS1_RF: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
----SIGNAL NWRS2_RF: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
SIGNAL NWRD_RF: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');

begin

	Inst_MUXRFSEU: MUXRFSEU PORT MAP(
		Crs2 => crs2mux,
		SEUimm => seuimmmux,
		i =>In_Register(13) ,
		Oper2 => muxoper2
	);

	Inst_Register_File: Register_File PORT MAP(
		nrs1 => nWRS1_RF,
		nrs2 => nWRS2_RF,
		nrd => nRD_RF,
		DATATOREG => muxResult ,
		rst => rst1,
		WE => weRegister,
		crs1 => crs1AluPM ,
		crs2 => crs2mux,
		cRD => cRD_DM
	);
	
	Inst_SEU: SEU PORT MAP(
		imm13 => In_Register(12 downto 0) ,
		SEUimm =>seuimmmux 
	);	
	
	Inst_Unit_Arithmetic_Logic: Unit_Arithmetic_Logic PORT MAP(
		Oper1 => crs1AluPM ,
		Oper2 => muxoper2,
		ALUOP =>cualuop ,
		C=> C_ALU,
		ALUResult => aluDM
	);	
	
	
	Inst_Unity_Control: Unity_Control PORT MAP(
		Op =>  In_Register(31 downto 30),
		Op2 =>  In_Register (24 downto 22),
		Op3 =>  In_Register(24 downto 19),
		cond =>  In_Register(28 downto 25),
		icc => icc_CU,
		RFDEST =>SelRFDEST ,
		WRENMEM => WR_CU_DM,
		RDENMEM =>RD_CU_DM ,
		WE => weRegister ,
		PCSOURCE => SelPCSOURCE,
		RFSOURSE => SelRFSOURCE,
		ALUOP => cualuop
	);
	
		Inst_ProcessorStateRegister_Modifier: ProcessorStateRegister_Modifier PORT MAP(
		reset => rst1,
		Crs1 => crs1AluPM ,
		Crs2_mux =>  muxoper2,
		aluResult => aluDM,
		aluop => cualuop,
		NZVC => nzvc_psr
	);
	
		Inst_ProcessorStateRegister: ProcessorStateRegister PORT MAP(
		clk => clk,
		reset =>rst1 ,
		nCWP => w_ncwp,
		NZVC =>nzvc_psr ,
		cwp => cwp_WM,
		C => C_ALU,
		icc => icc_CU
	);
	
	
	Inst_Windows_Manager: Windows_Manager PORT MAP(
		wrs1 =>  In_Register(18 downto 14),
		wrs2 =>  In_Register(4 downto 0),
		wrd =>  In_Register(29 downto 25),
		wop =>  In_Register(31 downto 30),
		wop3 =>  In_Register(24 downto 19) ,
		CWP => cwp_WM,
		nwrs1 =>nWRS1_RF ,
		nwrs2 => nWRS2_RF,
		nwrd => wm_rd,
		nCWP => w_ncwp,
		Register7 =>  wm_15
	);
	
	-----desde aquí
	Inst_Data_Memory: Data_Memory PORT MAP(
		clk => clk,
		reset => rst1,
		RDENMEM => RD_CU_DM ,
		WRENMEM => WR_CU_DM,
		cRD => cRD_DM,
		ALUresult => aluDM,
		DATATOMEM => DataMux
	);
	
	Inst_MUX_DMalu: MUX_DMalu PORT MAP(
		DATATOMEM => DataMux,
		ALUresult => aluDM ,
		PC => In_PC,
		RFSOURCE => SelRFSOURCE ,
		DATATOREG => muxResult 
	);

	Inst_MUX_WM_RF: MUX_WM_RF PORT MAP(
		RD => wm_rd,
		num15 =>wm_15 ,
		RFDEST => SelRFDEST,
		nRD =>nRD_RF
	);
	
	Inst_MUXseu22_30: MUXseu22_30 PORT MAP(
		PC_disp30 => PCdisp30,
		PC_SEUdisp22 => PCdisp22,
		PC => In_sumador,
		ALUresult => aluDM,
		PCSOURCE => SelPCSOURCE,
		MUX_nPC => salidamux
	);
	
	Inst_Sign_extension_unit_22: Sign_extension_unit_22 PORT MAP(
		disp22 =>  In_Register(21 downto 0),
		seu32 => seuSum1
	);
	
	Inst_Sign_extension_unit_30: Sign_extension_unit_30 PORT MAP(
		disp30 => In_Register(29 downto 0),
		seu32 => seuSum2
	);
	
	Inst_sumador1: sumador PORT MAP(
		oper1 => In_PC,
		oper2 => seuSum1,
		resultado => PCdisp22
	);
	
	Inst_sumador2: sumador PORT MAP(
		oper1 => seuSum2,
		oper2 => In_PC ,
		resultado => PCdisp30
	);
	
	MuxRF<= muxResult;
	MuxPC <=salidamux;
end Behavioral;

