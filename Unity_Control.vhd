----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:33 09/28/2017 
-- Design Name: 
-- Module Name:    Unity_Control - Behavioral 
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

entity Unity_Control is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end Unity_Control;

architecture Behavioral of Unity_Control is

	 
begin

process(Op,Op3)

begin
 if (Op = "10") then
     case Op3 is
	    when "000001" => ALUOP <= "000001"; --AND
		 when "000101" => ALUOP <= "000101"; --NAND
       when "000010" => ALUOP <= "000010"; --OR
		 when "000110" => ALUOP <= "000110"; --NOR
       when "000011" => ALUOP <= "000011"; --XOR
		 when "000111" => ALUOP <= "000111"; --XNOR
       when "000000" => ALUOP <= "000000"; --ADD
       when "000100" => ALUOP <= "000100"; --SUB
       when "100101" => ALUOP <= "100101"; --SLL
       when "100110" => ALUOP <= "100110"; --SLR
		 when others => ALUOP <= "111111"; 
	  end case;
	end if;
end process;


end Behavioral;

