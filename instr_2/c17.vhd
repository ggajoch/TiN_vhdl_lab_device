library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity c17 is
	port(in0      : in  std_logic;
		 in1      : in  std_logic;
		 in2      : in  std_logic;
		 in3      : in  std_logic;
		 in4      : in  std_logic;
		 out0     : out std_logic;
		 out1     : out std_logic;
		 switches : in  std_logic_vector(0 to 3));
end c17;

architecture Behavioral of c17 is
	signal mid1, mid2, mid3, mid4 : std_logic;
begin
	mid1 <= '1' when switches = "0001" 
			else not (in0 and in2);
	mid2 <= not (in2 and in3);
	mid3 <= '0' when switches = "0010" else
	        not (in1 and mid2);
	mid4 <= '0' when switches = "0011" else
			not (in4 and mid2);
	out0 <= not (mid1 and mid3);
	out1 <= not (mid3 and mid4);
end Behavioral;

