---- Simule la entidad Adder8 y el testbench provisto. 
---  ¿es necesario agregar una sentencia assert para desplegar algún reporte en el testbench?. 
---  Justifique la respuesta.

--------------------Testbench -------------------------------

entity Test_Adder8 is end;

architecture Driver of Test_Adder8 is
          component Adder8
            port (A, B: in Bit_Vector(7 downto 0); Cin: in Bit; Cout: out Bit; Sum: out Bit_Vector(7 downto 0));
          end component;
          signal A, B, Sum: Bit_Vector(7 downto 0);
          signal Cin, Cout: Bit := '0';
begin
         UUT: Adder8 port map (A, B, Cin, Cout, Sum);
    Stimulus: process
                variable Temp: Bit_Vector(7 downto 0);
            begin
                Temp := "00000000";
                for i in 1 to 32 loop
                  if i mod 2 /= 1 then
                    A <= Temp; B <= "00000001";
                  else
                    B <= Temp; A <= "00000001";
                  end if;
                  wait for 1 ns;
--				  assert Temp = Sum report "Load failed";
                  Temp := Sum;
                end loop;
                wait; -- to terminate simulation
            end process;
end;
