library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(switches       : in    std_logic_vector(0 to 3);
		 leds           : out   std_logic_vector(0 to 3);
		 btns           : in    std_logic_vector(0 to 3);
		 main_connector : inout std_logic_vector(0 to 15));
end top;

architecture func of top is
	signal c17_out0, c17_out1                                                   : std_logic;
	signal c17_1_out0, c17_1_out1                                               : std_logic;
	signal c17_2_out0, c17_2_out1                                               : std_logic;
	signal c17_3_out0, c17_3_out1                                               : std_logic;
	signal ic_7483_0_s0, ic_7483_0_s1, ic_7483_0_s2, ic_7483_0_s3, ic_7483_0_c4 : std_logic;
	signal ic_7483_1_s0, ic_7483_1_s1, ic_7483_1_s2, ic_7483_1_s3, ic_7483_1_c4 : std_logic;
	signal ic_7483_2_s0, ic_7483_2_s1, ic_7483_2_s2, ic_7483_2_s3, ic_7483_2_c4 : std_logic;
	signal ic_7483_3_s0, ic_7483_3_s1, ic_7483_3_s2, ic_7483_3_s3, ic_7483_3_c4 : std_logic;
begin
	c17_inst : entity work.c17
		port map(
			in0  => main_connector(2),
			in1  => main_connector(3),
			in2  => main_connector(4),
			in3  => main_connector(5),
			in4  => main_connector(6),
			out0 => c17_out0,
			out1 => c17_out1
		);

	c17_1inst : entity work.c17_1
		port map(
			in0  => main_connector(2),
			in1  => main_connector(3),
			in2  => main_connector(4),
			in3  => main_connector(5),
			in4  => main_connector(6),
			out0 => c17_1_out0,
			out1 => c17_1_out1
		);

	c17_2inst : entity work.c17_2
		port map(
			in0  => main_connector(2),
			in1  => main_connector(3),
			in2  => main_connector(4),
			in3  => main_connector(5),
			in4  => main_connector(6),
			out0 => c17_2_out0,
			out1 => c17_2_out1
		);

	c17_3inst : entity work.c17_3
		port map(
			in0  => main_connector(2),
			in1  => main_connector(3),
			in2  => main_connector(4),
			in3  => main_connector(5),
			in4  => main_connector(6),
			out0 => c17_3_out0,
			out1 => c17_3_out1
		);

	ic_7483_inst : entity work.ic_7483
		port map(
			c0 => main_connector(5),
			a0 => main_connector(9),
			a1 => main_connector(8),
			a2 => main_connector(7),
			a3 => main_connector(6),
			b0 => main_connector(13),
			b1 => main_connector(12),
			b2 => main_connector(11),
			b3 => main_connector(10),
			s0 => ic_7483_0_s0,
			s1 => ic_7483_0_s1,
			s2 => ic_7483_0_s2,
			s3 => ic_7483_0_s3,
			c4 => ic_7483_0_c4
		);
		
	ic_7483_1_inst : entity work.ic_7483_1
		port map(
			c0 => main_connector(5),
			a0 => main_connector(9),
			a1 => main_connector(8),
			a2 => main_connector(7),
			a3 => main_connector(6),
			b0 => main_connector(13),
			b1 => main_connector(12),
			b2 => main_connector(11),
			b3 => main_connector(10),
			s0 => ic_7483_1_s0,
			s1 => ic_7483_1_s1,
			s2 => ic_7483_1_s2,
			s3 => ic_7483_1_s3,
			c4 => ic_7483_1_c4
		);
	
	ic_7483_2_inst : entity work.ic_7483_2
		port map(
			c0 => main_connector(5),
			a0 => main_connector(9),
			a1 => main_connector(8),
			a2 => main_connector(7),
			a3 => main_connector(6),
			b0 => main_connector(13),
			b1 => main_connector(12),
			b2 => main_connector(11),
			b3 => main_connector(10),
			s0 => ic_7483_2_s0,
			s1 => ic_7483_2_s1,
			s2 => ic_7483_2_s2,
			s3 => ic_7483_2_s3,
			c4 => ic_7483_2_c4
		);
		
		ic_7483_3_inst : entity work.ic_7483_3
		port map(
			c0 => main_connector(5),
			a0 => main_connector(9),
			a1 => main_connector(8),
			a2 => main_connector(7),
			a3 => main_connector(6),
			b0 => main_connector(13),
			b1 => main_connector(12),
			b2 => main_connector(11),
			b3 => main_connector(10),
			s0 => ic_7483_3_s0,
			s1 => ic_7483_3_s1,
			s2 => ic_7483_3_s2,
			s3 => ic_7483_3_s3,
			c4 => ic_7483_3_c4
		);
	output_connector_process : process(switches, c17_1_out0, c17_1_out1, c17_2_out0, c17_2_out1, c17_3_out0, c17_3_out1, c17_out0, c17_out1, ic_7483_0_c4, ic_7483_0_s0, ic_7483_0_s1, ic_7483_0_s2, ic_7483_0_s3, ic_7483_1_c4, ic_7483_1_s0, ic_7483_1_s1, ic_7483_1_s2, ic_7483_1_s3, ic_7483_2_c4, ic_7483_2_s0, ic_7483_2_s1, ic_7483_2_s2, ic_7483_2_s3, ic_7483_3_c4, ic_7483_3_s0, ic_7483_3_s1, ic_7483_3_s2, ic_7483_3_s3) is
	begin
		main_connector <= (others => 'Z');
		case switches is
			when "0000" =>
				main_connector(0) <= c17_out0;
				main_connector(1) <= c17_out1;
			when "0001" =>
				main_connector(0) <= c17_1_out0;
				main_connector(1) <= c17_1_out1;
			when "0010" =>
				main_connector(0) <= c17_2_out0;
				main_connector(1) <= c17_2_out1;
			when "0011" =>
				main_connector(0) <= c17_3_out0;
				main_connector(1) <= c17_3_out1;
			when "0100" =>
				main_connector(0) <= ic_7483_0_c4;
				main_connector(1) <= ic_7483_0_s3;
				main_connector(2) <= ic_7483_0_s2;
				main_connector(3) <= ic_7483_0_s1;
				main_connector(4) <= ic_7483_0_s0;
			when "0101" =>
				main_connector(0) <= ic_7483_1_c4;
				main_connector(1) <= ic_7483_1_s3;
				main_connector(2) <= ic_7483_1_s2;
				main_connector(3) <= ic_7483_1_s1;
				main_connector(4) <= ic_7483_1_s0;
			when "0110" =>
				main_connector(0) <= ic_7483_2_c4;
				main_connector(1) <= ic_7483_2_s3;
				main_connector(2) <= ic_7483_2_s2;
				main_connector(3) <= ic_7483_2_s1;
				main_connector(4) <= ic_7483_2_s0;
			when "0111" =>
				main_connector(0) <= ic_7483_3_c4;
				main_connector(1) <= ic_7483_3_s3;
				main_connector(2) <= ic_7483_3_s2;
				main_connector(3) <= ic_7483_3_s1;
				main_connector(4) <= ic_7483_3_s0;
			
			when others => null;
		end case;
	end process output_connector_process;

-----------------------------------------------------

--	main_connector <= "ZZ" & REG_dout_err & "ZZZZZZZZ" when data(0) = '0' else "ZZZZZZZZZZZZZZZ" & XOR_dout & "ZZZZZZZZ";
end func;