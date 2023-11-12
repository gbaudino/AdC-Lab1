// execute

module execute #(parameter N = 64)
					(input logic AluSrc,
					 input logic [3:0] AluControl,
					 input logic [1:0] LSL,
					 input logic [N-1:0] PC_E, signImm_E, readData1_E, readData2_E,
					 output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E, 
					 output logic zero_E);

		logic [N-1:0] sl2_output, mux_output;
		
		sl2 SL2 (signImm_E, sl2_output);
		mux2 Mux (readData2_E, signImm_E, AluSrc, mux_output);
		alu ALU (readData1_E,  mux_output, AluControl, LSL, aluResult_E, zero_E);
		adder Add (PC_E, sl2_output, PCBranch_E);
		
		assign writeData_E = readData2_E;

endmodule 
