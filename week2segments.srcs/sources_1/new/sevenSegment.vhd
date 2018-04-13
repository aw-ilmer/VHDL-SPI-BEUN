LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY sevenSegment IS
	PORT(	input : in STD_LOGIC_VECTOR(15 DOWNTO 0);
			clk, rst : in STD_LOGIC;
			segment : out STD_LOGIC_VECTOR(7 DOWNTO 0);
			digit : out STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END sevenSegment;

ARCHITECTURE behaviour OF sevenSegment IS
	
	SIGNAL currDigit, nibbleIn : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"1";
	SIGNAL mask : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	begin
	
	digit <= not currDigit;
	
	mask <= 		not "00111111" WHEN nibbleIn = X"0" ELSE
					not "00000110" WHEN nibbleIn = X"1" ELSE
					not "01011011" WHEN nibbleIn = X"2" ELSE
					not "01001111" WHEN nibbleIn = X"3" ELSE
					not "01100110" WHEN nibbleIn = X"4" ELSE
					not "01101101" WHEN nibbleIn = X"5" ELSE
					not "01111101" WHEN nibbleIn = X"6" ELSE
					not "00000111" WHEN nibbleIn = X"7" ELSE
					not "01111111" WHEN nibbleIn = X"8" ELSE
					not "01100111" WHEN nibbleIn = X"9" ELSE
--					not "01110111" WHEN nibbleIn = X"A" ELSE  -- Hex is niet nodig, code golf!
--					not "00011111" WHEN nibbleIn = X"B" ELSE
--					not "01001110" WHEN nibbleIn = X"C" ELSE
--					not "00111101" WHEN nibbleIn = X"D" ELSE
--					not "01001111" WHEN nibbleIn = X"E" ELSE
--					not "01000111" WHEN nibbleIn = X"F" ELSE
					"XXXXXXXX";
	
	display : process(rst, clk)
		begin
		IF rst = '0' THEN
			segment <= X"FF";
		ELSIF rising_edge(clk) THEN
			IF currDigit = X"8" THEN
				currDigit <= X"1";
			ELSE
				currDigit <= currDigit(2 DOWNTO 0) & "0";
			END IF;
			
			IF currDigit = X"4" THEN
				nibbleIn <= input(3 DOWNTO 0);
			ELSIF currDigit = X"8" THEN
				nibbleIn <= input(7 DOWNTO 4);
			ELSIF currDigit = X"1" THEN
				nibbleIn <= input(11 DOWNTO 8);
			ELSIF currDigit = X"2" THEN
				nibbleIn <= input(15 DOWNTO 12);
			END IF;
			segment <= mask;
		END IF;
	END process display;
	
END behaviour;