--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:38:31 01/05/2016
-- Design Name:   
-- Module Name:   C:/Users/rexina/Dropbox/AGH/tin/Xilinx/Test1/testbench1.vhd
-- Project Name:  Test1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY testbench1 IS
END testbench1;

ARCHITECTURE behavior OF testbench1 IS
	procedure gen_clk(signal clk : out std_logic) is
	begin
		wait for 1 ns;
		clk <= '1';
		wait for 1 ns;
		clk <= '0';
		wait for 1 ns;
	end procedure gen_clk;
	-- Component Declaration for the Unit Under Test (UUT)

	COMPONENT top
		PORT(
			switches       : IN    std_logic_vector(0 to 3);
			leds           : OUT   std_logic_vector(0 to 3);
			btns           : IN    std_logic_vector(0 to 3);
			main_connector : INOUT std_logic_vector(0 to 15)
		);
	END COMPONENT;

	--Inputs
	signal switches : std_logic_vector(0 to 3) := (others => '0');
	signal btns     : std_logic_vector(0 to 3) := (others => '0');

	--BiDirs
	signal main_connector : std_logic_vector(0 to 15);

	--Outputs
	signal led : std_logic_vector(0 to 3);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut : top PORT MAP(
			switches       => switches,
			leds           => led,
			btns           => btns,
			main_connector => main_connector
		);

	-- Stimulus process
	stim_proc : process
	begin
		-- hold reset state for 100 ns.
		main_connector <= (others => 'Z');
		wait for 100 ns;
		

		-------------- THROUGHPUT --------------
		switches <= "0000";

		btns                   <= "1010";
		main_connector(0 to 3) <= "0000";
		wait for 1 ns;
		assert main_connector(4 to 7) = "1010";
		assert main_connector(8 to 15) = "ZZZZZZZZ";
		assert led = "0000";

		btns                   <= "0111";
		main_connector(0 to 3) <= "0011";
		wait for 1 ns;
		assert main_connector(4 to 7) = "0111";
		assert main_connector(8 to 15) = "ZZZZZZZZ";
		assert led = "0011";
	
		wait for 98 ns;
		
		-------------- 4b SHIFT REG --------------
		
		switches <= "0001";
		main_connector <= (others => 'Z');
		wait for 1 ns;
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "0000ZZZZZZZZZZ";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "1000ZZZZZZZZZZ";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "1100ZZZZZZZZZZ";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "0110ZZZZZZZZZZ";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "1011ZZZZZZZZZZ";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "0101ZZZZZZZZZZ";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "0010ZZZZZZZZZZ";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "0001ZZZZZZZZZZ";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "0000ZZZZZZZZZZ";


		wait for 60 ns;
		
		-------------- parity gen --------------
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		switches <= "0010";
		wait for 1 ns;
		
		main_connector(1 to 15) <= "000000000000000";
		wait for 1 ns;
		assert main_connector(0) = '0';
		
		main_connector(1 to 15) <= "111111111111111";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		main_connector(1 to 15) <= "101010101010101";
		wait for 1 ns;
		assert main_connector(0) = '0';
		
		main_connector(1 to 15) <= "010101010101010";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		main_connector(1 to 15) <= "000000111111111";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		main_connector(1 to 15) <= "111111111000000";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		main_connector(1 to 15) <= "111001101001010";
		wait for 1 ns;
		assert main_connector(0) = '0';
		
		main_connector(1 to 15) <= "011001100110011";
		wait for 1 ns;
		assert main_connector(0) = '0';
		
		main_connector(1 to 15) <= "011101100110011";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		wait for 88 ns;
		
		-------------- parity gen with error --------------
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		switches <= "0011";
		wait for 1 ns;
		
		main_connector(1 to 15) <= "000000000000000";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		main_connector(1 to 15) <= "111111111111111";
		wait for 1 ns;
		assert main_connector(0) = '0';
		
		main_connector(1 to 15) <= "101010101010101";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		main_connector(1 to 15) <= "010101010101010";
		wait for 1 ns;
		assert main_connector(0) = '0';
		
		main_connector(1 to 15) <= "000000111111111";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		main_connector(1 to 15) <= "111111111000000";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		main_connector(1 to 15) <= "111001101001010";
		wait for 1 ns;
		assert main_connector(0) = '0';
		
		main_connector(1 to 15) <= "011001100110011";
		wait for 1 ns;
		assert main_connector(0) = '0';
		
		main_connector(1 to 15) <= "011101100110011";
		wait for 1 ns;
		assert main_connector(0) = '1';
		
		wait for 90 ns;
		
		-------------- shift reg  ok --------------
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		switches <= "0100";
		wait for 1 ns;
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "10000000000000";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "01000000000000";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "10100000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "11010000000000";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "01101000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00110100000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011010000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001101000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000110100000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000011010000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000001101000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000110100";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000011010";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000001101";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000110";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000011";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000001";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		
		
		wait for 77 ns;
		-------------- shift reg  out --------------
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		switches <= "0101";
		wait for 1 ns;
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		
		assert main_connector(2 to 15) = "00001000000000";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "10001000000000";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "01001000000000";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "10101000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "11011000000000";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "01101000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00111100000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011010000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001101000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001110100000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001011010000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001001101000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000110100";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000011010";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000001101";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000110";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000011";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000001";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00001000000000";
		
		
		wait for 20 ns;
		-------------- shift reg  in --------------
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		switches <= "0110";
		wait for 1 ns;
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		
		assert main_connector(2 to 15) = "00000000000000";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00000000000000";
		
		
		wait for 20 ns;
		
		
		
		
		-------------- shift reg  between --------------
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		switches <= "0111";
		wait for 1 ns;
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011000000000";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "10011100000000";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "01011110000000";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "10111111000000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "11011111100000";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "01111111110000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00111111111000";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011111111100";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011111111110";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011111111111";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011111111111";
		
		main_connector(1) <= '1';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "10011111111111";
		
		main_connector(1) <= '0';
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "01011111111111";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00111111111111";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011111111111";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011111111111";
		gen_clk(main_connector(0));
		assert main_connector(2 to 15) = "00011111111111";
		
		wait for 41 ns;
		
		-------------- adder --------------
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		switches <= "1000";
		wait for 1 ns;
		
		main_connector(0) <= '0';
		main_connector(1) <= '0';
		gen_clk(main_connector(2));
		gen_clk(main_connector(2));
		gen_clk(main_connector(2));
		assert main_connector(3) = '0';
		
		-- add 43 + 37 = 80
		main_connector(0) <= '1';
		main_connector(1) <= '1';
		wait for 1 ns;
		assert main_connector(3) = '0';
		gen_clk(main_connector(2));
		
		main_connector(0) <= '1';
		main_connector(1) <= '0';
		wait for 1 ns;
		assert main_connector(3) = '0';
		gen_clk(main_connector(2));
		
		main_connector(0) <= '0';
		main_connector(1) <= '1';
		wait for 1 ns;
		assert main_connector(3) = '0';
		gen_clk(main_connector(2));
		
		main_connector(0) <= '1';
		main_connector(1) <= '0';
		wait for 1 ns;
		assert main_connector(3) = '0';
		gen_clk(main_connector(2));
		
		
		main_connector(0) <= '0';
		main_connector(1) <= '0';
		wait for 1 ns;
		assert main_connector(3) = '1';
		gen_clk(main_connector(2));
		
		
		main_connector(0) <= '1';
		main_connector(1) <= '1';
		wait for 1 ns;
		assert main_connector(3) = '0';
		gen_clk(main_connector(2));
		
		
		main_connector(0) <= '0';
		main_connector(1) <= '0';
		wait for 1 ns;
		assert main_connector(3) = '1';
		gen_clk(main_connector(2));
		assert main_connector(3) = '0';
		
		
		wait;
	end process;

END;