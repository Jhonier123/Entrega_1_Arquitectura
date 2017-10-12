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
use IEEE.NUMERIC_STD.ALL;
---use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Unit_Arithmetic_Logic is
    Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Unit_Arithmetic_Logic;

architecture Behavioral of Unit_Arithmetic_Logic is

begin

process(Oper1,Oper2,ALUOP)

begin

case ALUOP is
when "000000" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) + SIGNED(Oper2));
when "000100" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) - SIGNED(Oper2));
when "000001" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) and SIGNED(Oper2));
when "000101" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) nand SIGNED(Oper2));
when "000010" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) or SIGNED(Oper2));
when "000110" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) nor SIGNED(Oper2));
when "000011" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) xor SIGNED(Oper2));
when "000111" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) xnor SIGNED(Oper2));
---when "100101" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) * SIGNED(Oper2));
when "100110" => ALUResult <= STD_LOGIC_VECTOR(SIGNED(Oper1) / SIGNED(Oper2));
when others => ALUResult <= (others => '1');
end case;
end process;
end Behavioral;

