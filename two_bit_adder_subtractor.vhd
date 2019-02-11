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
		add_sub : in std_logic;

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
	num1 <= (msd1 * 10) + lsd1;
	num2 <= (msd2 * 10) + lsd2;
	if (add_sub = '1') then
		intermediate_sum <= num1 + num2;
	else
		intermediate_sum <= num1 - num2;
	end if;
	
end process;

end arch_twobit;
