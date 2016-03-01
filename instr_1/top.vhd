library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(switches       : in    std_logic_vector(0 to 3);
		 leds           : out   std_logic_vector(0 to 3);
		 btns           : in    std_logic_vector(0 to 3);
		 main_connector : inout std_logic_vector(0 to 15));
end top;

architecture func of top is
	signal shiftReg4b_out           : std_logic_vector(0 to 3);
	signal Errored_ParityGen_out    : std_logic;
	signal ErroredShiftRegister_out : std_logic_vector(0 to 13);
	signal serialAdder_out          : std_logic;
begin
	leds <= main_connector(0 to 3) when switches = "0000" else 
			shiftReg4b_out when switches = "0001" else 
			"0000";

	shiftRegister4b_inst : entity work.shiftRegister
		generic map(
			LEN => 4
		)
		port map(
			data_in  => main_connector(1),
			clock    => main_connector(0),
			clear    => '0',
			data_out => shiftReg4b_out
		);

	ErroredParityGen_inst : entity work.ErroredParityGen
		generic map(
			IN_LEN => 15
		)
		port map(
			input_data => main_connector(1 to 15),
			output     => Errored_ParityGen_out,
			switches   => switches
		);

	ErroredShiftRegister_inst : entity work.ErroredShiftRegister
		generic map(
			LEN => 14
		)
		port map(
			data_in  => main_connector(1),
			clock    => main_connector(0),
			clear    => '0',
			data_out => ErroredShiftRegister_out,
			switches => switches
		);

	ErroredSerialAdder_inst : entity work.ErroredSerialAdder
		port map(
			Xin      => main_connector(0),
			Yin      => main_connector(1),
			clock    => main_connector(2),
			Sout     => serialAdder_out,
			switches => switches
		);

	output_connector_process : 	process(switches, ErroredShiftRegister_out, Errored_ParityGen_out, btns, serialAdder_out, shiftReg4b_out) is
	begin
		main_connector <= (others => 'Z');
		case switches is
			when "0000" =>
				main_connector(4 to 7) <= btns;
			when "0001" =>
				main_connector(2 to 5) <= shiftReg4b_out;
			when "0010" | "0011" =>
				main_connector(0) <= Errored_ParityGen_out;
			when "0100" | "0101" | "0110" | "0111" =>
				main_connector(2 to 15) <= ErroredShiftRegister_out;
			when "1000" | "1001" | "1010" =>
				main_connector(3) <= serialAdder_out;
			when others => null;
		end case;
	end process output_connector_process;

end func;