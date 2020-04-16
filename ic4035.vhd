
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 

entity ic4035 is

port (clk, r, ps, j, kn : in std_logic;
	D : in std_logic_vector (0 to 3);
	Q : out std_logic_vector (0 to 3));

end entity;

architecture behavior of ic4035 is

signal qint: std_logic_vector (0 to 3):="0000";



-- ser --> srin
begin

process (r,clk)

begin 

if r='1' then
qint <= "0000";

elsif clk'event and clk='1' then

	if ps='1' then
             qint <= d;
        elsif j='0' and kn='0' then
	  qint <= '0' & qint (0 to 2);

	elsif j='1' and kn='1' then
	  qint <= '1' & qint (0 to 2);
	end if;

end if;

end process;

Q <= qint;


end behavior;






