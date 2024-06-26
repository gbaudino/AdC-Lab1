// maindec

module maindec (input logic [10:0] Op,
					 output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
					 output logic  [1:0] ALUOp);
					 
		logic [0:8] results;
		
		always_comb
		casez(Op)
			11'b111_1100_0010 : results = 9'b011110000;
			11'b111_1100_0000 : results = 9'b110001000;
			11'b101_1010_0??? : results = 9'b100000101;
			11'b100_0101_1000 : results = 9'b000100010;
			11'b110_0101_1000 : results = 9'b000100010;
			11'b100_0101_0000 : results = 9'b000100010;
			11'b101_0101_0000 : results = 9'b000100010;
			11'b110_1001_01?? : results = 9'b010100011; //MOVZ
			default : results = 9'b000000000;
		endcase 
		
		assign Reg2Loc = results[0];
		assign ALUSrc = results[1];
		assign MemtoReg = results[2];
		assign RegWrite = results[3];
		assign MemRead = results[4];
		assign MemWrite = results[5];
		assign Branch = results[6];
		assign ALUOp = results[7:8];
		
endmodule 