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
	
	procedure test_c17(signal main_connector : inout std_logic_vector(0 to 15)) is
	begin
		main_connector(2 to 6) <= "10101";
		wait for 1 ns;
		assert main_connector(0 to 1) = "11";
		wait for 1 ns;

		main_connector(2 to 6) <= "01010";
		wait for 1 ns;
		assert main_connector(0 to 1) = "11";
		wait for 1 ns;
		
		main_connector(2 to 6) <= "10000";
		wait for 1 ns;
		assert main_connector(0 to 1) = "00";
		wait for 1 ns;
		
		main_connector(2 to 6) <= "01111";
		wait for 1 ns;
		assert main_connector(0 to 1) = "00";
		wait for 1 ns;
	end procedure test_c17;
	
	procedure test_7843(signal main_connector : inout std_logic_vector(0 to 15)) is
	begin
		main_connector(5 to 13) <= "000000000";
		wait for 1 ns;
		assert main_connector(0 to 4) = "00000";
		wait for 1 ns;
		main_connector(5 to 13) <= "010000000";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01000";
		wait for 1 ns;
		main_connector(5 to 13) <= "000010000";
		wait for 1 ns;
		assert main_connector(0 to 4) = "00001";
		wait for 1 ns;
		main_connector(5 to 13) <= "010001000";
		wait for 1 ns;
		assert main_connector(0 to 4) = "10000";
		wait for 1 ns;

		main_connector(5 to 13) <= "100111010";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01110";
		wait for 1 ns;
		main_connector(5 to 13) <= "010111100";
		wait for 1 ns;
		assert main_connector(0 to 4) = "10111";
		wait for 1 ns;
		main_connector(5 to 13) <= "100010011";
		wait for 1 ns;
		assert main_connector(0 to 4) = "00101";
		wait for 1 ns;
		main_connector(5 to 13) <= "000010111";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01000";
		wait for 1 ns;
		main_connector(5 to 13) <= "011100101";
		wait for 1 ns;
		assert main_connector(0 to 4) = "10011";
		wait for 1 ns;
		main_connector(5 to 13) <= "110010010";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01100";
		wait for 1 ns;
		main_connector(5 to 13) <= "101010110";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01100";
		wait for 1 ns;
		main_connector(5 to 13) <= "110010101";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01111";
		wait for 1 ns;
		main_connector(5 to 13) <= "100001110";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01111";
		wait for 1 ns;
		main_connector(5 to 13) <= "110100101";
		wait for 1 ns;
		assert main_connector(0 to 4) = "10000";
		wait for 1 ns;
		main_connector(5 to 13) <= "000011110";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01111";
		wait for 1 ns;
		main_connector(5 to 13) <= "011001001";
		wait for 1 ns;
		assert main_connector(0 to 4) = "10101";
		wait for 1 ns;
		main_connector(5 to 13) <= "101000011";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01000";
		wait for 1 ns;
		main_connector(5 to 13) <= "001110010";
		wait for 1 ns;
		assert main_connector(0 to 4) = "01001";
	end procedure;
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

		-------------- c17 --------------
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		report "C17 no faults";
		switches <= "0000";
		wait for 10 ns;
		test_c17(main_connector);

		wait for 881 ns;
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		report "C17_1";
		switches <= "0001";
		wait for 10 ns;
		test_c17(main_connector);
		
		wait for 981 ns;
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		report "C17_2";
		switches <= "0010";
		wait for 10 ns;
		test_c17(main_connector);
		
		wait for 981 ns;
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		report "C17_3";
		switches <= "0011";
		wait for 10 ns;
		test_c17(main_connector);
		
		wait for 981 ns;
		
		-------------- 7483 --------------
		main_connector <= (others => 'Z');
		wait for 1 ns;
		report "7483 no faults";
		switches <= "0100";
		wait for 10 ns;
		test_7843(main_connector);
		
		wait for 954 ns;
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		report "7483_1";
		switches <= "0101";
		wait for 10 ns;
		test_7843(main_connector);
		
		wait for 954 ns;
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		report "7483_2";
		switches <= "0110";
		wait for 10 ns;
		test_7843(main_connector);
		
		wait for 954 ns;
		
		main_connector <= (others => 'Z');
		wait for 1 ns;
		report "7483_3";
		switches <= "0111";
		wait for 10 ns;
		test_7843(main_connector);
		
		wait for 954 ns;
		
		wait;
	end process;

END;