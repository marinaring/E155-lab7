/*
	Marina Ring, mring@g.hmc.edu, 10/27/2024
	A module that uses the s-box to subsitute bytes within a word
*/

module sub_bytes(
	input logic [31:0] w,
	input logic 	   clk,
	output logic [31:0] y,
);

	sbox_sync b0(w[31:24], clk, y[31:24]);
	sbox_sync b1(w[23:16], clk, y[23:16]);
	sbox_sync b2(w[15:8], clk, y[15:8]);
	sbox_sync b3(w[7:0], clk, y[7:0]);
	
endmodule
