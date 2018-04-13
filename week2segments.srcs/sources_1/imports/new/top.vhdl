----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2018 08:04:38 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( sw  : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an  : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (4 downto 0));
end top;

architecture Behavioral of top is

component fourBitAdder is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           x : out STD_LOGIC_VECTOR (4 downto 0));
end component fourBitAdder;

component HexToBCD is
    Port ( hex    : in  STD_LOGIC_VECTOR (4  downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end component HexToBCD;

component sevenSegment IS
	Port(	input : in STD_LOGIC_VECTOR(15 DOWNTO 0);
			clk, rst : in STD_LOGIC;
			segment : out STD_LOGIC_VECTOR(7 DOWNTO 0);
			digit : out STD_LOGIC_VECTOR(3 DOWNTO 0)
		 );
end component sevenSegment;

component clkDiv IS
	Port( clk : in STD_LOGIC;
		  clkSlow : out STD_LOGIC
		 );
end component clkDiv;

 signal tempbcd : STD_LOGIC_VECTOR(15 downto 0);
 signal ledTemp : STD_LOGIC_VECTOR(4 downto 0);
 signal clkSlow : STD_LOGIC;
 signal segmentbuffer : STD_LOGIC_VECTOR (7 downto 0);
begin

adder: fourBitAdder port map(sw(7 downto 4),sw(3 downto 0),ledTemp);
converter: HexToBCD port map(ledTemp,tempbcd);
display: sevenSegment port map(tempbcd,clkSlow, '1',segmentbuffer, an);
clkdivider: clkDiv port map(clk, clkSlow);
led <= ledTemp;
seg <= segmentbuffer(6 downto 0);
end Behavioral;
