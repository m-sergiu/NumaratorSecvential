library ieee;
use ieee.std_logic_1164.all;

entity ic4017 is
port(cp0, cp1, mr, ldn: in std_logic;
     d:in std_logic_vector(3 downto 0);
     q:out std_logic_vector (0 to 9));
end entity;

architecture ic4017 of ic4017 is

signal qint: std_logic_vector(0 to 9):="1000000000";

begin

process(mr, cp0)
begin
if mr='1' then
  qint <= "1000000000";
elsif rising_edge(cp0) then
  if ldn='0' then
    case d is
      when "0000" => qint <= "1000000000";
      when "0001" => qint <= "0100000000"; 
      when "0010" => qint <= "0010000000";
      when "0011" => qint <= "0001000000";
      when "0100" => qint <= "0000100000";
      when "0101" => qint <= "0000010000"; 
      when "0110" => qint <= "0000001000";
      when "0111" => qint <= "0000000100";
      when "1000" => qint <= "0000000010";
      when "1001" => qint <= "0000000001";
      when others => qint <= "1000000000";
    end case;
  elsif cp1='0' then
     qint <= qint(9)&qint(0 to 8);
  end if;
end if;
end process;

q <= qint;

end ic4017;

  
