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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI is
    Port ( clk : in STD_LOGIC;
           byte : out STD_LOGIC_VECTOR (7 downto 0);
           byteIn : in STD_LOGIC_VECTOR (7 downto 0);
           byteReady : out STD_LOGIC;
           mosi : in STD_LOGIC;
           miso : out STD_LOGIC;
           spiClk : in STD_LOGIC;
           ss : in STD_LOGIC);
end SPI;

architecture Behavioral of SPI is

signal byteBuffer : STD_LOGIC_VECTOR(7 downto 0);
signal byteCounter : STD_LOGIC_VECTOR(3 downto 0);
signal prevClk : STD_LOGIC;

begin

   spiSlave : process(clk)
   begin
    if(ss = '1') then
        byte <= X"00";
        byteReady <= '0';
        byteCounter <= X"0";
    else
      if (rising_edge(clk)) AND (prevClk = (not spiClk)) AND spiClk = '1' then
        prevClk <= spiClk;
        if (unsigned(byteCounter) = 0) then
            byteBuffer <= byteIn;
            byteReady <= '0';
            miso <= byteBuffer(7);
            byteBuffer(7 downto 0) <= byteBuffer(6 downto 0) & mosi;
        elsif (unsigned(byteCounter) = 7) then
            miso <= byteBuffer(7);
            byteBuffer(7 downto 0) <= byteBuffer(6 downto 0) & mosi;
            byte <= byteBuffer;
            byteReady <= '1';            
            byteCounter <= X"f"
        else
            miso <= byteBuffer(7);
            byteBuffer(7 downto 0) <= byteBuffer(6 downto 0) & mosi;            
        end if;
      end if;
      byteCounter <= std_logic_vector(unsigned(byteCounter) + 1);
    end if;
    
   end process spiSlave;

end Behavioral;
