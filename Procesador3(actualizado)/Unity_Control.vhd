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
-- Modificado
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Unity_Control is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
			  Op2: in STD_LOGIC_VECTOR (2 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  cond: in STD_LOGIC_VECTOR (3 downto 0);
			  icc: in STD_LOGIC_VECTOR (3 downto 0);
			  RFDEST: out STD_LOGIC;
			  WRENMEM: out STD_LOGIC;
			  RDENMEM: out STD_LOGIC;
			  WE: out STD_LOGIC;
			  PCSOURCE: out STD_LOGIC_VECTOR (1 downto 0);
			  RFSOURSE: out STD_LOGIC_VECTOR (1 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end Unity_Control;

architecture Behavioral of Unity_Control is

	 
begin

process(Op,Op3, Op2,cond,icc)

begin
	if (Op = "01") then   ---instrucción CALL
		WRENMEM <= '0';
		RDENMEM <= '1';
		WE <= '1';
		RFDEST <= '1';
		RFSOURSE <= "10";
		PCSOURCE <= "01";
		ALUOP <= "111111";
	else
	 if (Op = "10") then
		  case Op3 is
		  
			 when "000001" =>   --AND
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000001"; 
					
			 when "000101" =>  --NAND
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000101";
					
			 when "000010" =>   --OR
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000010";
			
			 when "000110" =>  --NOR
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000110";
					
			 when "000011" => --XOR
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000011";
			 
			 when "000111" =>  --XNOR
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000111";
			 
			 when "000000" =>  --ADD
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000000";  
						
			 when "000100" =>  --SUB
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000100";
					
			 when "100101" =>  --SLL
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "100101";
					
			 when "100110" =>  --SLR
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "100110"; 
					
			 when "010000" =>  --ADDcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "010000";
					
			 when "010100" =>   --SUBcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "010100";
					
			 when "010001" => --ANDcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "010001";
					
			 when "010101" =>   --ANDNcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "010101";
					
			 when "010010" =>   --ORcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "010010";
					
			 when "010110" =>  --ORNcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "010110";
					
			 when "010011" =>  --XORcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "010011";
					
			 when "010111" =>  --XNORcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "010111";
					
			 when "001000" =>   --ADDx
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "001000";
					
			 when "001100" =>   --SUBx
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "001100";
					
			 when "011000" =>   --ADDxcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "011000";
					
			 when "011100" =>  --SUBxcc
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "011100";
					
			 when "111101" =>   --Restore
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000000";
					
			 when "111100" =>   --Save
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000000";
					
			when "111000" =>   -- Jump and line
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000000";
					
			 when others => ---others
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '0';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000000";
		  end case;
	else
		if (Op ="11") then
			case Op3 is
				when "000100" =>   -- Store
					WRENMEM <= '1';
					RDENMEM <= '1';
					WE <= '0';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000000";
					
				when "000000" =>   -- Load
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '1';
					RFDEST <= '0';
					RFSOURSE <= "00";
					PCSOURCE <= "00";
					ALUOP <= "000000";
					
				when others =>   -- others
					WRENMEM <= '0';
					RDENMEM <= '1';
					WE <= '0';
					RFDEST <= '0';
					RFSOURSE <= "01";
					PCSOURCE <= "00";
					ALUOP <= "000000";
			end case;
		else
			if(Op = "00") then
				if(Op2= "010") then ---Branch
					case cond is
						when "1000" =>  
							WRENMEM <= '0';
							RDENMEM <= '1';
							WE <= '0';
							RFDEST <= '0';
							RFSOURSE <= "00";
							PCSOURCE <= "10";
							ALUOP <= "111111";
							
						when "1001" =>  --- Branch on Not Equal -diferente
							if(not(icc(2)) = '1') then    ---not bit z
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "00";
								PCSOURCE <= "10";
								ALUOP <= "111111";
							else
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "00";
								ALUOP <= "111111";
							end if;
							
						when "0001" =>  --- Branch on  Equal -igual
							if(icc(2) = '1') then    --- bit z
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "10";
								ALUOP <= "111111";
							else
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "00";
								ALUOP <= "111111";
							end if; 
							
						when "1010" =>  --- Branch on  Greater -- Mayor que
							if(not(icc(2) or (icc(3) xor icc(1))) = '1') then    --- not(bit z or(N xor V))
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "10";
								ALUOP <= "111111";
							else
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "00";
								ALUOP <= "111111";
							end if;
							
						when "1011" =>  --- Branch on  Greater or Equal -- Mayor o igual que
							if(not(icc(3) xor icc(1)) = '1') then    --- not(N xor V)
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "10";
								ALUOP <= "111111";
							else
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "00";
								ALUOP <= "111111";
							end if; 
							
						when "0011" =>  --- Branch on  Less -- Menor que
							if((icc(3) xor icc(1)) = '1') then    --- (N xor V)
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "10";
								ALUOP <= "111111";
							else
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "00";
								ALUOP <= "111111";
							end if; 
						
						when "0010" =>  --- Branch on Less or Equal -- Menor o igual que
							if((icc(2) or (icc(3) xor icc(1))) = '1') then    --- Z or (N xor V)
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "10";
								ALUOP <= "111111";
							else
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "10";
								PCSOURCE <= "00";
								ALUOP <= "111111";
							end if; 
							
						when others =>  --others
								WRENMEM <= '0';
								RDENMEM <= '1';
								WE <= '0';
								RFDEST <= '0';
								RFSOURSE <= "00";
								PCSOURCE <= "00";
								ALUOP <= "111111";
					end case;
				
				else
					if(Op2 = "100") then
						WRENMEM <= '0';
						RDENMEM <= '1';
						WE <= '0';
						RFDEST <= '0';
						RFSOURSE <= "01";
						PCSOURCE <= "00";
						ALUOP <= "111111";
					end if;
				end if;
			end if;
		end if; 
	end if; 
end if;				

end process;


end Behavioral;

