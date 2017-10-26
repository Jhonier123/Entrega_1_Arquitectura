----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:36:57 10/05/2017 
-- Design Name: 
-- Module Name:    Unit_Arithmetic_Logic - Behavioral 
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
use IEEE.STD_LOGIC_signed.ALL;
---use IEEE.STD_LOGIC_UN.ALL;

entity Unit_Arithmetic_Logic is
    Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
			  C: in std_logic;
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));

end Unit_Arithmetic_Logic;

architecture Behavioral of Unit_Arithmetic_Logic is

begin

process(Oper1,Oper2,ALUOP)

begin

case ALUOP is
when "000000" => ALUResult <= STD_LOGIC_VECTOR( Oper1 +  Oper2);
when "000100" => ALUResult <= STD_LOGIC_VECTOR((Oper1) - (Oper2));
when "000001" => ALUResult <= STD_LOGIC_VECTOR((Oper1) and (Oper2));
when "000101" => ALUResult <= STD_LOGIC_VECTOR((Oper1) and (not (Oper2)));
when "000010" => ALUResult <= STD_LOGIC_VECTOR((Oper1) or (Oper2));
when "000110" => ALUResult <= STD_LOGIC_VECTOR((Oper1) or (not(Oper2)));
when "000011" => ALUResult <= STD_LOGIC_VECTOR((Oper1) xor (Oper2));
when "000111" => ALUResult <= STD_LOGIC_VECTOR((Oper1) xnor (Oper2));
when "100101" => ALUResult <= to_stdlogicvector(to_bitvector(Oper1) SLL conv_integer(Oper2));
when "100110" => ALUResult <= to_stdlogicvector(to_bitvector(Oper1) SRL conv_integer(Oper2));
when "010000" => ALUResult <= STD_lOGIC_VECTOR((Oper1) + (Oper2)); --ADDcc
when "010100" => ALUResult <= STD_lOGIC_VECTOR((Oper1) - (Oper2)); --SUBcc
when "010001" => ALUResult <= STD_lOGIC_VECTOR((Oper1) and (Oper2)); --ANDcc
when "010101" => ALUResult <= STD_lOGIC_VECTOR((Oper1)and (not(Oper2))); --ANDNcc
when "010010" => ALUResult <= STD_lOGIC_VECTOR((Oper1) or (Oper2)); --ORcc
when "010110" => ALUResult <= STD_lOGIC_VECTOR((Oper1) or (not(Oper2))); --ORNcc
when "010011" => ALUResult <= STD_lOGIC_VECTOR((Oper1) xor (Oper2)); --XORcc
when "010111" => ALUResult <= STD_lOGIC_VECTOR((Oper1) xnor (Oper2)); --XNORcc
when "001000" => ALUResult <= STD_lOGIC_VECTOR((Oper1) + (Oper2)+C); --ADDX
when "001100" => ALUResult <= STD_lOGIC_VECTOR((Oper1) - (Oper2)-C); --SUBx
when "011000" => ALUResult <= STD_lOGIC_VECTOR((Oper1) + (Oper2)+C); --ADDxcc
when "011100" => ALUResult <= STD_lOGIC_VECTOR((Oper1) - (Oper2)-C); --SUBxcc
when others => ALUResult <= (others => '1');
end case;
end process;
end Behavioral;

