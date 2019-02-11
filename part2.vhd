library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity part2 is
	port 
	(
		msd		: in unsigned (3 downto 0);
		lsd		: in unsigned (3 downto 0);
		KEY0	: in std_logic;
		KEY1	: in std_logic;
		add_sub	: in std_logic;
		
		hex0	: out unsigned (6 downto 0);
		hex1	: out unsigned (6 downto 0);
		hex2	: out unsigned (6 downto 0);
		hex3	: out unsigned (6 downto 0);
		hex4	: out unsigned (6 downto 0);
		hex5	: out unsigned (6 downto 0);
		LED	: out std_logic
	);
end part2;

architecture part2arch of part2 is
signal AMSB, ALSB, BMSB, BLSB	: unsigned (3 downto 0);
signal OUTMS, OUTLS	: unsigned (3 downto 0);
begin
LATCHA : entity work.two_bit_bcd_latcher port map(msd, lsd, KEY1, AMSB, ALSB);
LATCHB : entity work.two_bit_bcd_latcher port map(msd, lsd, KEY0, BMSB, BLSB);
DISPLAY5: entity work.BCDto7Seg port map(AMSB, hex5);
DISPLAY4: entity work.BCDto7Seg port map(ALSB, hex4);
DISPLAY3: entity work.BCDto7Seg port map(BMSB, hex3);
DISPLAY2: entity work.BCDto7Seg port map(BLSB, hex2);
adder_subtractor: entity work.two_bit_adder_subtractor port map(AMSB, BMSB, ALSB, BLSB, add_sub, LED, OUTMS, OUTLS);
DISPLAY1: entity work.BCDto7Seg port map(OUTMS, hex1);
DISPLAY0: entity work.BCDto7Seg port map(OUTLS, hex0);

end part2arch;
