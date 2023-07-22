---                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
---                  %                                                        %
---                  %       IMPLEMENTAÇÃO DE UMA ALU DE 3 BITS EM VHDL       %
---                  %                                                        %    
---                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
---  ============================================================================================
---  Autor: Telmo Paes
---  Data: 22/07/2023
---  =============================================================================================
---  Descrição: Código paara implementação de unidade lógica aritmética (ALU) de três bits usando
---             linguagem de descrição de hardware (HDL).
---  
---  =============================================================================================
---                              ***  TABELA DA VERDADE E ESQUEMA ****
---  =============================================================================================
---                                                                              O            
---         sel[0]     sel[1]     sel[2]    |      O                            ||||
---       -------------------------------------------------              ------------------
---           0          0           0      |    A + B                 /                   \------ sel[0]
---           0          0           1      |    A - B                /       /------\       \---- sel[1]
---           0          1           0      |    A and B             /       /        \        \-- sel[2]
---           0          1           1      |    A or B             /-------/          \--------\
---           1          0           0      |    A xor B              ||||                  ||||
---           1          0           1      |    not A                  A                     B
---           1          1           0      |    not B
---           1          1           1      |      Z
---
---  ===========================================================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity alu is port                                      --- Define uma entidade "alu" com pinos de entrada e saída.
(
  A,B    in      :    std_logic_vector(3 downto 0);     --- Define dois barramentos de 3 bits de entrada A e B.
  O      out     :    std_logic_vector(3 downto 0);     --- Define um barramento de 3 bits como saída da ALU.
  sel    in      :    std_logic_vector(2 downto 0);     --- Define um barramento de entrada de 3 bits como seleção da ALU.
);
end alu;                                                --- Encerra as definições de pino para a entidade "alu".

architecture hardware of alu is                         --- Inicia as configurações de hardware interno da "alu".
begin
  process(A,B,sel)                                      --- Estabelece uma linha de comandos a serem executados sequencialmente.
  begin                                                 --- Inicia os comandos na rotina "process" abaixo de begin.         
    case sel is                                         --- 
      when "000" => O <= A + B;
      when "001" => O <= A - B;
      when "010" => O <= A AND B;
      when "011" => O <= A OR B;
      when "100" => O <= A XOR B;
      when "101" => O <= NOT A;
      when "110" => O <= NOT B;
      when "111" => O <= Z;
    end case;
  end process;
end hardware;
        
