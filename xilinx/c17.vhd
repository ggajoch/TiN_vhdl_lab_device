library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity c17 is
    Port ( in0 : in  STD_LOGIC;
			  in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           in3 : in  STD_LOGIC;
           in4 : in  STD_LOGIC;
           out0 : out  STD_LOGIC;
           out1 : out  STD_LOGIC);
end c17;

architecture Behavioral of c17 is
	signal mid1, mid2, mid3, mid4 : std_logic;
begin
	mid1 <= not (in0 and in2);
	mid2 <= not (in2 and in3);
	mid3 <= not (in1 and mid2);
	mid4 <= not (in4 and mid2);
	out0 <= not (mid1 and mid3);
	out1 <= not (mid3 and mid4);
end Behavioral;

