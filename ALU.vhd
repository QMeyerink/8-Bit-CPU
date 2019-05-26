----------------------------------------------------------------------------------
--Students : Tyler Noah, Quinlan Meyerink, Callum Baker
--Course: ENEL 373 Digital Electronics and Devices S1/19
-- 
-- Create Date: 11.03.2019 14:43:39
-- Design Name: Eight Bit CPU
-- Module Name: Eight_Bit_CPU - Behavioral
-- Project Name: Eight Bit CPU
-- Target Devices: Nexys A7
-- Tool Versions: 
-- Description: A simplifeied 8-bit CPU that can preform addition,
--  subtraction, and bitwise AND, OR and XOR operations. Operands
--  are enter using slider switches then entered with D-pad.
--  Displays result on LED strip in Binary.
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; --Libary used for Adding and Subtracting

entity ALU is
    Port ( reg_A : in STD_LOGIC_VECTOR (7 downto 0);
           reg_B : in STD_LOGIC_VECTOR (7 downto 0);
           result : out STD_LOGIC_VECTOR(7 downto 0);
           OpCode : in STD_LOGIC_VECTOR (7 downto 0);
           enable: in STD_LOGIC);
end ALU;


architecture Behavioral of ALU is

signal tmp_result: STD_LOGIC_VECTOR (7 downto 0); --Temp signal for use within process

begin
process(enable)
    begin
        if(enable = '1') then --Check if the 'compute' button was pressed (Center button)
			if(OpCode = "00000010") then    
			 tmp_result <= (reg_A + reg_B); --Add values of A and B
			     
			elsif(OpCode = "00000011") then
                  tmp_result <= (reg_A - reg_B); -- subtract A from B
                  
            elsif(OpCode = "00000100") then
                  tmp_result <= (reg_A AND reg_B); --Find the BITWISE AND of A and B
                
            elsif(OpCode = "00000101") then
                  tmp_result <= (reg_A OR reg_B); --Find the BITWISE OR of A and B
            
            elsif(OpCode = "00000110") then
                  tmp_result <= (reg_A XOR reg_B); --Find the BITWISE Exculsive OR of A and B
              
            end if;
        end if;
                                
          
END PROCESS;

result <= tmp_result; --Set temp output to actual output

end Behavioral;
