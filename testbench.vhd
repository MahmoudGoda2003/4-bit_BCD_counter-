-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
library OSVVM;
use OSVVM.RandomPkg.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is
 component counter is
 port(
 clk : in std_logic;
 v : in std_logic_vector(3 downto 0);
 x : in std_logic;
 y : out std_logic_vector(3 downto 0));
 end component;
 
 
 constant ClockFrequency : integer := 100e6;
 constant ClockPeriod : time := 1000 ms / ClockFrequency;


signal clk_in : std_logic :='1';
signal x_in : std_logic;
signal v_in :std_logic_vector(3 downto 0);
signal y_out :std_logic_vector(3 downto 0);
signal finish : std_logic := '0';
begin
DUT :counter port map (clk_in, v_in, x_in, y_out);
 
 clk_in <= not clk_in after ClockPeriod / 2 when finish /= '1' else '0';

process is
variable random : RandomPType;
begin
 

v_in(0)<= random.RandSlv(1)(1);
wait for 1 ps;
v_in(1)<= random.RandSlv(1)(1);
wait for 1 ps;
v_in(2)<= random.RandSlv(1)(1);
wait for 1 ps;
v_in(3)<= random.RandSlv(1)(1);
wait for 1 ps;
x_in<=random.RandSlv(1)(1);
wait for 1 ps;
for i in 0 to 9 loop
  wait for 11 ns;
  report to_string(y_out);
  v_in <= y_out;
end loop;



finish<='1';
wait;
end process;
end tb;
 
 
 
 
 
 
 
 
 