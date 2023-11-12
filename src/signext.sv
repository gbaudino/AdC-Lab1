// sign extend

module signext (input logic [31:0] a,
					 output logic [63:0] y);

	always_comb
		casez(a[31:21])
		    11'b111_1100_00?0: y = {{55{a[20]}}, a[20:12]};
		    11'b101_1010_0???: y = {{45{a[23]}}, a[23:5]};
		    11'b110_1001_01??: y = {48'b0, a[20:5]};
		    default : y = '0;
		endcase
	
endmodule 
