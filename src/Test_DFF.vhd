------ testbench ------

------- 2 - Modifique el testbench para determinar: 
------- a) minimo periodo de reloj (o máxima frecuencia de trabajo): 1 ns
------- b) minimo ancho de pulso de preset y de clear: 0.001 ns == 1 ps (preset y clear) 
------- c) minimo tiempo de 'setup' y de 'hold' de datos: 0.0001 ns (setup) y 0.0000001 ns (hold)


entity Test_DFF is end;

architecture Driver of Test_DFF is 
	component DFF
	   port (Preset, Clear, Clock, Data: in Bit; Q, Qbar: out Bit);
	end component;
	signal Preset, Clear: Bit := '1';
	signal Clock, Data, Q, QBar: Bit;
begin
  UUT: DFF port map (Preset, Clear, Clock, Data, Q, Qbar);
--  Otro: Process(Clock)
--	Begin
--	  	 Data <= '1';
--	end process Otro;
	
  Stimulus: Process
	Begin
	-- inciso a): chequeo de minimo periodo de clock
	--	 Data <= '1'; wait for 10 ns;
	--	 Clock <= '0';
	--	 Clock <= '1', '0' after 1 ns; wait for 10 ns;

	
	
	-- inciso b):  chequeo de preset y clear	 
	--	Preset <= '1';
	--	Data <= '0';
	--	wait for 5 ns;
	--	
	--	Preset <= '0'; wait for 0.001 ns; 
	--	Preset <= '1'; wait for 5 ns;
	              
	--	Clear <= '1';
	--	Data <= '1';
	--	wait for 5 ns;
	--
	--	Clear <= '0'; wait for 0.001 ns; 
	--	Clear <= '1'; wait for 5 ns;
	

	
	-- inciso c):  chequeo de tiempo de setup y hold de datos		 
--		Clock <= '0';
--		Clear <= '1'; wait for 5 ns;
--		Clear <= '0'; wait for 1 ns; 
--		Clear <= '1'; wait for 4 ns;	
--	
--		Data <= '1'; wait for 0.9999999 ns;
--		Clock <= '1'; wait for 0.0000001 ns;
--		wait for 0.01 ns;
--		Data <= '0';

		Wait;
	end process Stimulus;
end;
