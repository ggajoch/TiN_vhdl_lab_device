library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParityGen is
	generic(IN_LEN : integer);
	port(input_data : in  std_logic_vector(0 to IN_LEN - 1);
		 output     : out std_logic);
end ParityGen;

architecture Behavioral of ParityGen is
begin
	process(input_data)
		variable res : std_logic_vector(0 to IN_LEN - 1) := (others => '0');
	begin
		res(0) := input_data(0);
		for i in 1 to input_data'right loop
			res(i) := res(i - 1) xor input_data(i);
		end loop;

		output <= res(input_data'right);
	end process;
end Behavioral;

