---- testbench 
--- Simule y haga las modificaciones que correspondan en el testbench, para 
---  que la sentencia assert despliegue un reporte de error.	

-- Respuesta: Cada vector (linea 25) describe los valores X, Y, Cin y sus correspondientes salidas Sum y Cout.
-- 			  modificando algun valor tal que no se cumpla la tabla de verdad, el assert despliega mensaje de error. 

---------------Testbench---------------
entity test_sumador is
end;

architecture driver of test_sumador is
component fulladder
 port (X, Y, Cin: in Bit; Cout, Sum: out Bit);
end component;
signal X, Y, Cin, Cout, Sum: Bit;
begin
 uut: fulladder port map (X, Y, Cin, Cout, Sum);
 estimulo: process
	type Entry is record
	 X, Y, Cin: Bit;
	 Cout, Sum: Bit;
	end record;
	type Table is array (0 to 7) of Entry;
	constant Tabla: Table:=
	(('0', '0', '0', '0', '0'),	
	 ('0', '0', '1', '0', '1'),
	 ('0', '1', '0', '0', '1'),
	 ('0', '1', '1', '1', '0'),
	 ('1', '0', '0', '0', '1'),
	 ('1', '0', '1', '1', '0'),
	 ('1', '1', '0', '1', '0'),
	 ('1', '1', '1', '1', '1')
	);
 begin
	for i in Tabla'range loop
	 X <= Tabla(i).X;
	 Y <= Tabla(i).Y;
	 Cin <= Tabla(i).Cin;
	 wait for 1 ns;
	 assert
	  Cout = Tabla(i).Cout and
	  Sum = Tabla(i).Sum;
	end loop;
	wait;
 end process;
end;

