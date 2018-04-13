LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ClkDiv IS
	PORT( clk : in STD_LOGIC;
	      clkSlow : out STD_LOGIC
		 );
END ClkDiv;

ARCHITECTURE behaviour OF ClkDiv IS
	
	SIGNAL clockSlow : STD_LOGIC;
	
	BEGIN
		
	cnt : PROCESS(clk)	
		VARIABLE counter : integer range 0 to 20000 := 0;
		BEGIN
		IF rising_edge(clk) THEN
			IF counter = 20000 THEN
				counter := 0;
				clockSlow <= not clockSlow;
			ELSE
				counter := counter + 1;
			END IF;
		END IF;
	clkSlow <= clockSlow;
	END PROCESS cnt;
END behaviour;