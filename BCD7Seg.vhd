---  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
---  %                                                                               %
---  %         DECODIFICADOR DE BINÁRIO EM 4 BITS P/ DISPLAY 7 SEGMENTOS (BCD)       %
---  %                                                                               %
---  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
---
---
---
---
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity bcd7seg is port
  (
    dig_4bits in     :    std_logic_vector(3 downto 0);
    seg7 out         :    std_logic_vector(3 downto 0)
  )
end bcd7seg;

architecture hardware of bcd7seg is
begin
  process(dig_4bits,seg7)
  begin
    case dig_4bits is
      when "0000" => seg7 <= "11000000";
      when "0001" => seg7 <= "11111001"; 
      when "0010" => seg7 <= "10100100";
      when "0011" => seg7 <= "10110000";
      when "0100" => seg7 <= "10011001";
      when "0101" => seg7 <= "10010010";
      when "0110" => seg7 <= "10000010";
      when "0111" => seg7 <= "11111000";
      when "1000" => seg7 <= "10000000";
      when "1001" => seg7 <= "10010000";
      when "1010" => seg7 <= "10001000";
      when "1011" => seg7 <= "10000011";
      when "1100" => seg7 <= "11000110";
      when "1101" => seg7 <= "10100001";
      when "1110" => seg7 <= "10000110";
      when "1111" => seg7 <= "10001110";
    end case;
  end process;
end hardware;
  
    
