library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serialAdder is
	port(
		a        : in  std_logic;
		b        : in  std_logic;
		clk      : in  std_logic;
		s        : out std_logic;
		switches : in  std_logic_vector(0 to 3)
	);
end entity serialAdder;

architecture RTL of serialAdder is
	signal a1, a2, a3, a4, a5, a6, a7 : std_logic;
begin
	a1 <= '1' when switches = "0101" else 
	      a and b;
	a2 <= a or b;
	a3 <= '0' when switches = "0110" else
	      (not a1) and a2;
	a4 <= a3 and a7;
	a5 <= a3 or a7;
	a6 <= '1' when switches = "0111" else
	      a1 or a4;

	s <= (not a4) and a5;

	d_ff_inst : entity work.d_ff
		port map(
			d   => a6,
			q   => a7,
			clk => clk,
			rst => '0'
		);
end architecture RTL;
