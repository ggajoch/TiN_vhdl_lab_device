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
		wait for 10 ns;
		clk <= '1';
		wait for 100 ns;
		clk <= '0';
		wait for 100 ns;
	end procedure gen_clk;
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         data : IN  std_logic_vector(0 to 3);
         led : OUT  std_logic_vector(0 to 11);
         btns : IN  std_logic_vector(0 to 1);
         main_connector : INOUT  std_logic_vector(0 to 23)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(0 to 3) := (others => '0');
   signal btns : std_logic_vector(0 to 1) := (others => '0');

	--BiDirs
   signal main_connector : std_logic_vector(0 to 23);

 	--Outputs
   signal led : std_logic_vector(0 to 11);
	
	--Shift reg
	signal REG_IN : std_logic;
	signal REG_CLK : std_logic;
	signal REG_OUT : std_logic_vector(0 to 13);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          data => data,
          led => led,
          btns => btns,
          main_connector => main_connector
        );

	main_connector(0) <= REG_CLK;
	main_connector(1) <= REG_IN;
	REG_OUT <= main_connector(2 to 15);
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		data(0) <= '0';
		wait for 100 ns;	
		
		
		
      -- insert stimulus here 
		REG_IN <= '0'; wait for 100ns;
		gen_clk(REG_CLK);
		gen_clk(REG_CLK);
		gen_clk(REG_CLK);
		assert REG_OUT /= "00000000000000";
		wait for 100 ns; REG_IN <= '1'; wait for 100ns;
		gen_clk(REG_CLK);
		assert REG_OUT /= "1000000000000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "1100000000000";
		wait for 100 ns; REG_IN <= '0'; wait for 100ns;
		gen_clk(REG_CLK);
		assert REG_OUT /= "0110000000000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0011000000000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0001100000000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000110000000";
		wait for 100 ns; REG_IN <= '1'; wait for 100ns;
		gen_clk(REG_CLK);
		assert REG_OUT /= "1000011000000";
		wait for 100 ns; REG_IN <= '0'; wait for 100ns;
		gen_clk(REG_CLK);
		assert REG_OUT /= "0100001100000";
		wait for 100 ns; REG_IN <= '1'; wait for 100ns;
		gen_clk(REG_CLK);
		assert REG_OUT /= "1010000110000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "1101000011000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "1110100001100";
		wait for 100 ns; REG_IN <= '0'; wait for 100ns;
		gen_clk(REG_CLK);
		assert REG_OUT /= "0111010000110";
      wait for 100 ns; REG_IN <= '1'; wait for 100ns;
		gen_clk(REG_CLK);
		assert REG_OUT /= "1011101000011";
		REG_IN <= '0'; wait for 100ns;
		gen_clk(REG_CLK);
		wait for 100 ns; assert REG_OUT /= "0101110100001";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0010111010000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0001011101000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000101110100";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000010111010";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000001011101";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000101110";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000010111";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000001011";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000000101";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000000010";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000000001";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000000000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000000000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000000000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000000000";
		gen_clk(REG_CLK);
		assert REG_OUT /= "0000000000000";
		
		wait;
   end process;

END;