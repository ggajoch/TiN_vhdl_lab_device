library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mod3Counter is
	port(
		cnt      : in  std_logic;
		clr      : in  std_logic;
		clk      : in  std_logic;
		rst      : in  std_logic;
		output   : out std_logic;
		switches : in  std_logic_vector(0 to 3)
	);
end entity mod3Counter;

architecture RTL of mod3Counter is
	signal a1, a2, a3, a4, a5, a6, a7, a8 : std_logic;
	signal nClr                           : std_logic;
	signal z                              : std_logic;
begin
	nClr <= '0' when switches = "1010" else
			not clr;

	a1 <= cnt xor a4;
	a2 <= cnt or '0' when switches = "1001" else 
	      cnt or a4;
	      
	a3 <= a1 and a4 and nClr;

	d_ff_inst : entity work.d_ff
		port map(
			d   => a3,
			q   => a4,
			clk => clk,
			rst => rst
		);

	a5 <= '0' when switches = "1011" else
		  cnt and a4;
		  
	a6 <= a5 xor z;
	a7 <= a4 and a6 and nClr;

	d_ff_inst_2 : entity work.d_ff
		port map(
			d   => a7,
			q   => z,
			clk => clk,
			rst => rst
		);

	a8 <= not (a2 and z);

	output <= z;
end architecture RTL;
