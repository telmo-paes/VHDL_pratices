---
---
---
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity bcd7seg is port
  (
    input_4bits in     :    std_logic_vector(3 downto 0);
    output_7seg out    :    std_logic_vector(3 downto 0)
  )
end bcd7seg;

architecture hardware of bcd7seg is
begin
  process(input_4bits,output_7seg)
    begin
      case input_4bits is
        when "0000" => output_7seg <= "11000000"
        when "0001" => output
