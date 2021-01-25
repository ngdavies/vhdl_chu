library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec2to4_tb is
end entity dec2to4_tb;

architecture tb_arch of dec2to4_tb is
  signal en_tb : std_logic;
  signal sel_tb : std_logic_vector(1 downto 0);
  signal y_tb : std_logic_vector(3 downto 0);
  signal this_fail : std_logic := '0';
  signal total_fail : std_logic := '0';
  signal done : std_logic := '0';
begin

  DEC : entity work.dec2to4
    port map(
      en => en_tb,
      sel => sel_tb,
      y => y_tb
    );

  -- test vector generator
  process
  begin
    en_tb <= '0';
    sel_tb <= "00";
    wait for 2 ns;
    this_fail <= y_tb(3) or y_tb(2) or y_tb(1) or y_tb(0);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '0';
    sel_tb <= "01";
    wait for 2 ns;
    this_fail <= y_tb(3) or y_tb(2) or y_tb(1) or y_tb(0);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '0';
    sel_tb <= "10";
    wait for 2 ns;
    this_fail <= y_tb(3) or y_tb(2) or y_tb(1) or y_tb(0);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '0';
    sel_tb <= "11";
    wait for 2 ns;
    this_fail <= y_tb(3) or y_tb(2) or y_tb(1) or y_tb(0);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '1';
    sel_tb <= "00";
    wait for 2 ns;
    this_fail <= y_tb(3) or y_tb(2) or y_tb(1) or not y_tb(0);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '1';
    sel_tb <= "01";
    wait for 2 ns;
    this_fail <= y_tb(3) or y_tb(2) or not y_tb(1) or y_tb(0);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '1';
    sel_tb <= "10";
    wait for 2 ns;
    this_fail <= y_tb(3) or not y_tb(2) or y_tb(1) or y_tb(0);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '1';
    sel_tb <= "11";
    wait for 2 ns;
    this_fail <= not y_tb(3) or y_tb(2) or y_tb(1) or y_tb(0);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    done <= '1';
    wait for 2 ns;

    -- terminate simulation
    assert total_fail = '0'
    report "Simulation completed without failure"
    severity failure;
    assert total_fail = '1'
    report "Simulation completed with failure"
    severity failure;
  end process;
end architecture tb_arch;
