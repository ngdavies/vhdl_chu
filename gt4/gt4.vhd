-- gate level implementation of a 4 bit greater than
library ieee;
use ieee.std_logic_1164.all;

entity gt4 is
  port(
    a, b : in std_logic_vector(3 downto 0);
    agtb : out std_logic
  );
end gt4;

-- structural description of a 2-bit comparator
architecture struc_arch of gt4 is
  signal eq : std_logic_vector(3 downto 1);
  signal gt : std_logic_vector(3 downto 0);
begin
  EQS : for I in 1 to 3 generate
    EQBIT : entity work.eq1(sop_arch)
      port map(
        i0 => a(I),
        i1 => b(I),
        eq => eq(I)
      );
  end generate EQS;

  GTS : for J in 0 to 3 generate
    GTBIT : entity work.gt1(sop_arch)
      port map(
        a => a(J),
        b => b(J),
        gt => gt(J)
      );
  end generate GTS;

  -- a is greater if ms bit is greater or
  -- all ms bit(s) are equal and this bit is greater
  agtb <= gt(3) 
  or (eq(3) and (gt(2) 
  	or (eq(2) and (gt(1) 
  		or (eq(1) and gt(0))
  	))
  ));
end struc_arch;

