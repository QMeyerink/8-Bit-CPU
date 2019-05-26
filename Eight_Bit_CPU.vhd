----------------------------------------------------------------------------------
--Students : Tyler Noah, Quinlan Meyerink, Callum Baker
--Course: ENEL 373 Digital Electronics and Devices S1/19
-- 
-- Create Date: 11.03.2019 14:43:39
-- Design Name: Eight Bit CPU
-- Module Name: Eight_Bit_CPU - Structural
-- Project Name: Eight Bit CPU
-- Target Devices: Nexys A7
-- Tool Versions: 
-- Description: A simplifeied 8-bit CPU that can preform addition,
--  subtraction, and bitwise AND, OR and XOR operations. Operands
--  are enter using slider switches then entered with D-pad.
--  Displays result on LED strip in Binary.
-- 

-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Set inputs and output signals for structural system.
entity Eight_Bit_CPU is
    Port ( SW: in STD_LOGIC_VECTOR( 7 downto 0);
           BTNL, BTNR, BTNC: in STD_LOGIC;
           CLK100MHZ: in STD_LOGIC;
           LED: out STD_LOGIC_VECTOR(7 downto 0));
end Eight_Bit_CPU;



architecture Behavioral of Eight_Bit_CPU is

-- Declare all temporary signals for use between componenets within CPU.
signal reg_A : STD_LOGIC_VECTOR (7 downto 0);
signal reg_B : STD_LOGIC_VECTOR (7 downto 0);
signal reg_Result : STD_LOGIC_VECTOR ( 7 downto 0);
signal res : STD_LOGIC_VECTOR (7 downto 0);
signal LED_res : STD_LOGIC_VECTOR ( 7 downto 0);


-- Pull in all required components

-- General purpose registers supporting 8_bit storage,
-- used for operand and result storage.
component Register_GP is
    Port(D: in std_logic_vector( 7 downto 0);
        Clk : in std_logic;
        En : in std_logic;
        Q : out std_logic_vector(7 downto 0));
        
end component;

-- ALU takes two operands and returns result based on given opcode.
component ALU is
   Port ( reg_A : in STD_LOGIC_VECTOR (7 downto 0);
          reg_B : in STD_LOGIC_VECTOR (7 downto 0);
          result : out STD_LOGIC_VECTOR (7 downto 0);
          OpCode : in STD_LOGIC_VECTOR (7 downto 0);
          enable: in STD_LOGIC);
           
end component;

-- Takes operands and result and displays them on LED strip when relevant button is pressed and held.
component LED_Display is
    Port (  reg_A: in STD_LOGIC_VECTOR(7 downto 0);
            reg_B: in STD_LOGIC_VECTOR(7 downto 0);
            reg_res: in STD_LOGIC_VECTOR(7 downto 0);
            BTNL: in STD_LOGIC;
            BTNR: in STD_LOGIC;     
            BTNC: in STD_LOGIC;
            LED_res: out STD_LOGIC_VECTOR(7 downto 0));
                       
end component;

-- Maps all signals to the internal components.
begin

FillRegA: Register_GP port map(SW, CLK100MHZ, BTNL, reg_A);           --Add switch values to register A
FillRegB: Register_GP port map(SW, CLK100MHZ, BTNR, reg_B);           --Add switch values to register B

Calculate: ALU port map(reg_A, reg_B, res, SW, BTNC);                 --ALU portmap, take regs and Opcodes returns final result

FillRegRes: Register_GP port map(res, CLK100MHZ, BTNC, reg_Result);   --Take values of registers and switches for opcode, return ALU result

DisplayLEDs: LED_Display port map(reg_A, reg_B, reg_Result, BTNL,
                                  BTNR, BTNC, LED_res);         --Display LEDs of last register updated.


LED <= LED_res;                                                       --Push result of Display to actual display.

end Behavioral;
