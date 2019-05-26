----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2019 14:54:03
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; --Libary used for Adding and Subtracting

entity ALU_tb is
end ALU_tb;


architecture Behavioral of ALU_tb is

component ALU 
    port( reg_A : in STD_LOGIC_VECTOR (7 downto 0);
          reg_B : in STD_LOGIC_VECTOR (7 downto 0);
          result : out STD_LOGIC_VECTOR(7 downto 0);
          OpCode : in STD_LOGIC_VECTOR (7 downto 0);
          enable: in STD_LOGIC);
     end component; 

signal reg_A: STD_LOGIC_VECTOR (7 downto 0);
signal reg_B: STD_LOGIC_VECTOR (7 downto 0);
signal result: STD_LOGIC_VECTOR (7 downto 0);
signal OpCode: STD_LOGIC_VECTOR (7 downto 0);
signal enable: STD_LOGIC;
 
 
begin

    UUT: ALU port map (reg_A => reg_A,
                      reg_B => reg_B,
                      result =>  result,
                      OpCode => OpCode,
                      enable =>  enable);
                                            
process
variable enable_var: STD_LOGIC;
variable OpCode_var: STD_LOGIC_VECTOR (7 downto 0);

    begin
       reg_A <= "00001000";
       reg_B <= "00000001";
       OpCode <= "00000010";             
       enable <= '1';
       wait for 100 ns;
       enable <= '0';
       OpCode <= "00000011";
       wait for 100 ns;
       enable <= '1';
       wait for 100 ns;
       enable <= '0';
       OpCode <= "00000100"; 
       wait for 100 ns;   
       enable <= '1';                 
       wait;
     
END PROCESS;



end Behavioral;
