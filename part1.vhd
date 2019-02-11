library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity unsigned_adder_subtractor is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		a		: in unsigned ((DATA_WIDTH-1) downto 0);
		b		: in unsigned ((DATA_WIDTH-1) downto 0);
		add_sub : in std_logic;
		result	: out unsigned ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture rtl of unsigned_adder_subtractor is
begin

	process(a,b,add_sub)
	begin
		-- add if "add_sub" is 1, else subtract
		if (add_sub = '1') then
			result <= a + b;
		else
			result <= a - b;
		end if;
	end process;

end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;



entity eight_bit_button_latch is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		latchbutton : in std_logic;
		latchdata		: in unsigned ((DATA_WIDTH-1) downto 0);
		stored_data		: out unsigned ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture rtl2 of eight_bit_button_latch is
begin

	-- Update the variable only when updates are enabled
process(latchbutton, latchdata)
begin
	if (rising_edge(latchbutton)) then
		stored_data <= latchdata;
	end if;
end process;

end rtl2;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity part1 is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		input_numbers		: in unsigned ((DATA_WIDTH-1) downto 0);
		KEY1	: in std_logic;
		KEY2	: in std_logic;
		add_sub	: in std_logic;
		output_led	: out unsigned ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture project_structure of part1 is
signal latched_1, latched_2		: unsigned (7 downto 0);

begin

LATCH1 : entity work.eight_bit_button_latch port map(KEY1, input_numbers, latched_1);
LATCH2 : entity work.eight_bit_button_latch port map(KEY2, input_numbers, latched_2);
adder_subtractor : entity work.unsigned_adder_subtractor port map(latched_1, latched_2, add_sub, output_led);

end project_structure;
