----------------------------------------------------------------------------------
--Students : Tyler Noah, Quinlan Meyerink, Callum Baker
--Course: ENEL 373 Digital Electronics and Devices S1/19
-- 
-- Create Date: 11.03.2019 14:43:39
-- Design Name: General purpose register.
-- Module Name: Register_GP - Behavioral
-- Project Name: Eight Bit CPU
-- Target Devices: Nexys A7
-- Tool Versions: 
-- Description: Stores an incoming 8 bit signal in rising edge triggered flip-flops upon enable.
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Set inputs and output signals for behavioural system.
entity Register_GP is
  Port (
        D: in std_logic_vector( 7 downto 0);
        Clk : in std_logic;
        En : in std_logic;
        Q : out std_logic_vector(7 downto 0));
end Register_GP;

architecture Behavioral of Register_GP is

begin

--Sequential process which is senstive to clock changes.
process(Clk)
    begin
        if (Clk'event and Clk = '1') then   -- Rising edge synchronus trigger for register fill.
            if(En = '1') then
                Q <= D;
            end if;
        end if;
     
end process;

end Behavioral;
