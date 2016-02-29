library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ErroredSerialAdder is
	port(Xin      : in  std_logic;
		 Yin      : in  std_logic;
		 clock    : in  std_logic;
		 Sout     : out std_logic;
		 switches : in  std_logic_vector(0 to 3));
end ErroredSerialAdder;

architecture Behavioral of ErroredSerialAdder is
	signal carry_i      : std_logic := '0';
	signal next_carry_i : std_logic := '0';
begin
	full_adder : process(Xin, Yin, carry_i, switches) is
	begin
		next_carry_i <= (Xin) and Yin;

		if switches = "1000" then
			-- No errors
			Sout         <= Xin xor Yin xor carry_i;
			next_carry_i <= (Xin and Yin) or (carry_i and Xin) or (carry_i and Yin);
		elsif switches = "1001" then
			-- in adder
			Sout         <= Xin xor '1' xor carry_i;
			next_carry_i <= (Xin and Yin) or (carry_i and Xin) or (carry_i and Yin);

		else
			-- carry stuck
			Sout         <= Xin xor Yin xor carry_i;
			next_carry_i <= '1';
		end if;
	end process full_adder;

	add_process : process(clock) is
	begin
		if rising_edge(clock) then
			carry_i <= next_carry_i;
		end if;
	end process add_process;

end Behavioral;

