-- Code your design here
library ieee;
use ieee. std_logic_1164.all;
 
entity D_FF is
PORT(clk, d: in std_logic;
q: out std_logic);
end D_FF;
 
architecture behavioral of D_FF is
begin
process(clk)
begin
if(clk='1' and clk'EVENT) then
q <= d;
end if;
end process;
end behavioral;

library IEEE;
use IEEE.std_logic_1164.all;

entity counter is
port(
clk : in std_logic;
v : in std_logic_vector(3 downto 0);
x : in std_logic;
y: out std_logic_vector(3 downto 0));
end counter;

architecture counter1 of counter is

component D_FF
PORT(clk, d: in std_logic;
q: out std_logic);
end component;

signal D: std_logic_vector(3 downto 0);
begin

w0 : D_FF
port map(
clk => clk,
d => ((not(x) and not(v(3)) and v(2) and v(1) and v(0))or(not(x)and v(3)and not(v(2)) and not(v(1)) and not(v(0)))or(x and not(v(3))and not(v(2))and not(v(1))and not(v(0)))or(x and v(3) and v(0)) or(x and v(3) and v(2)) or(x and v(3) and v(1))),
q => y(3));



w1 : D_FF
port map(
clk => clk,
d => (not(x)and not(v(3))and not(v(2))and v(1)and v(0))or(x and v(3)and not(v(2))and not(v(1))and not(v(0)))or(not(v(3))and v(2)and v(1)and not(v(0)))or(not(x)and not(v(3))and v(2)and not (v(1))) or (x and not(v(3)) and v(2) and v(0)),
q => y(2));



w2 : D_FF
port map(
clk => clk,
d => (x and not(v(3)) and v(2) and not(v(1)) and not(v(0))) or (x and v(3) and not(v(2)) and not(v(1)) and not(v(0))) or (not(x) and not(v(3)) and not(v(1)) and v(0)) or (not(x) and not(v(3)) and v(1) and not(v(0))) or (x and not(v(3)) and v(1) and v(0)), 
q => y(1)
);



w3 : D_FF
port map(
clk => clk,
d => (not(v(2)) and not(v(1)) and not(v(0))) or (x and v(3) and v(1)) or (x and v(3) and v(2)) or (not(v(3)) and not(v(0))),
q => y(0)
);

end counter1;


