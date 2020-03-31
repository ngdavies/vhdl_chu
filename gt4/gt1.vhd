-- gate level implementation of a one bit greater than

library ieee;
use ieee.std_logic_1164.all;

entity gt1 is
  port(
    a,b: in std_logic;
    gt: out std_logic
  );
end gt1;

architecture sop_arch of gt1 is
begin
  gt <= a and not(b);
end sop_arch;
