library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cycle_free is
	port(
		clk      : in  std_logic;
		in1      : in  std_logic;
		in2      : in  std_logic;
		out0     : out std_logic;
		switches : in  std_logic_vector(0 to 3)
	);
end entity cycle_free;

architecture RTL of cycle_free is
	signal a1, a2, a3, a4, a5, a6 : std_logic;
begin
	a1 <= '1' when switches = "0001" else
	      not in1;

	d_ff_inst_1 : entity work.d_ff
		port map(
			d   => in2,
			q   => a3,
			clk => clk,
			rst => '0'
		);

	a2 <= '1' when switches = "0010" else 
	      in1 or a3;

	d_ff_inst_2 : entity work.d_ff
		port map(
			d   => a2,
			q   => a4,
			clk => clk,
			rst => '0'
		);

	a5 <= '0' when switches = "0011" else
	      not (a3 and a4);

	d_ff_inst_3 : entity work.d_ff
		port map(
			d   => a5,
			q   => a6,
			clk => clk,
			rst => '0'
		);

	out0 <= a1 or a5 or a6;
end architecture RTL;
