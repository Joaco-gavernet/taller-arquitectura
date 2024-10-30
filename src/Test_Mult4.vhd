-------------------------------------------------------------------------------
--
-- Title       : Test_Mult4
-- Design      : main
-- Author      : joaquin_gavernet
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : C:/Users/cocog/OneDrive/Documents/unlp/taller-arquitectura/tallerArquitectura/main/src/Test_Mult4.vhd
-- Generated   : Sun Oct 27 23:32:43 2024
-- From        : Interface description file
-- By          : ItfToHdl ver. 1.0
--
-------------------------------------------------------------------------------
--
-- Description : This test multiplies two numbers of 4 bits each. 
--
-------------------------------------------------------------------------------

entity Test_Mult4 is end Test_Mult4;

architecture Test_Mult4 of Test_Mult4 is
use work.Utils.all; 
component Mult4 
	port(A, B: in Bit_vector(3 downto 0); STB, CLK: in Bit;
	Result: out Bit_vector(7 downto 0); Done: out Bit); 
end component; 
signal CLK, Done, STB: Bit; 
signal A, B: Bit_vector(3 downto 0); 
signal Result: Bit_vector(7 downto 0); 

begin		   
	Clock(CLK, 7ns, 7ns); 	
	A <= Convert(2,4); 
	B <= Convert(9,4); 
	STB <= '0', '1' after 30ns; 
	mult: Mult4 port map(A,B,STB,CLK,Result,Done);
	assert (Done = '0' or STB = '1') report "Simulacion finalizada. " severity Failure;  	
end Test_Mult4;
