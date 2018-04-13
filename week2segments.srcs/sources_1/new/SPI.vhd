----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2018 09:22:28 PM
-- Design Name: 
-- Module Name: SPI - Behavioral
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

entity SPI is
    Port ( clk : in STD_LOGIC;
           byte : out STD_LOGIC_VECTOR (7 downto 0);
           byteReady : out STD_LOGIC;
           mosi : in STD_LOGIC;
           miso : out STD_LOGIC;
           spiClk : in STD_LOGIC;
           ss : in STD_LOGIC);
end SPI;

architecture Behavioral of SPI is

begin


end Behavioral;
