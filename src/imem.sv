// imem

module imem #(parameter N = 32)
				 (input logic [6:0] addr,
				 output logic [N-1:0] q);
	

	logic [N-1:0] ROM [0:127] ='{default: '0};
	initial begin

		ROM [0:102] ='{32'hf8000001,
						32'hf8008002,
						32'hf8000203,
						32'h8b050083,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8018003,
						32'hcb050083,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8020003,
						32'hcb0a03e4,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8028004,
						32'h8b040064,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8030004,
						32'hcb030025,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8038005,
						32'h8a1f0145,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8040005,
						32'h8a030145,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8048005,
						32'h8a140294,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8050014,
						32'haa1f0166,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8058006,
						32'haa030166,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8060006,
						32'hf840000c,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'h8b1f0187,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8068007,
						32'hf807000c,
						32'h8b0e01bf,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf807801f,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hb40000a0,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8080015,
						32'hf8088015,
						32'h8b0103e2,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hcb010042,
						32'h8b0103f8,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf8090018,
						32'h8b080000,
						32'hb4ffff42,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf809001e,
						32'h8b1e03de,
						32'hcb1503f5,
						32'h8b1f03ff,
						32'h8b1403de,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf85f83d9,
						32'h8b1e03de,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'h8b1003de,
						32'h8b1f03ff,
						32'h8b1f03ff,
						32'hf81f83d9,
						32'hd29bd5ba,
						32'hd2afd95b,
						32'hd2d8195c,
						32'hd2ffddbd,
						32'hf80003da,
						32'hf80083db,
						32'hf80103dc,
						32'hf80183dd,
						32'hb400001f};
		end	 

	assign q = ROM[addr];

endmodule
