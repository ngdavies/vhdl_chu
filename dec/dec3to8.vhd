library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec3to8 is
  port(
    en3to8 : in std_logic;
    sel3to8 : in std_logic_vector(2 downto 0);
    y3to8 : out std_logic_vector(7 downto 0) := (others => '0')
  );
end entity dec3to8;

architecture RTL of dec3to8 is
  signal u : std_logic_vector(1 downto 0) := (others => '0');
  signal w : std_logic_vector(3 downto 0);
  --  signal sel2 : std_logic_vector(1 downto 0);
begin
  --  sel2 <= '0' & sel(2);
  A2 : entity work.dec2to4
    port map(
      en => en3to8,
      sel => u, --sel2,   -- sel(2 downto 0),
      y => w
    );

  A10 : for I in 1 downto 0 generate
    D24 : entity work.dec2to4
      port map(
        en => w(I),
        sel => sel3to8(1 downto 0),
        y => y3to8(I * 4 + 3 downto I * 4)
      );
  end generate A10;

  u(0) <= sel3to8(2);
end architecture RTL;
