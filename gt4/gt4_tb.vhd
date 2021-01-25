library IEEE;
use IEEE.std_logic_1164.all;

entity gt4_tb is
end entity;

architecture tb_arch of gt4_tb is
  signal a_tb, b_tb: std_logic_vector(3 downto 0);
  signal agtb_tb: std_logic;
  signal failed:std_logic := '0';
  signal done: std_logic := '0';
begin
  -- instantiate the circuit under test
  uut: entity work.gt4(struc_arch)
    port map(
      a => a_tb,
      b => b_tb, 
      agtb => agtb_tb
    );
    -- test vector generator
    process
    begin
      a_tb <= "1000";
      b_tb <= "0100";
      wait for 2 ns;
      failed <= failed or not agtb_tb;
      wait for 2 ns;

      a_tb <= "1000";
      b_tb <= "1000";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "0100";
      b_tb <= "1000";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "0001";
      b_tb <= "0000";
      wait for 2 ns;
      failed <= failed or not agtb_tb;
      wait for 2 ns;

      a_tb <= "0000";
      b_tb <= "0000";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "0000";
      b_tb <= "0001";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "0010";
      b_tb <= "0001";
      wait for 2 ns;
      failed <= failed or not agtb_tb;
      wait for 2 ns;

      a_tb <= "0001";
      b_tb <= "0001";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "0001";
      b_tb <= "0010";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "0100";
      b_tb <= "0010";
      wait for 2 ns;
      failed <= failed or not agtb_tb;
      wait for 2 ns;

      a_tb <= "0010";
      b_tb <= "0010";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "0010";
      b_tb <= "0100";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "1001";
      b_tb <= "1000";
      wait for 2 ns;
      failed <= failed or not agtb_tb;
      wait for 2 ns;

      a_tb <= "0100";
      b_tb <= "0100";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "1000";
      b_tb <= "1001";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "1011";
      b_tb <= "1001";
      wait for 2 ns;
      failed <= failed or not agtb_tb;
      wait for 2 ns;

      a_tb <= "1001";
      b_tb <= "1001";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "1001";
      b_tb <= "1011";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "1111";
      b_tb <= "1110";
      wait for 2 ns;
      failed <= failed or not agtb_tb;
      wait for 2 ns;

      a_tb <= "1011";
      b_tb <= "1011";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "1110";
      b_tb <= "1111";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      a_tb <= "1111";
	      b_tb <= "1111";
      wait for 2 ns;
      failed <= failed or agtb_tb;
      wait for 2 ns;

      done <= '1';
      
      -- terminate simulation
      assert failed = '0'
        report "Simulation completed without failure"
        severity failure;
      assert failed = '1'
        report "Simulation completed with failure"
        severity failure;
    end process;
  end tb_arch;

