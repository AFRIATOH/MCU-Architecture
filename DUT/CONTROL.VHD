		-- control module (implements MIPS control unit)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY control IS
   PORT( 	
	Opcode 			: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	func        	: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	RegDst 			: OUT 	STD_LOGIC;
	Jump        	: OUT   STD_LOGIC;
	JumpAndLink	    : OUT   STD_LOGIC;
	Branch 			: OUT 	STD_LOGIC;
	MemRead 		: OUT 	STD_LOGIC;
	MemtoReg 		: OUT 	STD_LOGIC;
	ALUOp 			: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	MemWrite 		: OUT 	STD_LOGIC;
	ALUSrc 			: OUT 	STD_LOGIC;
	RegWrite 		: OUT 	STD_LOGIC;
	clock, reset	: IN 	STD_LOGIC );

END control;

ARCHITECTURE behavior OF control IS

	SIGNAL  R_format, Lw, Sw, Beq, Addi, Mul, Andi, Ori, Xori, Lui, J, JR, JAL 	: STD_LOGIC;
-- Sll -- Srl -- Move
BEGIN           
				-- Code to generate control signals using opcode bits
	R_format 	<=  '1'  WHEN  Opcode = "000000" AND (NOT (func = "001000"))  ELSE '0';
	Lw          <=  '1'  WHEN  Opcode = "100011"  ELSE '0';
 	Sw          <=  '1'  WHEN  Opcode = "101011"  ELSE '0';
   	Beq         <=  '1'  WHEN  Opcode = "000100"  ELSE '0';
	Bne			<=  '1'  WHEN  Opcode = "000101"  ELSE '0';
	Addi        <=  '1'  WHEN  Opcode = "001000"  ELSE '0';
	Andi        <=  '1'  WHEN  Opcode = "001100"  ELSE '0';
	Ori         <=  '1'  WHEN  Opcode = "001101"  ELSE '0';
	Xori        <=  '1'  WHEN  Opcode = "001110"  ELSE '0';
	Lui         <=  '1'  WHEN  Opcode = "001111"  ELSE '0';
	Mul			<=  '1'  WHEN  Opcode = "011100"  AND func = "000010" ELSE '0';
	J	        <=  '1'  WHEN  Opcode = "000010"  ELSE '0';
	JR	        <=  '1'  WHEN  Opcode = "000000"  AND func = "001000" ELSE '0';
	JAL	        <=  '1'  WHEN  Opcode = "000011"  ELSE '0';
	Jump		<=  J OR JR OR JAL;
	JumpAndLink <=  JAL;
  	RegDst    	<=  R_format;
 	ALUSrc  	<=  Lw OR Sw;
	MemtoReg 	<=  Lw;
  	RegWrite 	<=  R_format OR Lw OR JAL OR I_format;
  	MemRead 	<=  Lw;
   	MemWrite 	<=  Sw; 
 	Branch      <=  Beq;
	ALUOp( 1 ) 	<=  R_format;
	ALUOp( 0 ) 	<=  Beq; 

   END behavior;


