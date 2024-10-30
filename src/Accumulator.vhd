

entity Accumulator is
   port (D: in Bit_Vector(7 downto 0); Clk, Clr, LD: in Bit; Q: out Bit_Vector(7 downto 0));
end Accumulator;

architecture acc of Accumulator is
begin	
	acc: process(Clk)
	begin
		if Clk'Event and Clk = '1' then 
			if Clr = '1' then 
				Q <= (others => '0'); 
			elsif LD = '1' then
				Q <= D;
			end if;
		end if;
	end process; 
end;

