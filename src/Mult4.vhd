-------------------------------------------------------------------------------
--
-- Title       : Mult4
-- Design      : main
-- Author      : joaquin_gavernet
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : C:/Users/cocog/OneDrive/Documents/unlp/taller-arquitectura/tallerArquitectura/main/src/Mult4.vhd
-- Generated   : Mon Oct 28 20:53:50 2024
-- From        : Interface description file
-- By          : ItfToHdl ver. 1.0
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------



entity Mult4 is 
	port(A, B: in Bit_vector(3 downto 0); STB, CLK: in Bit;
		Result: out Bit_vector(7 downto 0); Done: out Bit); 
end Mult4;
		
architecture Mult4 of Mult4 is

	component ShiftN
		port (CLK: in  Bit;  CLR: in  Bit; LD: in  Bit; SH: in  Bit;  DIR: in  Bit; D: in Bit_Vector; Q: out  Bit_Vector);
	end component;
	
	component Adder8
		port (A, B: in Bit_Vector(7 downto 0); Cin: in Bit; Cout: out Bit; Sum: out Bit_Vector(7 downto 0));
	end component;
	
	component Controller
		port (STB, CLK, LSB, Stop: in Bit; Init, Shift, Add, Done: out  Bit);
	end component;
	
	component Accumulator
	   port (D: in Bit_Vector(7 downto 0); Clk, Clr, LD: in Bit; Q: out Bit_Vector(7 downto 0));
	end component;
	
	signal QA, QB, Sum, Res, A8, B8: Bit_Vector(7 downto 0);
	signal Init, Shift, Add, Stop, Trash: Bit;				
	
	function vec_NOR(input_vector: Bit_Vector) return Bit is
	    variable result: Bit := '1';  -- Start with '1' (true for NOR)
	begin
	    for i in input_vector'range loop
	        result := result and not input_vector(i);  -- Apply NOR logic
	    end loop;
	    return result;
	end vec_NOR;

begin					   
	A8 <= '0' & '0' & '0' & '0' & A(3 downto 0);
	B8 <= '0' & '0' & '0' & '0' & B(3 downto 0);
	SR1: ShiftN port map(CLK, '0', INIT, Shift, '0', A8, QA); -- SRA
	SR2: ShiftN port map(CLK, '0', INIT, Shift, '1', B8, QB); -- SRB
	Stop <= vec_NOR(QA); 
	Adder: Adder8 port map(Res, QB, '0', Trash, Sum);
	ACC: Accumulator port map(Sum, CLK, Init, Add, Res); 
	FSM_Controller: Controller port map(STB, CLK, QA(0), Stop, Init, Shift, Add, Done);
	Result <= Res; 
end Mult4;
