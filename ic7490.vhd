
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ic7490 is 
port (clk,ldn: in STD_LOGIC;
ro:in STD_LOGIC_VECTOR (1 downto 0);
rg: in STD_LOGIC_VECTOR (1 downto 0);
d:in std_logic_vector(3 downto 0);
q:inout std_logic_vector(3 downto 0));
end ic7490;

architecture dcounter of ic7490 is
begin
process(clk)
begin
if (ro(0)='1'and ro(1)='1'and rg(0)='0')then q<="0000";
elsif(ro(0)='1'and ro(1)='1'and rg(1)='0')then q<="0000";
elsif(ro(0)='0' and rg(0)='1'and rg(1)='1')then q<="1001";
elsif(ro(1)='0' and rg(0)='1'and rg(1)='1')then q<="1001";
elsif(clk'event and clk='1')then
if ldn='0'then
q <= d; 
elsif q="1001" then
  q<="0000";
else
q<=q+1;
end if;
end if;
end process;

end dcounter;