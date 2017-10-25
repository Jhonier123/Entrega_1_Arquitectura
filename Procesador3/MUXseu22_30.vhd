----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:46 10/24/2017 
-- Design Name: 
-- Module Name:    MUXseu22_30 - Behavioral 
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



entity MUXseu22_30 is
    Port ( PC_disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_SEUdisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUresult : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSOURCE : in  STD_LOGIC_VECTOR (1 downto 0);
           MUX_nPC : out  STD_LOGIC_VECTOR (31 downto 0));
end MUXseu22_30;

architecture Behavioral of MUXseu22_30 is

begin
	process(PC_disp30, PC_SEUdisp22, PC,ALUresult, PCSOURCE)
	begin
		case PCSOURCE is
			when "00" => MUX_nPC <= PC;            ---- pasa PC
			when "01" => MUX_nPC <= PC_disp30;     ---- Pasa Call
			when "10" => MUX_nPC <= PC_SEUdisp22;  ---- Pasa Branch
			when "11" => MUX_nPC <= ALUresult;     ---- Pasa Jmpl
			when others => MUX_nPC <= (others =>'0');
		end case;
		
	end process;
	
end Behavioral;

