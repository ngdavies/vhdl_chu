library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec2to4 is
  port(
    en : in std_logic;
    sel : in std_logic_vector(1 downto 0);
    y : out std_logic_vector(3 downto 0) := (others => '0')
  );
end entity dec2to4;

architecture combo of dec2to4 is
  
begin
  y(0) <= '1' when en = '1' and sel = "00" else '0';
  y(1) <= '1' when en = '1' and sel = "01" else '0';
  y(2) <= '1' when en = '1' and sel = "10" else '0';
  y(3) <= '1' when en = '1' and sel = "11" else '0';
end architecture combo;
