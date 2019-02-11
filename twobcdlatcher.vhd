library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity two_bit_bcd_latcher is
	port
	(
		-- Input ports
		msd	: in  unsigned (3 downto 0);
		lsd	: in  unsigned (3 downto 0);
		latch : in std_logic;

		-- Output ports
		stored_msd	: out  unsigned (3 downto 0);
		stored_lsd	: out  unsigned (3 downto 0)
	);
end two_bit_bcd_latcher;
architecture functionality of two_bit_bcd_latcher is
begin
process(latch, msd, lsd)
begin
	if (rising_edge(latch)) then
		stored_msd <= msd;
		stored_lsd <= lsd;
	end if;
end process;

end functionality;
