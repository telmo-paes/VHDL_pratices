---            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
---            %                                                                               %
---            %         DECODIFICADOR DE BINÁRIO EM 4 BITS P/ DISPLAY 7 SEGMENTOS (BCD)       %
---            %                                                                               %
---            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
---  ======================================================================================================
---  Autor: Telmo Paes
---  Data: 21/07/2023
---  ======================================================================================================
---  Descrição: Código para implementação de um chip conversor de binários até 4 bits para um display LED
---            de 7 segmentos, utilizando linguagem de descrição de hardware VHDL.
---
---  ======================================================================================================
---                                    ** TABELA DA VERDADE E ESQUEMA **
---  ======================================================================================================
---
---        A0   A1   A2   A3   |  a  b  c  d  e  f  g
---      ------------------------------------------
---        0    0    0    0    | 
---        0    0    0    1    |
---        0    0    1    0    |
---        0    0    1    1    |
---        0    1    0    0    |
---        0    1    0    1    |
---        0    1    1    0    |
---        0    1    1    1    |
---        1    0    0    0    |
---        1    0    0    1    |
---        1    0    1    0    |
---        1    0    1    1    |
---        1    1    0    0    |
---        1    1    0    1    |
---        1    1    1    0    |
---        1    1    1    1    |
---
---  ======================================================================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity bcd7seg is port
  (
    dig_4bits     :    in std_logic_vector(3 downto 0);
    seg7          :    out std_logic_vector(7 downto 0)
  );
end bcd7seg;

architecture hardware of bcd7seg is
begin
  process(dig_4bits)
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
      when others => seg7 <= "11111111";
    end case;
  end process;
end hardware;
  
    
