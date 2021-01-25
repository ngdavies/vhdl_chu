library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec3to8_tb is
end entity dec3to8_tb;

architecture tb_arch of dec3to8_tb is
  signal en_tb : std_logic;
  signal sel_tb : std_logic_vector(2 downto 0);
  signal y_tb, z_tb : std_logic_vector(7 downto 0) := (others => '0');
  signal this_fail : std_logic := '0';
  signal total_fail : std_logic := '0';
  signal done : std_logic := '0';
begin

  DEC : entity work.dec3to8
    port map(
      en3to8 => en_tb,
      sel3to8 => sel_tb,
      y3to8 => y_tb
    );

  
  
  -- test vector generator
  process

    function or_reduct(slv : in std_logic_vector) return std_logic is
      variable res_v : std_logic;
    begin
      res_v := '0';
      for i in slv'range loop
        res_v := res_v or slv(i);
      end loop;
      return res_v;
    end function;

  begin

    en_tb <= '1';
    sel_tb <= "000";
    wait for 2 ns;
    z_tb <= y_tb;
    z_tb(0) <= not y_tb(0);
    this_fail <= or_reduct(z_tb);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '1';
    sel_tb <= "001";
    wait for 2 ns;
    z_tb <= y_tb;
    z_tb(1) <= not y_tb(1);
    this_fail <= or_reduct(z_tb);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '1';
    sel_tb <= "100";
    wait for 2 ns;
    z_tb <= y_tb;
    z_tb(4) <= not y_tb(4);
    this_fail <= or_reduct(z_tb);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '1';
    sel_tb <= "111";
    wait for 2 ns;
    z_tb <= y_tb;
    z_tb(7) <= not y_tb(7);
    this_fail <= or_reduct(z_tb);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '0';
    sel_tb <= "000";
    wait for 2 ns;
    this_fail <= or_reduct(y_tb);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '0';
    sel_tb <= "001";
    wait for 2 ns;
    this_fail <= or_reduct(y_tb);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '0';
    sel_tb <= "100";
    wait for 2 ns;
    this_fail <= or_reduct(y_tb);
    total_fail <= total_fail or this_fail;
    wait for 2 ns;

    en_tb <= '0';
    sel_tb <= "111";
    wait for 2 ns;
    this_fail <= or_reduct(y_tb);
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
    assert done = '1'
    report "Simulation completed with done"
    severity failure;
  end process;
end architecture tb_arch;
