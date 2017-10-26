----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:14:02 10/18/2017 
-- Design Name: 
-- Module Name:    ProcessorStateRegister_Modifier - Behavioral 
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


entity ProcessorStateRegister_Modifier is
    Port ( reset : in  STD_LOGIC;
           Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2_mux : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end ProcessorStateRegister_Modifier;

architecture Behavioral of ProcessorStateRegister_Modifier is

begin
process(Crs1,Crs2_mux, aluResult, aluop)
begin

	if (reset='1') then
		NZVC <= "0000";
	else
	
		-- ADDcc y ADDXcc
		if(( aluop ="010000") or (aluop ="011000")) then
			NZVC(3) <= aluResult(31);
			if(aluResult = "00000000000000000000000000000000") then 
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (Crs1(31) and Crs2_mux(31) and not(aluResult(31))) or (not(Crs1(31)) and not(Crs2_mux(31)) and aluResult(31)); --Ver pseudocódigo en el manual
			NZVC(0) <= (Crs1(31) and Crs2_mux(31)) or (not(aluResult(31)) and (Crs1(31) or Crs2_mux(31)));
			end if;
		
		-- SUBcc y SUBXcc
		if((aluop="010100") or (aluop= "011100")) then
			NZVC(3) <= aluResult(31);
			if(aluResult = "00000000000000000000000000000000") then 
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (Crs1(31) and not(Crs2_mux(31)) and not(aluResult(31))) or (not(Crs1(31)) and Crs2_mux(31) and aluResult(31)); --Ver pseudocódigo en el manual
			NZVC(0) <= (not(Crs1(31)) and Crs2_mux(31)) or (aluResult(31) and (not(Crs1(31)) or Crs2_mux(31)));
		end if;
		
		-- ANDcc, ANDNcc, ORcc, ORNcc, XORcc, XNORcc
		if((aluop="010001") or (aluop ="010101") or (aluop = "010010") or (aluop="010110") or (aluop="010011")
			or(aluop= "010111")) then
			NZVC(3) <= aluResult(31);
			if (aluResult= "00000000000000000000000000000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		end if; 
	end if;
end process;


end Behavioral;

