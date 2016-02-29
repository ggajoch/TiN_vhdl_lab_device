library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_7483_1 is
	port(
		c0 : in  std_logic;
		a0 : in  std_logic;
		a1 : in  std_logic;
		a2 : in  std_logic;
		a3 : in  std_logic;
		b0 : in  std_logic;
		b1 : in  std_logic;
		b2 : in  std_logic;
		b3 : in  std_logic;
		s0 : out std_logic;
		s1 : out std_logic;
		s2 : out std_logic;
		s3 : out std_logic;
		c4 : out std_logic
	);
end entity ic_7483_1;

architecture RTL of ic_7483_1 is
	signal d0, d1, d2, d3, d4, d5, d6, d7, d8                                                  : std_logic;
	signal e0, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15, e16, e17, e18 : std_logic;
	signal f1, f2, f3                                                                          : std_logic;
begin
	d0 <= not c0;

	d1 <= not (a0 or b0);
	d2 <= not (a0 and b0);

	d3 <= not (a1 or b1);
	d4 <= not (a1 and b1);

	d5 <= not (a2 or b2);
	d6 <= not (a2 and b2);

	d7 <= not (a3 or b3);
	d8 <= not (a3 and b3);

	e0 <= not d0;--
	e1 <= (not d1) and d2;

	e2 <= d0 and d2;
	e3 <= d1;
	e4 <= (not d3) and d4;

	e5 <= d0 and d2 and d4;
	e6 <= d1 and d4;
	e7 <= d3;
	e8 <= (not d5) and d6;

	e9  <= '1';--d0 and d2 and d4 and d6;
	e10 <= d1 and d4 and d6;
	e11 <= d3 and d6;
	e12 <= d5;
	e13 <= (not d7) and d8;

	e14 <= d0 and d2 and d4 and d6 and d8;
	e15 <= d1 and d4 and d6 and d8;
	e16 <= d3 and d6 and d8;
	e17 <= d5 and d8;
	e18 <= d7;

	f1 <= not (e2 or e3);
	f2 <= not (e5 or e6 or e7);
	f3 <= not (e9 or e10 or e11 or e12);

	s0 <= e0 xor e1;
	s1 <= f1 xor e4;
	s2 <= f2 xor e8;
	s3 <= f3 xor e13;
	c4 <= not (e14 or e15 or e16 or e17 or e18);

end architecture RTL;
