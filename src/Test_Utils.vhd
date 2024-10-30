---- Compilar el package y simular el testbench. 
---  a) Describir el funcionamiento de los atributos de tipos ('Val) y de arreglos ('Left y 'Right) predefinidos
----- usados en el package body
---  b) En el testbench hay 3 declaraciones USE exactamente idénticas. Analizar y determinar cuál o cuáles ------- de esas sentencias pueden sacarse sin que se afecte el uso y funcionamiento de los subprogramas del 
----- package.
--- c) ¿Cómo el compilador VHDL se dá cuenta a cual función "Convert" debe llamar en el testbench? 


--------------------------Testbench-------------------------

entity Test_Utils is end;

use work.Utils.all;

architecture Driver of Test_Utils is
  signal N: Natural;
  signal B: Bit_Vector(5 downto 0);
  signal C: Bit;

begin

  CLK: Clock(C, 10 ns, 10 ns);
  
  process
  begin  
    for i in 0 to 31 loop
            B <= Convert (i, B'Length) after 10 ns;
            wait for 10 ns;
        end loop;
        wait;
  end process;

  N <= Convert (B) after 1 ns;

end;

