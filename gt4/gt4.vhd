-- gate level implementation of a 4 bit greater than
library ieee;
use ieee.std_logic_1164.all;

entity gt4 is
  port(
    a,b: in std_logic_vector(3 downto 0);
    agtb: out std_logic
  );
end gt4;


-- structural description of a 2-bit comparator
architecture struc_arch of gt4 is
  signal eq : std_logic_vector(3 downto 1);
  signal gt : std_logic_vector(3 downto 0);
begin
  -- instantiate two 1-bit comparators
  eq_bit3_unit: entity work.eq1(sop_arch)
    port map(
      i0 => a(3),
      i1 => b(3),
      eq => eq(3)
    );
  eq_bit2_unit: entity work.eq1(sop_arch)
    port map(
      i0 => a(2),
      i1 => b(2),
      eq => eq(2)
    );
  eq_bit1_unit: entity work.eq1(sop_arch)
    port map(
      i0 => a(1),
      i1 => b(1),
      eq => eq(1)
    );
  gt_bit3_unit: entity work.gt1(sop_arch)
    port map(
      a => a(3),
      b => b(3),
      gt => gt(3)
    );
  gt_bit2_unit: entity work.gt1(sop_arch)
    port map(
      a => a(2),
      b => b(2),
      gt => gt(2)
    );
  gt_bit1_unit: entity work.gt1(sop_arch)
    port map(
      a => a(1),
      b => b(1),
      gt => gt(1)
    );
  gt_bit0_unit: entity work.gt1(sop_arch)
    port map(
      a => a(0),
      b => b(0),
      gt => gt(0)
    );
  -- a is greater if ms bit is greater or
  -- all ms bit(s) are equal and this bit is greater
  
  agtb <= gt(3) or (eq(3) and (gt(2) or (eq(2) and (gt(1) or (eq(1) and gt(0))))));
end struc_arch;




