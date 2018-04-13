----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2018 08:41:13 PM
-- Design Name: 
-- Module Name: 4bit_adder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fourBitAdder is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           x : out STD_LOGIC_VECTOR (4 downto 0));
end fourBitAdder;

architecture Behavioral of fourBitAdder is
    component full_adder is
    Port ( carry_in : in STD_LOGIC;
               a : in STD_LOGIC;
               b : in STD_LOGIC;
               x : out STD_LOGIC;
               carry_out : out STD_LOGIC);
    end component full_adder;    

    signal c1,c2,c3,c4: STD_LOGIC;
    signal result: STD_LOGIC_VECTOR (3 downto 0);
begin

    adder1: full_adder port map('0',a(0),b(0),result(0),c1);
    adder2: full_adder port map(c1,a(1),b(1),result(1),c2);
    adder3: full_adder port map(c2,a(2),b(2),result(2),c3);
    adder4: full_adder port map(c3,a(3),b(3),result(3),c4);
    x <= c4 & result;
end Behavioral;
