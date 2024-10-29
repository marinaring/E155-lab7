/*
	Marina Ring, mring@g.hmc.edu, 10/27/2024
	This module applies the routine for expanding a round key
*/

//   Equivalently, the values are packed into four words as given
//        [127:96]  [95:64] [63:32] [31:0]      w[0]    w[1]    w[2]    w[3]

module expand_key(
	input logic [127:0] key,
	input logic clk, 
	input logic [31:0] rcon,
	output logic [127:0] y
);
	logic [127:0] rot_key;
	logic [31:0] w4, w5, w6, w7, sub_rot_w4, sub_rot_w5, sub_rot_w6, sub_rot_w7;

	rot_and_sub_bytes(key[31:0], clk, w3);
	
	// w[i] = w[i - Nk] xor rot_and_sub_word(w[i - 1]) xor Rcon(i/Nk) when i is a multiple of Nk
	assign w4 = key[127:96] ^ w3 ^ rcon;
	
	// w[i] = w[i - Nk] xor w[i - 1]
	assign w5 = key[95:64] ^ w4;
	assign w6 = key[63:32] ^ w5;
	assign w7 = key[31:0] ^ w6;
	assign y = {w4, w5, w6, w7};

endmodule