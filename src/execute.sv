// execute

module execute #(parameter N = 64)
					(input logic AluSrc,
					 input logic [3:0] AluControl,
					 input logic [N-1:0] PC_E, signImm_E, readData1_E, readData2_E,
					 output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E, 
					 output logic zero_E);

		logic [N-1:0] Sl2_output, mux_output;
		
		sl2 #(N) SL2 (signImm_E, Sl2_output);
		adder #(N) Add (Sl2_output, PC_E, PCBranch_E);
		mux2 #(N) Mux (readData2_E, signImm_E, AluSrc, mux_output);
		alu ALU (readData1_E,  mux_output, AluControl, aluResult_E, zero_E);
		
		assign writeData_E = readData2_E;
		
endmodule 