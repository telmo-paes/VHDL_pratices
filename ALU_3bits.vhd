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

entity ALU_3bits is port                                --- Define uma entidade "alu" com pinos de entrada e saída.
(
  A,B    in      :    std_logic_vector(3 downto 0);     --- Define dois barramentos de 3 bits de entrada A e B.
  O      out     :    std_logic_vector(3 downto 0);     --- Define um barramento de 3 bits como saída da ALU.
  sel    in      :    std_logic_vector(2 downto 0)      --- Define um barramento de entrada de 3 bits como seleção da ALU.
);
end ALU_3bits;                                                --- Encerra as definições de pino para a entidade "alu".

architecture hardware of ALU_3bits is                   --- Inicia as configurações de hardware interno da "alu".
begin                                                   --- Inicia as configurações de hardware interno da "alu".
  process(A,B,sel)                                      --- Estabelece uma linha de comandos a serem executados sequencialmente.
  begin                                                 --- Inicia os comandos na rotina "process" abaixo de begin.         
    case sel is                                         --- Comaando que executa as funções abaixo caso "sel" atenda a condição atribuida.
      when "000" => O <= A + B;                         --- Enquanto o sel = "000", indica a saída 'O' como a operação A + B.
      when "001" => O <= A - B;                         --- Enquanto o sel = "001", indica a saída 'O' como a operação A - B.
      when "010" => O <= A AND B;                       --- Enquanto o sel = "010", indica a saída 'O' como a operação lógica A and B.
      when "011" => O <= A OR B;                        --- Enquanto o sel = "011", indica a saída 'O' como a operação lógica A or B.
      when "100" => O <= A XOR B;                       --- Enquanto o sel = "100", indica a saída 'O' como a operação lógica A xor B.
      when "101" => O <= NOT A;                         --- Enquanto o sel = "101", indica a saída 'O' como a operação lógica not A.
      when "110" => O <= NOT B;                         --- Enquanto o sel = "110", indica a saída 'O' como a operação lógica not B.
      when "111" => O <= Z;                             --- Enquanto o sel = "111", indica a saída 'O' como sendo uma impedância alta.
    end case;                                           --- Encerra o case.
  end process;                                          --- Enecrra a execução do código em sequencial.
end hardware;                                           --- Finaliza a configuração de harware da ALU.
        
