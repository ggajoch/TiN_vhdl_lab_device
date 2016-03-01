library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_ff is
	port (
		d : in std_logic;
		q : out std_logic;
		clk : in std_logic;
		rst : in std_logic
	);
end entity d_ff;

architecture RTL of d_ff is
	
begin
	d_ff : process (clk, rst) is
	begin
		if rst = '1' then
			q <= '0';
		elsif rising_edge(clk) then
			q <= d; 
		end if;
	end process d_ff;
	
end architecture RTL;
