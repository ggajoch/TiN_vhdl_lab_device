library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ErroredParityGen is
	generic(IN_LEN : integer);
	port(input_data : in  std_logic_vector(0 to IN_LEN - 1);
		 output     : out std_logic;
		 switches   : in  std_logic_vector(0 to 3));
end ErroredParityGen;

architecture Behavioral of ErroredParityGen is
	signal errored_input : std_logic_vector(0 to IN_LEN - 1);
	signal input_xor     : std_logic_vector(0 to IN_LEN - 1);
begin
	Stuck_At_inst : entity work.Stuck_At
		generic map(
			LEN => IN_LEN
		)
		port map(
			input     => input_data,
			output    => errored_input,
			stuck_en  => "001000000000100",
			stuck_val => "001000000000000"
		);

	input_xor <= errored_input when switches = "0011" 
				 else input_data;

	ParityGen_inst : entity work.ParityGen
		generic map(
			IN_LEN => IN_LEN
		)
		port map(
			input_data => input_xor,
			output     => output
		);
end Behavioral;

