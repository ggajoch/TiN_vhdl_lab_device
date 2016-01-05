library ieee;
use ieee.std_logic_1164.all;

entity top is					
   port( data : in std_logic_vector(0 to 3);
         led : out std_logic_vector(0 to 11);
			btns : in std_logic_vector(0 to 1);
			main_connector : inout std_logic_vector(0 to 23));
end top;

architecture func of top is 
	signal XOR_din  : std_logic_vector(0 to 14);
	signal XOR_din_err  : std_logic_vector(0 to 14);
	signal XOR_dout : std_logic;

	signal REG_clk  : std_logic;
	signal REG_din  : std_logic;
	signal REG_dout : std_logic_vector(0 to 13);
	signal REG_dout_err : std_logic_vector(0 to 13);
begin
	XOR_din <= main_connector(0 to 14);
	
	-----------------------------------------------------
	XOR_err : entity work.Stuck_At 
			 generic map (LEN  => 15)
			 port map(    input => XOR_din,
                      output => XOR_din_err,
                    stuck_en => "100000100010000",
                   stuck_val => "100000000010000");	
	
	XOR1 : entity work.ParityGen 
			 generic map (IN_LEN => 15)
			 port map(input_data => XOR_din_err, output => XOR_dout);
	
	
	-----------------------------------------------------
	
	REG_clk <= main_connector(0) when data(0) = '0' else btns(0);
	REG_din <= main_connector(1) when data(0) = '0' else btns(1);
	
	shift_reg : entity work.shiftRegister 
			 generic map (LEN  => 14)
			 port map(data_in  => REG_din,
						 clock    => REG_clk,
						 clear    => '0',
						 data_out => REG_dout);
	
	shift_reg_err : entity work.Stuck_At 
			 generic map (LEN  => 14)
			 port map(    input => REG_dout,
                      output => REG_dout_err,
                    stuck_en => "01000010001000",
                   stuck_val => "01000000001000");
	
	
	-----------------------------------------------------
	
	main_connector <= "ZZ" & REG_dout_err & "ZZZZZZZZ" when data(0) = '0' else
							"ZZZZZZZZZZZZZZZ" & XOR_dout & "ZZZZZZZZ";
	
	led(0 to 10) <= REG_dout_err(0 to 10);
	led(11)      <= XOR_dout;
	
end func;