library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ErroredShiftRegister is
	generic(LEN : integer);
	port(data_in  : in  std_logic;
		 clock    : in  std_logic;
		 clear    : in  std_logic;
		 data_out : out std_logic_vector(0 to LEN - 1);
		 switches : in  std_logic_vector(0 to 3));

end ErroredShiftRegister;

architecture Behavioral of ErroredShiftRegister is
	signal errored_data_in                 : std_logic;
	signal reg_data_out                    : std_logic_vector(0 to LEN - 1);
	signal stuck_en                        : std_logic_vector(0 to LEN - 1);
	signal stuck_val                       : std_logic_vector(0 to LEN - 1);
	signal data_out_normal, data_out_stuck : std_logic_vector(0 to LEN - 1);
	signal stuck                           : std_logic;
begin
	stuck_en <= "00000000000000" when switches = "0100" else "00001000000000" when switches = "0101" else "00000000000000" when switches = "0110" else "00000000000000";

	stuck_val <= "00000000000000" when switches = "0100" else "00001000000000" when switches = "0101" else "00000000000000" when switches = "0110" else "00000000000000";

	errored_data_in <= '0' when switches = "0110" else data_in;

	shiftRegister_inst : entity work.shiftRegister
		generic map(
			LEN => LEN
		)
		port map(
			data_in  => errored_data_in,
			clock    => clock,
			clear    => clear,
			data_out => reg_data_out
		);

	Stuck_At_inst : entity work.Stuck_At
		generic map(
			LEN => LEN
		)
		port map(
			input     => reg_data_out,
			output    => data_out_normal,
			stuck_en  => stuck_en,
			stuck_val => stuck_val
		);

	shiftRegisterSerialError_inst : entity work.shiftRegisterSerialError
		generic map(
			LEN => LEN
		)
		port map(
			data_in  => data_in,
			clock    => clock,
			clear    => clear,
			stuck    => stuck,
			data_out => data_out_stuck
		);
	stuck    <= '1' when switches = "0111" else '0';
	data_out <= data_out_stuck when switches = "0111" else data_out_normal;
end Behavioral;

