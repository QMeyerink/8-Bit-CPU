----------------------------------------------------------------------------------
--Students : Tyler Noah, Quinlan Meyerink, Callum Baker
--Course: ENEL 373 Digital Electronics and Devices S1/19
-- 
-- Create Date: 11.03.2019 14:43:39
-- Design Name: LED_Display
-- Module Name: LED_Display - Behavioral
-- Project Name: Eight Bit CPU
-- Target Devices: Nexys A7
-- Tool Versions: 
-- Description: Takes enable buttons and register vector and displays in binary on LED strip.
-- 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity LED_Display is

    Port (  reg_A: in STD_LOGIC_VECTOR(7 downto 0);
            reg_B: in STD_LOGIC_VECTOR(7 downto 0);
            reg_res: in STD_LOGIC_VECTOR(7 downto 0);
            BTNL: in STD_LOGIC;
            BTNR: in STD_LOGIC;     
            BTNC: in STD_LOGIC;
            LED_res : out STD_LOGIC_VECTOR (7 downto 0));
            
            
end LED_Display;

architecture Behavioral of LED_Display is

signal tmp_LED: STD_LOGIC_VECTOR(7 downto 0); --Temp signal for use within process


begin
    process(BTNL, BTNR, BTNC) is --Check if register A, B, or result has been accessed
        begin
        
        tmp_LED <= "00000000";
        
            if(BTNL = '1') then
               tmp_LED <= reg_A; --Display val of register A
            
            
            elsif(BTNR = '1') then
                tmp_LED <= reg_B; --Display register B
     
            
            elsif(BTNC = '1') then
                tmp_LED <= reg_res; --Display operation solution 
                
            end if;
            
            
end process;

 LED_res <= tmp_LED; --Set temp output to actual output

end Behavioral;
