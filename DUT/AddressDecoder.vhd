-- Address Decoder
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY AddressDecoder IS

	PORT(
		Address : IN STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		HEX0_ena : OUT BOOLEAN;
		HEX1_ena : OUT BOOLEAN;
		HEX2_ena : OUT BOOLEAN;
		HEX3_ena : OUT BOOLEAN;
		LEDG_ena : OUT BOOLEAN;
		LEDR_ena : OUT BOOLEAN;
		SW_ena   : OUT BOOLEAN
	);
END AddressDecoder;

ARCHITECTURE structure OF AddressDecoder IS
BEGIN

	LEDG_ena <= Address = "10" & X"00"; -- 0x800
	LEDR_ena <= Address = "10" & X"01"; -- 0x804
	HEX0_ena <= Address = "10" & X"02"; -- 0x808
	HEX1_ena <= Address = "10" & X"03"; -- 0x80C
	HEX2_ena <= Address = "10" & X"04"; -- 0x810
	HEX3_ena <= Address = "10" & X"05"; -- 0x814
	SW_ena   <= Address = "10" & X"06"; -- 0x818

	--PROCESS(Address)
	--	VARIABLE full_address : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	--BEGIN
	--	full_address := Address & "00";

	--	LEDG_ena <= full_address = X"800"; -- 0x800
	--	LEDR_ena <= full_address = X"804"; -- 0x804
	--	HEX0_ena <= full_address = X"808"; -- 0x808
	--	HEX1_ena <= full_address = X"80C"; -- 0x80C
	--	HEX2_ena <= full_address = X"810"; -- 0x810
	--	HEX3_ena <= full_address = X"814"; -- 0x814
	--	SW_ena   <= full_address = X"818"; -- 0x818

	--END PROCESS;

END structure;

