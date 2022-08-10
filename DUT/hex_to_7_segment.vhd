LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity hex_to_7_segment is
	port(
		hex    : in  std_logic_vector(3 downto 0);
		hex_out : out std_logic_vector (6 downto 0));
end hex_to_7_segment;

architecture rtl of hex_to_7_segment is
begin
	----------------------------------------------------------------------------
	converter : process(hex)
	begin
		case hex is
			when X"0"   => hex_out <= "1000000"; -- "0"     
			when X"1"   => hex_out <= "1111001"; -- "1" 
			when X"2"   => hex_out <= "0100100"; -- "2" 
			when X"3"   => hex_out <= "0110000"; -- "3" 
			when X"4"   => hex_out <= "0011001"; -- "4" 
			when X"5"   => hex_out <= "0010010"; -- "5" 
			when X"6"   => hex_out <= "0000010"; -- "6" 
			when X"7"   => hex_out <= "1111000"; -- "7" 
			when X"8"   => hex_out <= "0000000"; -- "8"     
			when X"9"   => hex_out <= "0010000"; -- "9" 
			when X"A"   => hex_out <= "0001000"; -- A
			when X"B"   => hex_out <= "0000011"; -- B
			when X"C"   => hex_out <= "1000110"; -- C
			when X"D"   => hex_out <= "0100001"; -- D
			when X"E"   => hex_out <= "0000110"; -- E
			when X"F"   => hex_out <= "0001110"; -- F
			when others => hex_out <= "1111111"; -- OFF (default)
		end case;
	end process;

end rtl;