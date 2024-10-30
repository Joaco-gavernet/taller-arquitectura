-- Parte B

-- Analizar y describir los efectos que producen los atributos o calificadores en las señales y las asignaciones.
-- Describa sentencia 'block'

-- TODO: a que se refiere la primer pregunta
-- Respuesta: 

entity Test_16 is
end Test_16;

architecture Behave_1 of Test_16 is
  signal  Source : NATURAL := 0;
  signal  Destination_1 : NATURAL := 0;
  signal  Destination_2 : NATURAL := 0;
  signal  Destination_3 : NATURAL := 0;
  signal  Destination_4 : NATURAL := 0;
  signal  Clock : BIT := '0';
begin

  Blck_Test_1:
  block (Clock = '1' and Clock'EVENT)
  begin
      Destination_1 <= guarded Source;
      Destination_2 <= Source;
  end block Blck_Test_1;

  Blck_Test_2:
  block (Clock = '1' and (not Clock'STABLE))
  begin
      Destination_3 <= guarded Source;
      Destination_4 <= Source;
  end block Blck_Test_2;

  Tick_Tock:
  process
  begin
    wait for 10 ns;
    Clock <= not Clock;
  end process Tick_Tock; 

  Source_Wave: Source <= 1 after 8 ns,
                         2 after 15 ns,
                         3 after 16 ns,
                         4 after 17 ns,
                         5 after 18 ns,
                         6 after 19 ns; 
end Behave_1;
