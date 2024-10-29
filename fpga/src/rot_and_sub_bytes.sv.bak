/*
	Marina Ring, mring@g.hmc.edu, 10/27/2024
	Module to rotate bytes within a word
*/

module rot_and_sub_bytes(
	input logic [31:0] w,
	input logic clk,
	output logic [31:0] y,
);

	// shift left by one and then substitute byte 
	sbox_sync(w[23:16], clk,  y[31:24]);
	sbox_sync(w[15:8], clk,  y[23:16]);
	sbox_sync(w[7:0], clk,  y[15:8]);
	sbox_sync(w[31:24], clk,  y[7:0]);
	
endmodule