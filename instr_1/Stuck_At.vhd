library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Stuck_At is
	generic(LEN : integer);
	port(input     : in  std_logic_vector(0 to LEN - 1);
		 output    : out std_logic_vector(0 to LEN - 1);
		 stuck_en  : in  std_logic_vector(0 to LEN - 1);
		 stuck_val : in  std_logic_vector(0 to LEN - 1));
end Stuck_At;

architecture Behavioral of Stuck_At is
begin
	process(input, stuck_en, stuck_val)
	begin
		for i in input'range loop
			if stuck_en(i) = '1' then
				output(i) <= stuck_val(i);
			else
				output(i) <= input(i);
			end if;
		end loop;
	end process;
end Behavioral;

