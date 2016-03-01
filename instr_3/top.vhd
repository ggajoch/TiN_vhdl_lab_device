library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(switches       : in    std_logic_vector(0 to 3);
		 leds           : out   std_logic_vector(0 to 3);
		 btns           : in    std_logic_vector(0 to 3);
		 main_connector : inout std_logic_vector(0 to 15));
end top;

architecture func of top is
	signal cycle_free_out, serial_adder_out, mod3_counter_out : std_logic;

begin
	cycle_free_inst : entity work.cycle_free
		port map(
			clk      => main_connector(0),
			in1      => main_connector(1),
			in2      => main_connector(2),
			out0     => cycle_free_out,
			switches => switches
		);

	serialAdder_inst : entity work.serialAdder
		port map(
			a        => main_connector(1),
			b        => main_connector(2),
			clk      => main_connector(0),
			s        => serial_adder_out,
			switches => switches
		);

	mod3Counter_inst : entity work.mod3Counter
		port map(
			cnt      => main_connector(1),
			clr      => main_connector(2),
			clk      => main_connector(0),
			rst      => '0',
			output   => mod3_counter_out,
			switches => switches
		);

	output_connector_process : process(switches, cycle_free_out, mod3_counter_out, serial_adder_out) is
	begin
		main_connector <= (others => 'Z');
		case switches is
			when "0000" | "0001" | "0010" | "0011" =>
				main_connector(3) <= cycle_free_out;
			when "0100" | "0101" | "0110" | "0111" =>
				main_connector(3) <= serial_adder_out;
			when "1000" | "1001" | "1010" | "1011" =>
				main_connector(3) <= mod3_counter_out;
			when others => null;
		end case;
	end process output_connector_process;

end func;