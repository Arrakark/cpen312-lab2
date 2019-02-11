library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity two_bit_adder_subtractor is
	port
	(
		-- Input ports
		msd1	: in  unsigned (3 downto 0);
		msd2	: in  unsigned (3 downto 0);
		lsd1	: in  unsigned (3 downto 0);
		lsd2	: in  unsigned (3 downto 0);
		add_sub : in std_logic := '1';

		-- Output ports
		overflow	: out std_logic;
		msdout	: inout  unsigned (3 downto 0);
		lsdout	: inout  unsigned (3 downto 0)
	);
end two_bit_adder_subtractor;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture arch_twobit of two_bit_adder_subtractor is
signal intermediate_sum : unsigned (7 downto 0);
signal num1 : unsigned (7 downto 0);
signal num2 : unsigned (7 downto 0);
begin

process(msd1, lsd1, msd2, lsd2, lsdout, intermediate_sum)
begin
	num1 <= msd1 * "1010" + lsd1;
	num2 <= msd2 * "1010" + lsd2;
	if (add_sub = '1') then
		intermediate_sum <= num1 + num2;
	else
		intermediate_sum <= num1 - num2;
	end if;
	intermediate_sum <= "0000" & (intermediate_sum mod "1010");
	lsdout <= intermediate_sum(3 downto 0);
	intermediate_sum <= (intermediate_sum - lsdout);
	msdout <= intermediate_sum(3 downto 0);
	overflow <= intermediate_sum(4);
end process;

end arch_twobit;
