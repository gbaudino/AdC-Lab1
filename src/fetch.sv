//fetch 

module fetch #(parameter N=64)
				 (input logic PCSrc_F, clk, reset,
				  input logic [N-1:0] PCBranch_F,
				  output logic [N-1:0] imem_addr_F);
			
		logic [N-1:0] adder_output, mux_output;
			
		mux2 #(N) Mux (adder_output, PCBranch_F, PCSrc_F, mux_output);
		flopr #(N) PC (clk, reset, mux_output, imem_addr_F);
		adder #(N) Add (imem_addr_F, N'('d4), adder_output);
		
endmodule 