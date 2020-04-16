
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 

entity ic40149 is

port (clk, SRin, SLin, s0, s1,rstn : in std_logic;
	D : in std_logic_vector (0 to 3);
	Q : out std_logic_vector (0 to 3));

end entity;

architecture behavior of ic40149 is

signal qint: std_logic_vector (0 to 3):="0000";



-- ser --> srin
begin

process (rstn,clk)

begin 

if rstn='0' then
qint <= "0000";

elsif clk'event and clk='1' then

	if s0='1' and s1='0' then
	  qint <= SRin & qint (0 to 2);

	elsif s0='0' and s1='1' then
	  qint <= qint (1 to 3) & SLin;
	elsif s0='1' and s1='1' then
	
	qint <= D;
	end if;



end if;

end process;

Q <= qint;


end behavior;






