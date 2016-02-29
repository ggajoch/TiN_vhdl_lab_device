library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity shiftRegisterSerialError is
	generic (LEN : integer);
   port (  data_in : in  std_logic;
           clock : in  std_logic;
           clear : in  std_logic;
           stuck : in std_logic;
           data_out : out  std_logic_vector(0 to LEN-1));
end shiftRegisterSerialError;

architecture Behavioral of shiftRegisterSerialError is
begin
	process(clock)
		variable tmp : unsigned(0 to LEN-1) := (others => '0');
	begin
		if( rising_edge(clock) ) then
			tmp := tmp srl 1;
			if stuck = '1' then
				tmp(3) := '1';
			end if;
			tmp(0) := data_in;
			data_out <= std_logic_vector(tmp);
		end if;
	end process;
end Behavioral;