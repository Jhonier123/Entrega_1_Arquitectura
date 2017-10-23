----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:09 10/19/2017 
-- Design Name: 
-- Module Name:    Windows_Manager - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity Windows_Manager is
    Port ( wrs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           wrs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           wrd : in  STD_LOGIC_VECTOR (4 downto 0);
           wop : in  STD_LOGIC_VECTOR (1 downto 0);
           wop3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CWP : in  STD_LOGIC;
           ---wrsd12 : out  STD_LOGIC_VECTOR (17 downto 0);
			  nwrs1 : out STD_LOGIC_VECTOR (5 downto 0);
			  nwrs2 : out STD_LOGIC_VECTOR (5 downto 0);
			  nwrd : out STD_LOGIC_VECTOR (5 downto 0);
           nCWP : out  STD_LOGIC);
end Windows_Manager;

architecture Behavioral of Windows_Manager is

signal wrs1Integer,wrs2Integer,wrdInteger: integer range 0 to 39:=0;
signal tmp_CWP: STD_LOGIC;

begin

process(CWP,wop,wop3,wrs1,wrs2,wrd,tmp_CWP)
	begin
		if(wop = "10") then
			if(wop3 = "111100")then--SAVE
				tmp_CWP <= '0';
			elsif(wop3 = "111101")then--RESTORE
				tmp_CWP <= '1';
			else
				tmp_CWP<=CWP;
			end if;
	end if;
		if(wrs1>="11000" and wrs1<="11111") then--Si es un registro de entrada (r[24] - r[31])
				wrs1Integer <= conv_integer(wrs1)-(conv_integer(CWP)*16);
		elsif(wrs1>="10000" and wrs1<="10111") then--Si es un registro de local (r[16] - r[23])
				wrs1Integer <= conv_integer(wrs1)+(conv_integer(CWP)*16);
		elsif(wrs1>="01000" and wrs1<="01111") then--Si es un registro de salida (r[8] - r[15])
				wrs1Integer <= conv_integer(wrs1)+ (conv_integer(CWP)*16);
		elsif(wrs1>="00000" and wrs1<="00111") then--Si es un registro global (r[0] - r[7])
				wrs1Integer <= conv_integer(wrs1);
		end if;
		
		if(wrs2>="11000" and wrs2<="11111") then--Si es un registro de entrada (r[24] - r[31])
				wrs2Integer <= conv_integer(wrs2)-(conv_integer(CWP)*16);
		elsif(wrs2>="10000" and wrs2<="10111") then--Si es un registro de local (r[16] - r[23])
				wrs2Integer <= conv_integer(wrs2)+(conv_integer(CWP)*16);
		elsif(wrs2>="01000" and wrs2<="01111") then--Si es un registro de salida (r[8] - r[15])
				wrs2Integer <= conv_integer(wrs2)+ (conv_integer(CWP)*16);
		elsif(wrs2>="00000" and wrs2<="00111") then--Si es un registro global (r[0] - r[7])
				wrs2Integer <= conv_integer(wrs2);
		end if;
		
		if(wrd>="11000" and wrd<="11111") then--Si es un registro de entrada (r[24] - r[31])
				wrdInteger <= conv_integer(wrd)-(conv_integer(tmp_CWP)*16);
		elsif(wrd>="10000" and wrd<="10111") then--Si es un registro de local (r[16] - r[23])
				wrdInteger <= conv_integer(wrd)+(conv_integer(tmp_CWP)*16);
		elsif(wrd>="01000" and wrd<="01111") then--Si es un registro de salida (r[8] - r[15])
				wrdInteger <= conv_integer(wrd)+ (conv_integer(tmp_CWP)*16);
		elsif(wrd>="00000" and wrd<="00111") then--Si es un registro global (r[0] - r[7])
				wrdInteger <= conv_integer(wrd);
		end if;
			
	end process;
	---wrsd12 <= conv_std_logic_vector(wrs1Integer, 6) & conv_std_logic_vector(wrs2Integer, 6) & conv_std_logic_vector(wrdInteger, 6);
	nwrs1 <= conv_std_logic_vector(wrs1Integer, 6);
	nwrs2 <= conv_std_logic_vector(wrs2Integer, 6);
	nwrd <= conv_std_logic_vector(wrdInteger, 6);
	nCWP <= tmp_CWP;
end Behavioral;
		


