// alu

module alu (input logic [63:0] a, b,
			input logic [3:0] ALUControl,
			input logic [1:0] LSL,
			output logic [63:0] result,
			output logic zero);
				
	always_comb
		begin
			casez(ALUControl)
				4'b0000: result = a & b;
				4'b0001: result = a | b;
				4'b0010: result = a + b;
				4'b0110: result = a - b;
				4'b0111: result = b;
				4'b0100: result = b << (LSL * 16);
				default: result = '1;
			endcase
				
			zero = (result == '0) ? '1 : '0;
		end
		
endmodule
 		
				