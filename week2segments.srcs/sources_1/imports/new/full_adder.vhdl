----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2018 08:04:38 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( carry_in : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin

    x <= a xor b xor carry_in;
    carry_out <= (a and b) or (carry_in and (a xor b));

end Behavioral;
