library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity shiftRegister is
	generic(LEN : integer);
	port(data_in  : in  std_logic;
		 clock    : in  std_logic;
		 clear    : in  std_logic;
		 data_out : out std_logic_vector(0 to LEN - 1));
end shiftRegister;

architecture Behavioral of shiftRegister is
begin
	process(clock)
		variable tmp : unsigned(0 to LEN - 1) := (others => '0');
	begin
		if (rising_edge(clock)) then
			tmp      := tmp srl 1;
			tmp(0)   := data_in;
			data_out <= std_logic_vector(tmp);
		end if;
	end process;
end Behavioral;

